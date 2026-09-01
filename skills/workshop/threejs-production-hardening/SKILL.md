---
name: threejs-production-hardening
description: Three.js and WebGL production hardening - GPU resource teardown, context-loss recovery, visibility gating, DPR capping, reduced-motion, React host lifecycle. Use when shipping a 3D component into a real product, embedding WebGL in a page that also does other things, or fixing leaks, jank, and battery drain in an existing scene.
---

# Three.js Production Hardening

The API skills (`threejs-fundamentals` and friends) get a scene rendering. This one keeps it
alive in a real product: a page with routes, tabs, a laptop on battery, and a user who scrolls
past your canvas and never comes back.

Nothing here is exotic. It is the difference between a demo and a component you can hand a
client, and it is almost always what breaks first.

## The contract

Every shipped WebGL component owes the host page these behaviours. Skipping any one of them
produces a bug that shows up days later, in someone else's code, blamed on something else.

| Requirement | Failure if skipped |
|---|---|
| Release every GPU resource on teardown | Leak per mount. SPA route changes eventually crash the tab |
| Stop the loop when offscreen or tab-hidden | Battery drain, fans, background CPU on a canvas nobody sees |
| Cap device pixel ratio | 3x DPR phones render 9x the pixels and thermally throttle |
| Handle resize | Stretched, blurry, or letterboxed canvas |
| Respect `prefers-reduced-motion` | Accessibility failure, and a vestibular trigger |
| Survive context loss | Permanently black canvas after a GPU reset or tab backgrounding |
| Work on coarse pointers | Hover-only interaction is dead on touch |
| Clean console | Warnings hide the real error when something else breaks |

## Quick Start

The whole contract in one mountable unit. This is the shape to reach for by default.

```javascript
import * as THREE from "three";

export function mountScene(container) {
  const reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)");

  const renderer = new THREE.WebGLRenderer({ antialias: true, powerPreference: "high-performance" });
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2)); // cap: see DPR section
  container.appendChild(renderer.domElement);

  const scene = new THREE.Scene();
  const camera = new THREE.PerspectiveCamera(50, 1, 0.1, 100);
  camera.position.z = 5;

  const mesh = new THREE.Mesh(
    new THREE.IcosahedronGeometry(1, 4),
    new THREE.MeshStandardMaterial({ color: 0x4477ff, roughness: 0.35 }),
  );
  scene.add(mesh, new THREE.DirectionalLight(0xffffff, 2), new THREE.AmbientLight(0xffffff, 0.4));

  // --- sizing -------------------------------------------------------------
  const resize = () => {
    const { clientWidth: w, clientHeight: h } = container;
    if (!w || !h) return;
    renderer.setSize(w, h, false);
    camera.aspect = w / h;
    camera.updateProjectionMatrix();
  };
  const ro = new ResizeObserver(resize);
  ro.observe(container);
  resize();

  // --- render loop, gated -------------------------------------------------
  let frame = null;
  let visible = false;
  const clock = new THREE.Clock();

  const tick = () => {
    frame = requestAnimationFrame(tick);
    const dt = clock.getDelta();
    if (!reduceMotion.matches) mesh.rotation.y += dt * 0.6;
    renderer.render(scene, camera);
  };

  const start = () => {
    if (frame !== null) return;
    clock.start();          // avoid a huge first delta after a pause
    frame = requestAnimationFrame(tick);
  };
  const stop = () => {
    if (frame === null) return;
    cancelAnimationFrame(frame);
    frame = null;
  };
  const sync = () => {
    const shouldRun = visible && document.visibilityState === "visible";
    if (shouldRun) start();
    else {
      stop();
      renderer.render(scene, camera); // leave one correct frame on screen
    }
  };

  const io = new IntersectionObserver(([entry]) => {
    visible = entry.isIntersecting;
    sync();
  }, { threshold: 0 });
  io.observe(container);

  document.addEventListener("visibilitychange", sync);
  reduceMotion.addEventListener("change", sync);

  // --- context loss -------------------------------------------------------
  const onLost = (event) => { event.preventDefault(); stop(); };
  const onRestored = () => { resize(); sync(); };
  const canvas = renderer.domElement;
  canvas.addEventListener("webglcontextlost", onLost, false);
  canvas.addEventListener("webglcontextrestored", onRestored, false);

  // --- teardown -----------------------------------------------------------
  return function dispose() {
    stop();
    io.disconnect();
    ro.disconnect();
    document.removeEventListener("visibilitychange", sync);
    reduceMotion.removeEventListener("change", sync);
    canvas.removeEventListener("webglcontextlost", onLost);
    canvas.removeEventListener("webglcontextrestored", onRestored);
    disposeScene(scene);
    renderer.dispose();
    canvas.remove();
  };
}
```

## Teardown

Three.js does not garbage-collect GPU memory for you. Dropping the last JavaScript reference to
a `Mesh` frees the JS object and leaks the VRAM behind it. You must call `.dispose()` on every
geometry, material, texture, and render target you created.

```javascript
export function disposeScene(root) {
  root.traverse((object) => {
    object.geometry?.dispose();

    const materials = Array.isArray(object.material)
      ? object.material
      : object.material ? [object.material] : [];

    for (const material of materials) {
      // Textures hang off arbitrary named slots; walk the values.
      for (const value of Object.values(material)) {
        if (value && value.isTexture) value.dispose();
      }
      material.dispose();
    }
  });
  root.clear();
}
```

Notes that cost people hours:

- **`renderer.dispose()` does not dispose scene contents.** It releases the renderer's own
  internal state. The traversal above is still required.
- **Shared assets.** If a texture or geometry is reused across components, disposing it in one
  teardown breaks the others. Own your assets, or reference-count them.
- **Render targets, `EffectComposer` passes, and controls** each need their own `.dispose()`.
  Post-processing is the most common leak after textures.
- **`forceContextLoss()`** is a last resort for reclaiming a context immediately. Call it after
  disposing, never as a substitute for disposing.

Verify with `renderer.info`:

```javascript
console.log(renderer.info.memory); // { geometries: 0, textures: 0 } after a clean teardown
```

Mount and unmount your component ten times in a row. Both counters must return to their
starting values. If they climb, you have a leak.

## Visibility gating

An unthrottled `requestAnimationFrame` loop on an offscreen canvas is pure waste. `rAF` already
pauses when the *tab* is hidden, but not when your canvas is merely scrolled out of view, behind
a modal, or on an inactive route — so both signals are needed:

- `IntersectionObserver` — is the canvas in the viewport?
- `visibilitychange` — is the tab in the foreground?

Render exactly one frame when you stop. A canvas that halts mid-update keeps whatever partial
state it had; one clean render leaves a correct still image.

## Device pixel ratio

`setPixelRatio(window.devicePixelRatio)` is the single most common performance mistake in
shipped Three.js. Cost scales with the square of the ratio: a DPR-3 phone renders 9x the pixels
of a DPR-1 display, on the weakest GPU in your user base.

```javascript
renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
```

Cap at 2. The visual difference above 2 is negligible at normal viewing distance; the cost is
not. For full-screen or heavy post-processing, cap at 1.5 and measure. Re-apply the cap on
resize — moving a window between a laptop and an external display changes DPR.

## Reduced motion

`prefers-reduced-motion` is a real accessibility requirement, not a nicety. For WebGL it rarely
means "show nothing" — it means remove vestibular triggers while keeping the visual.

Freeze or damp: continuous rotation, orbiting cameras, parallax tied to pointer or scroll,
oscillating displacement. Keep: static geometry, lighting, colour, and a single settled frame.

```javascript
const reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)");
const speed = reduceMotion.matches ? 0 : 1;
```

Listen for `change` — users toggle it at runtime, and a component that only reads it at mount
ignores them.

## Context loss

The browser can revoke a WebGL context at any time: GPU driver reset, too many live contexts,
memory pressure, a backgrounded mobile tab. Unhandled, the canvas goes black permanently.

```javascript
canvas.addEventListener("webglcontextlost", (event) => {
  event.preventDefault();  // REQUIRED — without it the context is never restored
  stop();
}, false);

canvas.addEventListener("webglcontextrestored", () => {
  resize();
  sync();
}, false);
```

`event.preventDefault()` is what tells the browser you intend to recover. Omit it and
`webglcontextrestored` never fires. Three.js re-uploads geometries, materials, and textures it
still holds; anything you generated by hand into a render target must be regenerated.

Force the path in testing:

```javascript
const ext = renderer.getContext().getExtension("WEBGL_lose_context");
ext.loseContext();
setTimeout(() => ext.restoreContext(), 1000);
```

## React host lifecycle

Two failure modes dominate. First, Strict Mode in development mounts, unmounts, and remounts
every effect — a component that leaks on unmount leaks immediately and visibly, which is a
feature. Second, an effect with unstable dependencies rebuilds the whole renderer on every
parent render.

```jsx
import { useEffect, useRef } from "react";

export function Scene() {
  const hostRef = useRef(null);

  useEffect(() => {
    const dispose = mountScene(hostRef.current);
    return dispose;         // cleanup MUST fully tear down
  }, []);                   // empty deps: build once

  return <div ref={hostRef} style={{ width: "100%", height: "100%" }} />;
}
```

Drive changing values through refs or imperative setters, never by re-running the mount effect.
Give the host element a real height — a container that computes to `0` renders nothing, and it
is the most common "my scene is blank" cause.

## Sandboxed embedding

When the effect is a complete self-contained HTML document rather than a React component,
mounting it in an `allow-scripts`-only `srcDoc` iframe isolates its globals, event handlers, and
WebGL context from the host app, and makes teardown absolute: remove the iframe and everything
it allocated dies with it.

The trade-off is real: postMessage for anything crossing the boundary, no shared context, and
its own paint cost. Use it for third-party or authored documents you do not want to rewrite; use
a component for anything you own.

## Verification

Run this before calling a 3D component done. It is the checklist the failures above map to.

1. Mount/unmount ten times — `renderer.info.memory` returns to baseline.
2. Scroll the canvas offscreen — frame loop stops (breakpoint or counter).
3. Switch tabs — loop stops, and resumes correctly with no time jump.
4. Resize the window, including across displays of different DPR.
5. Throttle to mobile CPU and check the frame budget on a coarse-pointer device.
6. Enable reduced motion at the OS level, with the page already open.
7. Force context loss and confirm recovery.
8. Console clean — no warnings, no shader compile errors.

## See Also

- `threejs-fundamentals` — renderer, camera, and scene setup
- `threejs-postprocessing` — `EffectComposer` passes each need disposal
- `threejs-interaction` — pointer input, which must handle coarse pointers
- `threeui-catalog` — MIT components that already implement this contract
- `fixing-motion-performance` — general web animation performance
- `fixing-accessibility` — general accessibility beyond reduced motion

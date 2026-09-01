---
name: threeui-catalog
description: ThreeUI Community - 43 MIT-licensed WebGL, Three.js, Canvas 2D, and CSS components (buttons, backgrounds, heroes, galleries, loaders) usable in client work for free. Use when a project needs a polished 3D or generative visual effect and building it from scratch is not the best use of time, or when picking between shipping the npm package and copying a component's source.
---

# ThreeUI Community Catalog

43 production-grade interactive components, MIT licensed, free to use commercially in client
work. Reach for this before hand-building a hero background, an animated button, or a generative
visual: there is a decent chance a hardened implementation already exists.

- Browse: https://threeui.com
- Source: https://github.com/MengTo/threeui
- Package: `@designcodeio/threeui`

## Licensing

Read this once, then stop worrying about it.

The code is **MIT**. Use it commercially, modify it, ship it to clients, charge for the work
built on top of it. No fee and no permission needed. The sponsorship tiers advertised in the
README buy banner placement; they are not a licence, and they have no bearing on your right to
use the components.

Three real obligations:

- **Keep the MIT notice** when you ship substantial portions of the code. One `LICENSE` file, or
  a header comment in the copied source. This is the whole cost.
- **Bundled fonts are SIL OFL 1.1**, not MIT. Separate terms; usually fine, but check before
  redistributing a font file.
- **Remote thumbnails and previews served from threeui.com are not redistributable.** Do not
  hotlink or copy the catalog imagery into a client deliverable.

Pro and Beta components are not in the repo and are gated behind an entitlement CLI. Out of
scope — stay in the Community set.

## Two ways to use it

**Install the package** when you want a component as-is and want updates:

```bash
npm install @designcodeio/threeui
```

```tsx
import { AtTheHorizon } from "@designcodeio/threeui";
import "@designcodeio/threeui/style.css";
```

Prefer the subpath import to keep the dev import graph small:

```tsx
import { AtTheHorizon } from "@designcodeio/threeui/components/AtTheHorizon";
```

**Copy the source** when the client needs to own the code, the effect needs real modification, or
you cannot add a dependency. MIT permits this outright. Keep the notice, and take the whole
implementation rather than an approximation — these effects are tuned, and a rewrite from a
screenshot loses the tuning.

## The version trap

The package depends on **three separate Three.js versions simultaneously**, aliased in
`package.json`:

```json
"dependencies": { "three128": "npm:three@0.128.0", "three165": "npm:three@0.165.0" },
"peerDependencies": { "three": ">=0.149 <1" }
```

Components were authored against different releases and pinned rather than migrated. Consequences
worth knowing before you commit:

- Copying a component's source means inheriting its Three.js version. A component written for
  r128 uses pre-r155 lighting and colour management and will look wrong on a modern default.
- Mixing components from different eras in one bundle can ship two copies of Three.js.
- If your project already pins a Three.js version, check the component's era first. The runtime
  column below tells you.

Colour and lighting changed materially at r152 (colour management on by default) and r155
(lighting units). An r128 component dropped into an r165 project is the most likely source of
"it looks washed out".

## Catalog

Grouped by runtime, because that determines what it costs you to adopt.

**Pure DOM / CSS — no WebGL, no dependency, cheapest to adopt**
`rectangle-buttons` · `circle-buttons` · `character-carousel` · `performance-gauges` ·
`sketchbook` (CSS 3D)

**Canvas 2D — no WebGL context, no Three.js**
`typography-vortex` · `globe-study` (Text Path Studies) · `gallery-heading` ·
`diagnostics-panel` · `wireframe-forms` · `brand-orbs` · `semantic-bloom` ·
`engraved-certificate` · `article-headings`

**Raw WebGL / WebGL2 — hand-written GLSL, no Three.js dependency**
`liquid-form` · `matrix-field` (Laser) · `crt` · `elements` · `liquid-metal-button` ·
`star-portal` (Shader Buttons) · `constellation-field` · `energy-orb` (Globe) · `spark-badge` ·
`uplink-loader`

**Three.js — check the version**
`gallery` (r149) · `japanese-tower` (Country Towers, r149) · `bookshelf` (r165) ·
`structure-flow` (r128–r160) · `warp-field` (r128) · `woven-cloth` (r160) ·
`animated-top-dock` (r128) · `portal-field` (r134) · `predictive-arc` (r128) ·
`skeuomorphic-toggle`

**Complete authored HTML pages — full documents, embed via iframe**
`kage-landing-page` · `complete-shelf-landing-page` · `bestsellers-book-showcase` ·
`meng-to-sketchbook-landing-page` · `sylva-hero` · `sylva-living-world` · `temple-night` ·
`landscape` · `koi-studies`

The last group are whole pages, not components. They are embedded through an `allow-scripts`
`srcDoc` iframe rather than mounted as React. Treat them as reference implementations or
full-page takeovers, not as things to drop into an existing layout.

## Choosing

- Need a **button or control**? Start in DOM/CSS or Raw WebGL. No Three.js dependency, no
  version negotiation.
- Need a **background or hero**? Canvas 2D is cheapest; Raw WebGL is richer; Three.js only if
  the effect is genuinely dimensional.
- Already have Three.js in the project? Match the component's era or budget time to port it.
- Prototyping for a pitch? Install the package. Do not copy source until the direction is agreed.

## Hardening

The components implement a real production contract — teardown, visibility gating, reduced
motion, resize, context loss. If you copy source, **copy the lifecycle code too**, not just the
renderer. That plumbing is most of what separates these from a CodePen demo.

If you are writing an effect from scratch instead, `threejs-production-hardening` documents the
same contract independently.

## See Also

- `threejs-production-hardening` — the lifecycle contract these components implement
- `threejs-shaders` — GLSL, for the Raw WebGL components
- `threejs-fundamentals` — scene setup, for the Three.js components
- `webgl-threejs` / `3d-experience-design` — pipeline and concept decisions

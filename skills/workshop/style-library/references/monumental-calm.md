# Monumental Calm

**In one line:** places at architectural scale in silence and weather: a tiny human figure, symmetrical or one-point wide framing, raw heavy materials, and one warm light in a cold world.

**Family:** found in the research.
**Exemplified by:** Kevin's Cosmos Future Architecture board (about 65 saves: black-glass boxes over cliffs, concrete bunkers in rock, monoliths over still water, a cavernous stair with a lone figure, an amber window in a rust monolith), the Kasane template on aura.build by Aksonvady Phomhome (the drowned Neo-Edo city in fog under a red sun, reached by walking through a gate), Ledger Stax (a night megacity seen from above, warm light bleeding from its centre).

## Use it when / not when

- **Use when:** a story world needs establishing plates, a Pulse site needs its approach or district views, a brand needs to feel permanent and quiet, or a scene must set scale before characters enter. This is the Pulse establishing-shot standard.
- **Not when:** the brief needs energy, crowds or humour, the place is intimate (a kitchen, a car interior), or the pack's world is cosy or rural-warm. On an author world the architecture, era and weather come from canon; offer this framing, never impose brutalist forms on a world the text describes otherwise.

## Signature cues

- **Composition:** wide and low; symmetrical or one-point perspective; horizon on the lower third; one human figure at 1:40 to 1:100 of frame height for scale; strong vertical or horizontal mass; 2.39:1 framing for plates, 16:9 for web heroes. Foreground layers (mist, water, a rail) for depth.
- **Palette (cold neutrals, one warm light):**

| Role | Name | Hex |
|---|---|---|
| Mass | Board-formed concrete | #8A8986 |
| Shadow | Basalt | #1E2022 |
| Atmosphere | Fog white | #C9CDD0 |
| Water | Still slate | #4A5559 |
| Signal | Amber window | #F2A541 |
| Signal (alt) | Red sun | #D9452B |

- **Materials:** board-formed concrete with tie holes, black basalt, smoked glass, wet stone, corten steel, moss on rock, water as a mirror, snow in seams.
- **Light:** overcast, blue hour or night; atmospheric perspective that fades distant forms to fog; the single warm source is interior light through one opening or a low sun disc through fog. No golden-hour wash over everything.
- **Type pairing (suggestions):** a refined serif italic for in-world lines (Newsreader Italic, Instrument Serif Italic), a condensed grotesk for place names in caps (Barlow Condensed, Neue Haas Grotesk Display Condensed), a mono for coordinates (IBM Plex Mono). Type sits small and low, never fighting the mass.
- **Motion:** travel, not decoration: a slow walk forward through a gate, a push across water, a crane rising over a wall. 10 to 20 seconds per move, ease in and out over seconds; fog drifts, water ripples, one light flickers.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Generic Midjourney-era megastructure with no scale | One human figure at a stated size; real materials named |
| Warm and cold mixed everywhere | Cold world, one warm source; state the hex of the warm light |
| Busy skies, god rays, lens flare | Overcast or fog; light comes from one opening |
| Tilted dramatic angles | Level camera, symmetrical or one-point; tilt is a story beat, not a default |
| A place that contradicts its own geography across shots | Block it in Blender MCP first (Layer 1), shoot every plate from that block |
| Text across the mass | Type small, low, in the negative space of sky or water |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Wide establishing photograph of {PLACE: e.g. "a monolithic concrete archive set into a sea cliff"}, {ARCHITECTURE: masses and openings}, {MATERIALS}, {WEATHER: fog | overcast | blue hour | night rain}, one lone figure at the base for scale, {PERSPECTIVE: symmetrical | one-point}, level camera, horizon on the lower third, still water reflecting the mass, the only warm light is {WARM_SOURCE} in {WARM_COLOUR}, atmospheric perspective, 24mm, cinematic still, fine grain --ar 21:9 --raw --s 75 --no lens flare, god rays, crowds, text --sref {SREF_CODE} --sw {100-250}
```

For Midjourney V8.2, the full set for this style (hero still, series variant, Edit Model instruction for the series, video beat and a filled example) is in `midjourney-legendary` (`references/library-styles.md`, Monumental Calm), with the parameter recipes and Kevin's sref library.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a wide, quiet establishing photograph of {PLACE}. It is built of {MATERIALS} with {ARCHITECTURE}. The weather is {WEATHER}, so distant parts fade into fog. Keep the camera level and the view {PERSPECTIVE}, horizon low in the frame. Put one small person at the base so the scale is clear. Everything is cold grey and blue except one warm light: {WARM_SOURCE}, coloured {WARM_COLOUR} ({WARM_HEX}). Still water in the foreground mirrors the building. No sun rays, no lens flare, no crowds, no text.
```

Series line: attach the approved plate and the Blender block render and say "Same place, same materials, same weather and warm light. Change only the camera to {POSITION from the block}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 10-second, 21:9 image-to-video clip from the attached establishing still, photographic cinematic realism. Preserve the architecture, its proportions, the materials, the fog, the lone figure and the single warm light exactly. Camera axis faces the structure head-on throughout. At 0-4 seconds a slow forward dolly, 2 metres, low over the water; fog drifts left. At 4-8 seconds continue the dolly; the figure takes three steps toward the opening. At 8-10 seconds the warm light in the opening brightens slightly as the camera settles, then hold. Sound: wind, water lapping, a distant low drone, one far-off bell at 8 seconds. No birds, no added people, no lens flare, no text.
```

### UI or web section (structured brief)

```text
Build statement: the approach sequence of a world site, scroll moves the camera through {PLACE}, {STACK}.
Tokens: Ground "Basalt" #1E2022, Atmosphere "Fog" #C9CDD0, Text "Paper" #EDEBE6, Secondary rgba(237,235,230,0.62), Signal "{WARM_NAME}" {WARM_HEX} (progress line and one CTA only); controls filled with soft shadow, no outline strokes.
Type: in-world line Newsreader Italic 400 at clamp(22px, 2.6vw, 40px); place names Barlow Condensed 600 uppercase at clamp(14px, 1.2vw, 18px) tracking 0.18em; coordinates IBM Plex Mono 11px.
Layout: full-bleed canvas at 100svh, pinned for {N} viewport heights; text bottom-left at 6vw from edges; chapter progress bar along the bottom, 2px.
Copy: chapter "01 / {CHAPTER_NAME}"; lines revealed at 30 and 70 percent progress ("{LINE_1}", "{LINE_2}"); coordinates "{LAT} {LONG} / {PLACE} / {YEAR}"; controls "SOUND OFF", "SKIP PASSAGE", "REPLAY".
Device (one): scroll-scrubbed camera passage through the gate into the vista (GSAP ScrollTrigger scrub 1).
Accessibility: skip control first in tab order, reduced motion replaces the passage with three still plates and the lines as text, sound off by default, AA contrast on lines over fog via a 40 percent basalt scrim.
Performance: canvas capped at 1.5 device pixel ratio, assets under 6MB total with a loader showing honest progress, 60fps target on an M1, LCP under 2.5s.
```

### 3D / Three.js scene note

Block the geography in Blender MCP or Unreal MCP first so every plate and the live scene agree. Live: exponential fog, a cold HDRI, one warm point or area light inside the opening, a reflective water plane (planar reflection or screen-space), instanced rock and architecture, and a spline camera path driven by scroll. Build with `threejs-geometry`, `threejs-lighting`, `threejs-materials`, `threejs-animation`, `threejs-interaction`; fog grain and slight bloom on the warm light only with `threejs-postprocessing`; budget with `threejs-production-hardening`.

## Gate notes

`quality-gate` checks this style hardest on: scale cue present, one warm light, level composition, geography consistent across plates, and a readable in-world line. On an author world the Fidelity Gate runs first (place and era from canon). `immersive-world-site` owns the passage pattern; `minimalist-ui` covers the overlay chrome.

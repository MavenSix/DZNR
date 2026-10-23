# Site brief template (a world site)

The `prompt-architecture` slots for an immersive world site. Fill from `pack.md`, the site plan and the
canon. The worked example underneath is an invented world, not a client's or an author's.

```markdown
## 01 STATEMENT
Build an immersive world site for {WORLD}, {DISTRICTS | CHAPTERS} model, using {STACK: e.g. Vite, TypeScript, Three.js, GSAP ScrollTrigger}.

## 02 THESIS
{The world line, quoted or approved.} Every screen serves it by {rule}.

## 03 STACK AND JOBS
- Three.js: the scene, camera rig, hotspots
- GSAP ScrollTrigger: scroll mapped to camera travel
- {audio library}: ambient bed, off by default

## 04 SYSTEM
Tokens: {name} {hex} ... (neutrals plus one signal; alarm only for errors). Faces: display {face}, text {face}, labels {mono}. HUD: chamfer 8px, corner ticks 6px, hairlines only inside instrument graphics.

## 05 SCALE
Display clamp({min}, {vw}, {max}); labels {px} uppercase, tracking {em}. Camera {mm equivalent}, eye height {m}.

## 06 SPATIAL MODEL
{Districts: list with adjacency | Chapters: list with order}. Switcher {position}; minimap {yes/no}; section dots {yes/no}.

## 07 STRUCTURE (one device each)
0. Loader: honest progress ({asset count})
1. Prologue: {the walk-in}, device: {e.g. scroll walks through the gate}
2. {District or chapter}: device: {...}
...
N. Keepsake: {object}, device: {download | reveal}

## 08 COPY (real, in-world, cited)
{Every line, with its canon citation.}

## 09 PER-SECTION SPECS
{Spans, ratios, states, hotspot counts.}

## 10 MOTION
Camera travel {ms per unit scroll | scrub}, eases {named}, transitions {named}; one signature beat per section.

## 11 EXCLUSIONS
{No invented canon; no marketing copy; no hue outside the pack; no autoplay sound.}

## 12 FLOOR (accessibility and respect)
Sound off by default and toggle; Skip; Replay; Motion full / reduced / off; prefers-reduced-motion honoured; keyboard path; focus visible; AA contrast; captions for any voice.

## 13 BUDGET
LCP < 2.5s (poster first), CLS < 0.05, initial JS < 250KB gz, < 150k triangles, DPR cap 2 (1.5 mobile), 60fps target with degrade, no-WebGL fallback.
```

## Worked example (invented world)

```markdown
## 01 STATEMENT
Build an immersive world site for "Saltline", a chapters model, using Vite, TypeScript, Three.js and GSAP ScrollTrigger.

## 02 THESIS
"The sea keeps the town's ledger." Every screen shows something the tide has recorded.

## 04 SYSTEM
Ground "Brine" #0E1416, Surface "Slate" #1B2326, Ink "Salt" #E9E6DF, Secondary rgba(233,230,223,0.62), Signal "Buoy" #F26A1B (tide markers only). Display Söhne Breit 600; text Newsreader italic; labels JetBrains Mono 11px. HUD chamfer 8px; tide gauge drawn in 1px hairlines.

## 06 SPATIAL MODEL
Chapters: 01 The Seawall, 02 The Drowned Market, 03 The Lighthouse Keeper, 04 The Ledger Room, 05 Low Tide. Chapter rail top, counter "01 / 05" top right, section dots right edge.

## 07 STRUCTURE
0. Loader "Charting the harbour 9/14"
1. The Seawall: scroll walks the visitor along the wall at dusk; one line of copy appears per 20 percent of scroll
2. The Drowned Market: a pinned scene, hotspots on six stalls, each a relic with its tide date
3. The Lighthouse Keeper: a dossier, portrait from the identity lock, epithet and three-line bio
4. The Ledger Room: the tide gauge as the HUD, readout "HIGH WATER 04:12" tied to the visitor's clock
5. Low Tide: keepsake, a tide ticket with the visitor's arrival time set in the type layer, PNG download

## 12 FLOOR
Sound off by default, toggle top left; "Skip passage" top right; "Replay passage" at the end; Motion full / reduced / off in the footer, reduced on arrival when the OS asks; every hotspot is a button with a label.
```

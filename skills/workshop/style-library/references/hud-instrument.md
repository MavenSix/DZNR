# HUD Instrument

**In one line:** the interface as an instrument: monochrome hairline graphics, radial gauges, mono numerals and data that means something, with one accent used as a signal; the disciplined end of Cybercore.

**Family:** found in the research.
**Exemplified by:** Kevin's Cosmos Interface board (about 90 saves: hairline radars, concentric rings with ticks, polar day charts, a red record button on black, dot-matrix widgets), Ledger's Stax brand world (brand.ledger.com/ledger-stax: chamfered frames, bracketed numbering, a minimap, computed type Brut Grotesque plus Hmalphamono), @tonythetechie with @augma.im (a vault app whose one success beat is a full-grid white flash), @jtansill (the Brain Monitor: per-agent colour pills, clash alerts in red), @atsmatrix (a strict five-column HUD strip under a particle graph), hyliox.io (corner micro-labels such as a version string and a live dot).

## Use it when / not when

- **Use when:** the screen reports state (agent runs, spend, telemetry, a story world's diegetic devices), a Pulse world needs in-world UI (a minimap, an inventory, a field recorder), or DZNR OS needs a view that proves work is happening.
- **Not when:** the reader needs warmth and long-form reading comfort, the data has no meaning (decoration-only gauges), or the audience is not literate in dashboards. On an author world it is offered for diegetic interfaces when the world has that technology; never put a HUD on a 1962 story.

## Signature cues

- **Composition:** a grid of instruments, each with one job: one hero instrument (a radial gauge, a graph, a minimap) and three to six small ones in a strict strip. Corner brackets frame the viewport. Bracketed numbering [01] to [04], coordinates, version strings in corners. 70 percent of the frame black and quiet.
- **Palette (monochrome plus one signal; status colours only by meaning):**

| Role | Name | Hex |
|---|---|---|
| Ground | True black | #07090C |
| Panel | Slate | #141B26 |
| Line | Hairline white | rgba(255,255,255,0.22) |
| Text | Instrument white | #E8ECEF |
| Signal | Signal orange | #FF5A1F |
| Alert | Alarm red | #E2364B |

- **Materials:** light on glass, not objects: 1px hairlines, tick marks, dot matrices, phosphor glow at low strength, scanlines at 2 to 3 percent, no textures or bevels except on keys meant to be pressed.
- **Light:** emitted only. Bloom radius small (strength 0.3 to 0.6) on the signal and on live values; everything else flat.
- **Type pairing (suggestions):** a grotesk for labels and headings (Brut Grotesque, Neue Haas Grotesk, Söhne); a mono for every number (JetBrains Mono, Berkeley Mono, IBM Plex Mono) with tabular figures; a dot-matrix face (Doto) for one live readout. Labels 9 to 11px uppercase, tracking 0.2 to 0.3em.
- **Motion:** values tick, rings rotate at different slow speeds (60s, 90s, 140s per turn), radial reveals sweep 360 degrees in 800ms, and there is one memorable success or alert beat (a full-grid flash, a red cell). Nothing floats for decoration.

**DZNR OS reconciliation (decision 218):** hairlines belong in instrument graphics (gauges, dials, charts, reticles, minimaps). Cards, pills, tags and chips in DZNR OS chrome are separated by fill plus a soft two-layer shadow, with no outline stroke; edges return only under Increase Contrast. And follow Kevin's Ledger spend pattern: each figure carries a one-line meaning, one plain sentence of insight sits under the chart, and the basis of each number (billed, measured, estimated) is visible.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Gauges that measure nothing | Every instrument names its quantity, unit and range; delete any that cannot |
| Spectacle without a reading (the "AI slop" comment under @atsmatrix's reel) | A one-line caption stating what the visual proves; label in scene |
| Rainbow of accent colours | One signal; status colours only for status (red is alert, nothing else) |
| Outline strokes on every card in DZNR OS | Fill plus soft shadow on cards and pills; keep hairlines for the instruments |
| Numbers in a proportional face jittering as they tick | Mono, tabular figures, fixed width per digit |
| Glow on everything | Bloom only on the signal and live values, strength 0.6 or less |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Fictional user interface screen, {DEVICE_OR_CONTEXT}, monochrome white hairline instrument graphics on true black, one hero {HERO_INSTRUMENT: radial gauge with tick marks | wireframe globe | polar 24-hour chart}, a strip of {N} small instruments ({LIST}), tiny uppercase mono labels, bracketed section numbers, corner brackets framing the screen, one {SIGNAL_COLOUR} signal element on {SIGNAL_ELEMENT}, precise, film-UI craft, flat front-on view --ar 16:9 --raw --s 50 --no gradient, purple glow, 3d, people --sref {SREF_CODE} --sw {100-250}
```

For Midjourney V8.2, the full set for this style (hero still, series variant, Edit Model instruction for the series, video beat and a filled example) is in `midjourney-legendary` (`references/library-styles.md`, HUD Instrument), with the parameter recipes and Kevin's sref library.

Use stills like this as mood and reference only; build the real interface in code with real data.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a front-on image of a screen interface for {DEVICE_OR_CONTEXT}. True black background. Everything is drawn in thin white lines like a precision instrument: one large {HERO_INSTRUMENT} in the centre and a row of {N} small instruments along the bottom showing {LIST}. Tiny uppercase labels, numbers in a monospaced font, corner brackets around the screen. Only one element is coloured: {SIGNAL_ELEMENT} in {SIGNAL_COLOUR} ({SIGNAL_HEX}). No gradients, no purple glow, no people.
```

Series line: attach the approved screen and say "Same grid, same line weight, same labels style. Change only the hero instrument to {X} and the values."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 6-second, 9:16 photographic tabletop clip of a phone on a stand on black marble showing the attached interface, image-to-video. Preserve the interface layout, the line weights and the single {SIGNAL_COLOUR} element exactly; low-key light, 50mm, f/2, shallow depth of field. At 0-2 seconds hold; the rings rotate slowly and one value ticks. At 2-4 seconds a finger taps {CONTROL}; every key flashes white in a 120ms diagonal wave. At 4-6 seconds a slow 3 percent push-in on the screen as it settles into the home state, then hold. Sound: room tone, one soft haptic tick, a rising tone on the flash. No added text, no glare across the screen.
```

### UI or web section (structured brief)

```text
Build statement: one live status view for {SYSTEM, e.g. "agents working on one project"}, instrument style, {STACK}.
Tokens: Ground "Black" #07090C, Panel "Slate" #141B26, Line "Hairline" rgba(255,255,255,0.22) for instruments only, Text "Instrument" #E8ECEF, Secondary rgba(232,236,239,0.6), Signal "{SIGNAL_NAME}" {SIGNAL_HEX}, Alert "Alarm" #E2364B; panels separated by fill and a soft two-layer shadow, no outline strokes, radius 10px.
Type: headings Neue Haas Grotesk 500 at clamp(20px, 2vw, 28px); labels 10px uppercase tracking 0.24em; all numerals JetBrains Mono, tabular, hero figure clamp(40px, 6vw, 88px).
Layout: max width 1440px, 12 columns, 16px gap; hero instrument spans 8 columns, side column 4; bottom strip of 5 equal instruments.
Copy: title "{TITLE}" with a count line ("{N} runs since {DAY}, {M} agents"); each figure with a one-line meaning (e.g. "BILLED: what actually leaves an account"); one sentence of insight under the hero ("{INSIGHT}").
Device (one): the hero radial gauge sweeps from 0 to the live value in 800ms cubic-bezier(.2,.8,.2,1) on load, then ticks live.
Accessibility: every instrument has a text equivalent (value, unit, meaning) in the DOM; colour is never the only signal (alert also says ALERT); AA contrast on secondary text; reduced motion shows final values, no sweep.
Performance: instruments in SVG or one canvas, updates throttled to 4 per second, no backdrop-blur on scrolling content, LCP under 2.0s, CLS under 0.02.
```

### 3D / Three.js scene note

For a hero instrument in 3D (a particle graph, a globe): additive-blended points with a small bloom, CSS2D labels in mono anchored to nodes, a slow 40-second orbit or none, and the HUD strip as plain DOM over the canvas. Build with `threejs-geometry` (points, lines), `threejs-shaders`, `threejs-postprocessing`, `threejs-interaction`; check `threeui-catalog` for ready gauges and panels before hand-building; profile with `threejs-production-hardening`.

## Gate notes

`quality-gate` checks this style hardest on: legibility of meaning (every instrument names its quantity), one signal colour, mono numerals, and decision 218 in DZNR OS chrome. `industrial-brutalist-ui` (Tactical Telemetry and CRT Terminal mode) covers a rawer variant; `dataviz` governs real charts; `fixing-motion-performance` checks the ticking.

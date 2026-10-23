# Cybercore

**In one line:** dense, glowing data-world spectacle on near-black: particle clouds, force graphs, HUD strips and per-agent colour codes that make invisible systems visible, provided every glow carries a readable meaning.

**Family:** Kevin's list.
**Exemplified by:** @atsmatrix (the "blast radius" reel: five agent clusters as coral and cyan point clouds joined by white edges, a five-panel HUD strip), @jtansill (the "Brain Monitor": a cyan vault graph over a live agent access log), @tonythetechie with @augma.im (a working phone "VAULT" app after a 2009 Stark-tech concept), Ledger Stax at brand.ledger.com/ledger-stax (an isometric night megacity with game-HUD chrome), neon-oiran.aura.build (a portal push-in hero with HUD corner brackets).

For the disciplined, monochrome, hairline variant Kevin saves on his Interface board, use `hud-instrument.md`. This entry is the louder sibling.

## Use it when / not when

- **Use when:** the subject is a system, a network, agents, security, data flow, a sci-fi story world, a game landing, or a DZNR OS run view that must prove agents are working.
- **Not when:** the piece cannot state its point in one line (the @atsmatrix reel drew a top comment, "More AI slop. It looks pretty but it's slop", and "wtf does this even mean"), the audience needs calm, or an author's pack sets a pre-digital era. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** one hero visual (a graph, a city, a portal) filling 60 to 70 percent of the frame; an instrumentation strip on one edge (a 5-column bento with hairlines); in-scene labels at 9 to 11px annotating real nodes; one caption line that states the idea.
- **Palette (near-black plus one system accent, one alarm, per-entity colours as small pills only):**

| Role | Name | Hex |
|---|---|---|
| Ground | Void | #050608 |
| Panel | Slate | #141B26 |
| Panel raised | Slate 2 | #1A2533 |
| System accent | Cyan | #2DD4D8 |
| Entity core | Coral | #E8576B |
| Label | Amber mono | #F5B841 |
| Alarm | Clash red | #E2364B |

- **Materials:** additive-blend light, point clouds, glass keys with 2px bevels, emissive screens, sodium street light, wet asphalt reflections in city views.
- **Light:** emissive only: the data is the light source. Bloom strength 0.4 to 0.6, never higher; film grain 3 to 5 percent; slight moire if filmed off a real screen (the @jtansill phone capture reads as real because of it).
- **Type pairing (suggestions):** JetBrains Mono or Geist Mono for numbers, timestamps and labels; a condensed sans (Barlow Condensed or Space Grotesk) for section labels; Brut Grotesque-class grotesk for UI text (Ledger Stax computed Brut Grotesque plus Hmalphamono).
- **Motion:** slow orbit (40s per revolution), parallax between depth layers, and one memorable beat: the @tonythetechie full-grid white flash on success, a portal push-in, a clash alert firing red once.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Spectacle with no readable point | Write the one-line reading into the frame: a title, a caption, a labelled node |
| Purple-blue AI gradient glow | One system accent (cyan or amber), one alarm red, everything else near-black |
| Neon on every edge | Glow only what carries data; panels stay matte slate with hairlines |
| Fake data (lorem numbers, random graphs) | Use domain-true labels and values: token counts, real verbs (READ, WRITE, SEARCH), real units |
| Constant motion everywhere | Slow ambient drift plus one beat; hold everything else still |
| Bloom above 0.8 smearing labels | Bloom 0.4 to 0.6 and exclude the label layer from bloom |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Data visualisation still, {SYSTEM_SUBJECT} shown as {N} glowing point-cloud clusters in {ENTITY_COLOUR} with {SYSTEM_ACCENT} rim particles, thin white connecting lines at low opacity with additive glow where dense, tiny amber monospace labels on nodes reading {REAL_LABELS}, near-black #050608 void, slow orbital three-quarter view, shallow depth of field, subtle bloom, fine film grain, one caption-safe band at the bottom --ar {16:9 | 9:16} --style raw --s 150 --no purple gradient, lens flare, lorem text --sref {SREF_CODE} --sw {100-250}
```

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a dark data visualisation of {SYSTEM_SUBJECT}. Show {N} groups as clouds of glowing points: the core in {ENTITY_COLOUR} ({ENTITY_HEX}), the edges in {SYSTEM_ACCENT} ({ACCENT_HEX}). Join them with thousands of very faint white lines that glow brighter where they overlap. Put small amber labels on a few points. The background is almost black. Keep the glow soft. The picture must show one idea: {ONE_LINE_READING}. Leave a clear band at the bottom for a caption. No purple, no lens flare, no writing except the small labels.
```

For a series: attach the approved hero and say "Same palette, same particle look, same camera height. Change only {ONE_VARIABLE: the cluster count | the camera angle | which node is in alarm}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create an 8-second, 16:9 image-to-video clip from the attached still, cinematic 3D data visualisation. Preserve the clusters, palette, labels and the near-black background exactly. At 0-3 seconds the camera makes a slow orbit to the right, about 10 degrees, with gentle parallax between near and far particles. At 3-5 seconds a pulse of light travels along the lines from {SOURCE_CLUSTER} to every other cluster. At 5-7 seconds {ALARM_NODE} flashes {ALARM_COLOUR} once and the camera eases to a stop on it. At 7-8 seconds hold. Sound: a low ambient synth drone, a soft rising tone with the pulse, one dry alert tick on the flash. No purple, no lens flare, no added text.
```

### UI or web section (structured brief)

```text
Build statement: one observability section showing {SYSTEM} live, dark cybercore style, {STACK}.
Tokens: Ground "Void" #050608, Panel "Slate" #141B26, Panel raised "Slate 2" #1A2533, Accent "Cyan" #2DD4D8, Entity colours as 6px pills only (magenta #D946EF, amber #F5B841, violet #8B5CF6, green #22C55E), Alarm "Clash" #E2364B (alerts only), Text #E6EDF3, Secondary rgba(230,237,243,0.6), radius 10px, panels separated by fill steps and a soft shadow, no outline strokes on cards (DZNR OS decision 218), hairlines only inside charts.
Type: labels Geist Mono 11px uppercase tracking 0.14em; numerals Geist Mono 500 at clamp(28px, 3.5vw, 48px); section heads Space Grotesk 600 at 20px.
Layout: max width 1440px, 12 columns, 16px gap; left 4 columns are a bento of 5 panels (system, agents, alerts, budget bars, 30-minute sparkline); right 8 columns are the hero graph above the access log.
Copy: section label "LIVE / {SYSTEM_NAME}"; caption "{ONE_LINE_READING}"; log rows "{AGENT} READ {NOTE_PATH}"; alert "WRITE CLASH / {PATH}".
Device (one): a WebGL force graph with additive-blend particles; new log rows slide in from the top at 200ms ease-out.
Accessibility: every colour code has a text label, AA contrast on all text, alerts announced with aria-live="polite", prefers-reduced-motion freezes the graph and stops row animation.
Performance: graph capped at 20k points, 60fps on an M1 Air, pause rendering when off-screen, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

Points with a custom shader (size attenuation, additive blending, depthWrite false), LineSegments at 8 percent opacity for edges, CSS2DRenderer labels kept out of the bloom pass, UnrealBloomPass at 0.5, a film-grain pass at 4 percent, a 40-second orbit. Build with `threejs-geometry`, `threejs-shaders`, `threejs-postprocessing`, `threejs-interaction` (hover a node to read it); use `threeui-catalog` for HUD panels before hand-building any; harden with `threejs-production-hardening`. Reduced motion: a still frame with labels.

## Gate notes

`quality-gate` checks this style hardest on legibility of meaning (can a stranger say what it shows in one line), palette count (one accent, one alarm), real data labels, bloom kept off text. Point to `hud-instrument.md` when the brief wants restraint, `industrial-brutalist-ui` for terminal-style dashboards, and `fixing-motion-performance` for frame rate.

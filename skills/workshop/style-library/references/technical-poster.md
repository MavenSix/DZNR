# Technical Poster

**In one line:** a generated render turned into a designed plate by a hand-set type layer: vertical title, micro spec blocks, hairline leader callouts, registration marks, a seal, a barcode and a signature mark, often over a blueprint, cutaway or exploded-view lens.

**Family:** found in the research.
**Exemplified by:** @jasonscarecrowart (a 20-slide series of mech hands, each laid out as a Japanese technical plate with kanji titles, 6pt spec text, a red seal and a crow signature), @jenya.kruglova (the idea of one-word lenses that restyle a product photo as blueprint, cutaway or exploded view), @skvortsov.design (the NLRTM shipping concept: ISO container codes and port codes used as type texture), @ovyonlabs (ASEMIC: mono spec text set on circular paths around a portal).

## Use it when / not when

- **Use when:** an object, character or vehicle needs to read as engineered and documented; a series of variations needs one frame that holds them together; a story world needs artefact plates (a dossier page, a parts sheet, a field manual); a launch needs posters that carry information, not just mood.
- **Not when:** the subject is emotional or intimate (a portrait meant to feel close), the format is too small for micro-type (a 64px avatar, a story sticker), or the author's pack rules out graphic overlays on its images. On an author world it is offered as a plate treatment; the type layer then uses the world's own scripts and codes, never invented Japanese for a world that has none.

## Signature cues

- **Composition:** hero render occupies 55 to 65 percent of the plate, cropped hard (a hand entering from the top edge at a diagonal, a vehicle bleeding off the right). A vertical title column on one edge. Spec blocks parked in the negative space on a 6-column grid with 8mm margins on an A2 or 4:5 frame. Three to five leader lines from parts to numbered callouts, all at 0, 45 or 90 degrees. Registration marks in two or four corners. Seal and barcode bottom right, signature mark beside them.
- **Palette (neutrals plus one signal, sampled from the render):**

| Role | Name | Hex |
|---|---|---|
| Ground | Cool plate grey | #E3E6E8 |
| Paper (blueprint lens) | Drafting off-white | #F4F1EA |
| Ink | Plate black | #141414 |
| Secondary ink | Spec grey | #6B6E72 |
| Signal | Seal crimson | #9E1F2C |
| Blueprint lens ground | Cyanotype | #1F3B5C |

- **Materials:** in the render, what the subject is made of (chipped enamel, exposed servos, bundled red cabling, brass fittings); on the plate, flat ink only: 0.25pt hairlines, solid seal, no gradients, no drop shadows. Optional uncoated-paper grain at 3 to 4 percent.
- **Light:** in the render, a soft overhead softbox on a seamless ground, crisp detail, no glow. In the blueprint lens, none: linework at 0.5pt with 0.25pt hidden lines, orthographic projection.
- **Type pairing (suggestions):** a condensed grotesk for the title and part names (Neue Haas Grotesk Display Condensed, Druk Text, or Monument Grotesk Mono for a technical register); a mono for spec blocks (IBM Plex Mono, JetBrains Mono) at 6 to 7pt; a CJK face where the world uses it (Noto Sans JP or Source Han Sans, set vertically). Numbers tabular.
- **Motion:** if it moves, the plate builds: the render settles, then leader lines draw from the part outward in sequence (120ms each), callout numbers count in, the seal stamps last with a 2-frame scale overshoot. The render itself stays still.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Asking the model to write the kanji, specs and callouts | Generate the render clean, with empty space reserved; set every word by hand in Figma or code |
| Fake text that says nothing ("LOREM SYSTEM 3000") | Write real micro-truth: part counts, weights, materials, domain codes (ISO container type, port code, a world's own serials) |
| Leader lines at random angles crossing each other | 0, 45, 90 degrees only; no crossings; each line ends in a 1.5pt dot on the part |
| Six accent colours on the plate | One signal (the seal, the hero part, one cable colour); everything else ink and grey |
| Decorative Japanese in a world with no Japan | Use the world's own script, codes and language; vertical title only where it is native |
| Each plate laid out differently | Lock one grid; only the render and the colourway change across the series |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Studio render of {SUBJECT}, {MATERIALS}, {DETAILS: three mechanical or material specifics}, entering frame from the {EDGE} at a diagonal, cropped at {CROP_POINT}, pale cool-grey seamless background, soft overhead softbox, crisp detail, product-catalogue photography, 100mm, large empty area on the {SIDE} for typography --ar 4:5 --style raw --s 75 --no text, letters, logo, watermark, glow --sref {SREF_CODE} --sw {100-250}
```

Blueprint lens: `Exploded-view technical illustration of {SUBJECT}, every component separated along its assembly axis with even spacing, 0.5pt black linework on {PAPER_COLOUR} paper, orthographic three-quarter view, no shading, no gradients, one {SIGNAL_COLOUR} hero part --ar 4:5 --style raw --no text, numbers, letters`

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a clean studio render of {SUBJECT}. It is made of {MATERIALS} and shows {DETAILS}. It enters the frame from the {EDGE} at an angle and is cropped at {CROP_POINT}. The background is a plain pale cool grey ({GROUND_HEX}). Light it from above with one soft light; keep every detail sharp; no glow. Keep the {SIDE} 40 percent of the image completely empty, because typography will be added later. Do not write any text, numbers or logos anywhere.
```

Series line: attach the approved hero and say "Same subject, same crop, same light, same empty area. Change only the colourway to {COLOURWAY: e.g. navy #1F2A44 with brass #C9A245}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 6-second, 4:5 image-to-video clip from the attached plate render, photographic studio film. Preserve the subject, its materials, the crop, the grey seamless and the empty type area exactly; add no text. At 0-3 seconds the camera holds locked off while {ONE_PART} actuates once ({ACTION: a finger joint closes, a panel slides 2cm}). At 3-6 seconds a slow 3 percent push-in toward {CALLOUT_PART}, then hold. Sound: room tone, one servo whine under the actuation, one dry click at the stop. No glow, no camera shake, no added parts.
```

The type layer is composited after, in code or an editor, building in the order of the Motion cue above.

### UI or web section (structured brief)

```text
Build statement: one "spec plate" section presenting {SUBJECT} as a documented artefact, {STACK}.
Tokens: Ground "Plate" #E3E6E8, Ink "Plate black" #141414, Secondary "Spec grey" #6B6E72, Signal "Seal" #9E1F2C (seal and one callout only), hairline 0.5px at 40 percent ink for leader lines only, cards none: the plate is one surface.
Type: title Neue Haas Grotesk Display Condensed 700 at clamp(56px, 9vw, 160px), set vertically on desktop (writing-mode: vertical-rl) and horizontally under 768px; part names 13px uppercase tracking 0.08em; spec blocks IBM Plex Mono 11px, line-height 1.45, tabular numerals.
Layout: max width 1280px, 6 columns, 24px gap, plate ratio 4:5 inside the column, 32px margins with registration marks at each corner.
Copy: title "{TITLE}"; code "{SERIAL, e.g. MK-07 / 128 PARTS}"; spec block of 4 lines with real values ({MATERIAL}, {MASS}, {DIMENSIONS}, {EDITION}); 3 numbered callouts naming parts.
Device (one): on scroll into view, leader lines draw from part to label (stroke-dashoffset, 120ms stagger, cubic-bezier(.2,.7,.2,1)); the seal stamps last with scale 1.08 to 1.
Accessibility: callouts are real text in a list with aria-describedby links to the figure; AA contrast on spec grey (4.6:1 on the plate ground); reduced motion shows the finished plate.
Performance: render AVIF under 220KB, lines in inline SVG, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

The plate can be live: the model sits in an orthographic camera with an HDRI softbox, and callout labels are CSS2D objects anchored to part pivots so leader lines follow the model as it rotates 30 degrees on drag. The exploded view is a scroll-scrubbed tween of each part along its assembly axis. Model in Blender MCP, or take a mesh from Meshy or Tripo; build with `threejs-fundamentals`, `threejs-materials`, `threejs-interaction`, `threejs-animation`; check labels and line widths at 1x and 2x with `threejs-production-hardening`.

## Gate notes

`quality-gate` checks this style hardest on: no model-made text anywhere; every spec line carries a real value; one signal colour; one grid locked across the series; leader lines orthogonal or 45 degrees. Use `typeset` for the scale and `arrange` for the grid; `industrial-brutalist-ui` (Swiss Industrial Print mode) covers the page around the plate.

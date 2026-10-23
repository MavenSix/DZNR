# Scrapbook

**In one line:** a human annotation layer over made work: cut-out frames, tape, handwritten arrows and circled labels, collage boards, so a process or a world reads as hand-curated rather than machine-output.

**Family:** Kevin's list.
**Exemplified by:** @kreevslab (the Midjourney to Nano Banana Pro workflow carousel: rounded frame grids with handwritten white arrows and circled labels such as "Ratio 16:9" and "STORYBOARD"), @bywaviboy (the Gorillaz-style breakdown: character sheets and "Environments." boards shown as collage grids).

## Use it when / not when

- **Use when:** showing process (a breakdown, a storyboard, a moodboard, a making-of), a personal or diaristic story world, a field notebook, a character dossier, a tutorial carousel, or a Pulse OS "author's notebook" chapter.
- **Not when:** the piece is a finished hero product shot, a precision interface, or a brand that needs authority. Scrapbook is a frame around work, not a substitute for it. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** a loose grid of 3 to 9 frames at varied sizes, each rotated between -3 and 3 degrees; one hero frame at 40 percent of the board; annotations sit on the gutters and point inward; 15 to 25 percent of the board is open paper.
- **Palette (paper neutrals, the work's own colours, one annotation colour):**

| Role | Name | Hex |
|---|---|---|
| Ground | Kraft paper | #D8C3A0 |
| Paper | Bone | #EFE7DA |
| Tape | Masking | #E9DDB8 |
| Ink | Pencil graphite | #3B3936 |
| Annotation | Marker white | #FFFFFF |
| Signal | Grease-pencil red | #C8322B |

- **Materials:** masking tape with torn ends, paper clips, polaroid and contact-sheet borders, torn paper edges, pencil and marker strokes, a coffee ring at most once, kraft and tracing paper.
- **Light:** flat overhead daylight from a window, soft shadows under lifted paper edges (1 to 3px), no vignette.
- **Type pairing (suggestions):** a handwriting face only for annotations (Caveat, Reenie Beanie, or real scanned handwriting, preferred); a typewriter or mono (Courier Prime, IBM Plex Mono) for labels; a bold sans (Montserrat Bold, as the @kreevslab headers read) for titles.
- **Motion:** hand-made stop motion at 12fps on twos: a frame slides in and lands with a 2-degree wobble; an arrow draws itself in 400ms; tape presses down.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Fake handwriting font on everything | Handwriting only on short annotations (3 to 5 words); titles in a real sans |
| Clutter: stickers, washi tape, doodles everywhere | One tape style, one annotation colour, a coffee ring at most once |
| Collage hiding the work | The hero frame is 40 percent of the board and never covered |
| Model-generated annotations with garbled letters | Generate the board without words; draw or set annotations by hand |
| Every frame at the same angle | Vary rotation between -3 and 3 degrees, keep two frames square |
| Annotations that say nothing ("cool!") | Each note names a decision: the ratio, the lens, the sref, the beat |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Overhead photograph of a design scrapbook board on kraft paper, {N} printed frames of {WORK_SUBJECT} at different sizes, each slightly rotated, held with torn masking tape and one paper clip, one large hero frame, contact-sheet borders, pencil grid marks, soft window daylight from above, small shadows under lifted paper edges, open paper in the gutters for annotation, flat neutral grade --ar {4:5 | 1:1} --raw --s 50 --no text, letters, stickers, vignette --sref {SREF_CODE} --sw {100-200}
```

For Midjourney V8.2, the full set for this style (hero still, series variant, Edit Model instruction for the series, video beat and a filled example) is in `midjourney-legendary` (`references/library-styles.md`, Scrapbook), with the parameter recipes and Kevin's sref library.

Composite the real frames and the handwriting in the type layer; the generated board is a backdrop.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make an overhead photo of a working scrapbook page on brown kraft paper. Place these {N} attached images as printed photos on the page: the first one large, the rest smaller, each turned a little, held with torn masking tape. Leave strips of empty paper between them for notes. Light it with soft daylight from above so the paper edges cast small shadows. Do not write anything on the page. Keep every attached image exactly as it is.
```

For a series: attach the approved board and say "Same paper, same tape, same light and camera height. Change only {ONE_VARIABLE: the images placed | the hero frame | the layout}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 6-second, {4:5 | 9:16} image-to-video clip from the attached board, stop-motion paper animation at 12 frames per second. Preserve every printed frame, the tape, the paper texture and the overhead light exactly. The camera is locked off overhead. At 0-2 seconds the hero frame slides in from the bottom edge and lands with a small wobble. At 2-4 seconds a strip of masking tape presses down over its corner. At 4-6 seconds hold, with only a faint shadow shift as if a hand passed over. Sound: a soft paper slide, a tape rip, a quiet room tone. No added text, no camera movement, keep the stepped stop-motion cadence.
```

### UI or web section (structured brief)

```text
Build statement: one process or making-of section for {PROJECT}, scrapbook style, {STACK}.
Tokens: Ground "Kraft" #D8C3A0, Paper "Bone" #EFE7DA, Tape "Masking" #E9DDB8 at 85 percent opacity, Ink "Graphite" #3B3936, Annotation "Marker" #FFFFFF on dark frames or #3B3936 on paper, Signal "Grease red" #C8322B (circled labels only), frame radius 4px, frame shadow 0 2px 6px rgba(59,57,54,0.18), no outline strokes.
Type: title Montserrat 700 at clamp(32px, 4.5vw, 64px); labels IBM Plex Mono 12px uppercase tracking 0.08em; annotations as SVG of real handwriting (fallback Caveat 22px), 3 to 5 words each.
Layout: max width 1200px, CSS grid 12 columns, 24px gap; hero frame spans 7 columns and 2 rows; each frame rotated by a seeded value between -3deg and 3deg; on mobile rotations reset to 0.
Copy: title "{TITLE, e.g. 'From one frame to thirty.'}"; annotations "{DECISION_1: 'ratio 16:9'}", "{DECISION_2: 'same mask, every angle'}"; caption per frame "{STEP_NUMBER} / {WHAT_CHANGED}".
Device (one): SVG arrows draw on scroll into view with stroke-dashoffset over 400ms.
Accessibility: every annotation repeated as real text in the frame caption (handwriting SVG gets aria-hidden), AA contrast on captions, prefers-reduced-motion shows arrows fully drawn.
Performance: frames as AVIF at their display size, total under 1.2MB, lazy below the fold, LCP under 2.5s, CLS under 0.05 (reserve each frame's aspect ratio).
```

### 3D / Three.js scene note

A flat board works better than 3D. If a Pulse OS chapter needs depth: planes with paper textures and slight random rotation on a kraft plane, a single directional light for soft lifted-edge shadows, an overhead camera that dollies 5 percent on scroll. Build with `threejs-textures`, `threejs-lighting`, `threejs-interaction` (click a frame to lift it); keep the draw count under 30 planes.

## Gate notes

`quality-gate` checks this style hardest on: the work stays visible (hero frame never covered), annotations name decisions and are set by hand, one annotation colour, no garbled model text. Pair with `arrange` for board layout and `typeset` for the label system.

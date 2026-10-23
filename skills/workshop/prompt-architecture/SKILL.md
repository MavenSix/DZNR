---
name: prompt-architecture
description: >
  How to write a prompt that reaches DZNR's legendary bar on any tool: Midjourney, Nano Banana,
  Higgsfield, Flux, Wan via Runway, Seedance, Kling, and a coding agent building a UI or site. Generalises
  the 13-section build prompt published on hyliox.io/prompt into a fixed order that works for stills,
  video, UI and 3D; says the order each kind of model reads in; replaces adjectives with slots and values
  (an adjective-to-value table); treats negative space both as room left for the type layer and as a
  short, specific exclusion line; and shows how to lock a look across a series (sref and sw, character and
  omni reference, Higgsfield Soul Characters and reference elements, image-to-image edits from the
  approved hero, a trained Flux style, reference assignment in video). Ends with worked before and after
  pairs. Owned by Gandalf; used by every agent that writes a generation prompt or a build brief. Triggers
  on "write the prompt", "prompt for", "brief for", "improve this prompt", "why does this look generic",
  "lock the look", "keep it consistent", "series", and at Steps 4, 5 and 8 of legendary-standard.
---

# Prompt Architecture

A prompt is a spec, not a wish. The one public prompt in the research that reached the bar
(hyliox.io/prompt, a single build prompt in 13 numbered sections) works because every vague word is backed
by a value, the real copy is written in, each section names one device, and accessibility and performance
are part of the brief. This skill generalises that structure to every tool DZNR uses.

Credit and limits: the 13-section structure is hyliox's; this file describes it and generalises it, and
does not reproduce their prompt. Prompts that creators withhold or sell (several in the research were
gated behind "comment X" or payment) are never copied; DZNR's reconstructions are its own and say so.

---

## 1. The thirteen slots (generalised)

Write in this order. Not every job fills every slot; a slot left out should be left out on purpose.

| # | Slot | Still (image) | Video beat | UI or site | 3D scene |
|---|---|---|---|---|---|
| 1 | Statement | Medium, subject, format in one sentence | Length, ratio, form, medium ("6-second 9:16 image-to-video, photographic") | Page type, mood, full stack in one sentence | Scene type, renderer, target (web, still, film) |
| 2 | Thesis | The governing idea in a clause | The beat's purpose | Goal with 2 to 3 adjectives, each backed later by a value | What the scene must make the viewer understand |
| 3 | Tools and jobs | Model and flags; what the reference images are for | Model; image 1 is identity, image 2 is location, audio 1 is voice | Each library with its job (GSAP: scroll; Motion: micro-interactions) | Each library or add-on with its job |
| 4 | System | Palette tokens with names and hex; materials | Same tokens; what must be preserved from the plate | Named colour tokens with hex and alpha, font roles with fallbacks, radius, shadow recipe | Material values (roughness, metalness, transmission), HDRI |
| 5 | Scale | Lens, distance, aperture | Lens and its changes | Type scale as clamp() values, tracking in em | Camera focal length, unit scale |
| 6 | Composition | Framing, thirds, the empty area for type | Screen geography and the axis that holds | Max width, columns, gap, section padding | Blocking, camera path |
| 7 | Structure | The series and its one variable | Beats on a clock (0 to 2 s, 2 to 4 s) | Numbered sections, each with its one signature device | Chapters or states |
| 8 | Hero | The subject with every stated detail (canon on an author world) | The subject's look and continuity rule | Hero with its real copy: eyebrow, headline, sub, CTAs | The hero object |
| 9 | Specifics | Wear, micro-detail, props | Readable action | Per-section specs: spans, ratios, states | Per-object specs |
| 10 | Motion | (none for stills) | One camera move per beat; sound in the brief | Timings and eases (600ms cubic-bezier(.7,0,.2,1), hover lift 4px) | Animation curves, scroll mapping |
| 11 | Exclusions | A short NOT line; `--no` | What must not drift or appear | What not to use (banned defaults) | What not to add |
| 12 | Floor | Delivery resolution | Continuity rules, identity lock | Accessibility: focus rings, AA contrast, reduced motion, labels | Reduced-motion and low-power fallback |
| 13 | Budget | Variations to return | Draft length before extend | Performance: LCP under 2.5s, CLS under 0.05, image formats | Triangle count, texture size, frame budget |

The style templates in `style-library/references/*.md` are these slots already filled for each style.

## 2. The order models read in

- **Midjourney:** the first words weigh most. Subject and medium first, then setting, then light, lens and
  finish, then parameters at the end (`--ar`, `--style raw`, `--s`, `--sref`, `--sw`, `--no`, `--v 7` or
  `--niji 6`). Comma-separated clauses; no instructions ("make it look like" is noise). Keep it under
  about 60 words of description; past that, later clauses are ignored.
- **Nano Banana and Higgsfield (natural language):** full sentences, imperative, one idea per sentence.
  Assign every attached image a job before describing anything ("Image 1 is the approved hero; keep its
  object, materials and light."). Say what to change and say "change nothing else".
- **Flux:** descriptive prose, subject first; the trained style token at the start.
- **Video (Wan via Runway, Seedance, Kling):** length, ratio and form first; then what to preserve; then
  screen geography; then beats on a clock; camera per beat; sound; the last beat. This is the order in
  `wan-video-prompts`; `seedance-director` holds Seedance's own structure.
- **Coding agents (Claude building a UI):** numbered `##` headings in the fixed order of the table above.
  A spec read top to bottom; the copy is in the spec so the model never writes filler.

## 3. Slots, not adjectives

An adjective is a hope; a value is an instruction. Every adjective in a draft prompt gets replaced or
backed.

| Adjective | Value that does the work |
|---|---|
| premium | two faces only; display at clamp(48px, 7vw, 120px), tracking -0.03em; one signal hex; 96px section padding |
| cinematic | 35mm anamorphic, 2.39:1, f/2.8, one slow push-in, practical light at 3200K |
| moody | key to fill 8:1, one warm practical, lifted black at 4 percent |
| clean | 12 columns, 24px gap, two type sizes per section, nothing in the top third |
| futuristic | a heritage anchor ("a 1987 Sony that never shipped") plus named materials |
| realistic | the light source, the lens, the wear, the setting ("overcast airfield, 80mm, f/8, scuffed paint") |
| high quality, 8k, ultra detailed | delete; ask for delivery resolution from the upscaler at Step 10 instead |
| smooth (motion) | the ease and the duration; for illustration, "on twos" and "hold the linework" |
| vibrant | one signal hex and where it goes |

Slot names go in braces in templates (`{SIGNAL_HEX}`, `{OBJECT}`) and are filled from `pack.md`, from
`kevin-taste` on DZNR's own work, or from the author's approved pack and canon on an author world.

## 4. Negative space

Two kinds, both deliberate.

- **Room for the type layer.** Say where the empty area is and how big: "leave the top third empty",
  "subject in the right two-fifths". The type layer (Step 6 of `legendary-standard`) needs it; models
  fill space they are not told to keep.
- **The exclusion line.** Short and specific: the four or five failures this style tends toward (`--no
  glow, lens flare, text, neon`), not a list of fifty. Exclusions come from the pack and the style entry.
  On an author world the NOT line comes from the pack and the canon only, as `author-world-authority`
  says; never add "3D render" or "photoreal" to an author's pack on your own.

## 5. Locking a look across a series

| Lock | Tool | How |
|---|---|---|
| Style reference | Midjourney (Kevin's account) | `--sref {code}` with `--sw 100` (default) to `250` (strong); keep the same code and weight for the whole series |
| Character or object reference | Midjourney | `--cref {url}` with `--cw` (v6), or `--oref {url}` with `--ow` (v7) |
| Identity lock | Higgsfield | Soul Character for a recurring person, reference elements for objects and places |
| Edit from the hero | Nano Banana, Higgsfield | Attach the approved hero: "Same {subject}, same materials, same light and lens. Change only {one variable}." |
| Trained style | Flux | A style trained on the pack's approved frames; the style token first in every prompt |
| Video continuity | Wan via Runway, Kling, Seedance | Image-to-video from the approved plate; assign reference jobs ("image 1 is identity"); write the continuity rule in words |
| Prompt skeleton | any | Freeze the whole prompt; change one slot per frame; record which slot changed in the series table |

The order that works (from @kreevslab's published method: one base image, an sref, then an edit model for
angles, ratios, beats and a storyboard): **hero first, lock second, coverage third**. Never generate the
series from fresh prompts and hope.

---

## 6. Worked before and after

### Still

**Before** (typical one-prompt output):

```text
futuristic premium headphones product shot, cinematic lighting, ultra detailed, 8k, sleek design
```

What goes wrong: no thesis, no palette, no heritage, "cinematic lighting" gives rim glow (F1, F10),
"futuristic" gives generic chrome (F9), the model may letter a fake logo (F4).

**After** (instrument-grade-product, slots filled for DZNR's own work):

```text
Product catalogue photograph of over-ear studio headphones as Braun would have made them in 1968, three-quarter view at eye height on a seamless #E3E6E8 sweep, bead-blasted aluminium yokes, matte bone #EDEAE3 ear cups with perforated grille, knurled volume ring with printed 0 to 10 legend, one TE orange #FF5A1F cable strain relief, faint scuff on the headband, large soft key light top-left, white bounce right, soft contact shadow, top third empty, medium format, 80mm, f/11, neutral grade, fine grain --ar 4:5 --style raw --s 50 --no glow, lens flare, logo, text
```

### Video beat

**Before:**

```text
make the headphones spin around cinematically with cool lighting
```

**After** (image-to-video from the approved, upscaled still):

```text
Create a 6-second, 4:5 image-to-video clip from the attached still, photographic product film. Preserve the headphones, materials, legends, the grey sweep and the light exactly. Locked-off camera. At 0 to 2 seconds a 2 percent push-in only. At 2 to 4 seconds the volume ring turns two detents. At 4 to 6 seconds hold. Sound: quiet room tone and two dry clicks on the detents. No glow, no added text, no camera shake.
```

### UI section

**Before:**

```text
make a sleek modern dark landing page for an AI company with glassmorphism and animations
```

**After** (condensed to the slots):

```text
1 Statement: one hero section for "Fieldnote", an AI voice recorder; React, Tailwind, GSAP.
2 Goal: quiet, exact, tactile; every value below backs these.
4 System: Ground "Graphite" #0B0B0C, Surface "Slate" #17181A, Ink "Bone" #EDEAE3, Secondary rgba(237,234,227,0.64), Signal "Record" #E8322A (the record button only); cards by fill and a soft two-layer shadow, no strokes; radius 12px.
5 Scale: display Neue Haas Grotesk 500, clamp(44px, 6.5vw, 104px), tracking -0.03em; labels JetBrains Mono 11px, tracking 0.12em, uppercase.
6 Layout: max width 1280px, 12 columns, 24px gap, padding clamp(96px, 12vw, 160px).
8 Hero copy: eyebrow "FIELDNOTE / 01"; headline "worth recording."; sub "Speak. It keeps the part that mattered."; CTA "Start recording"; secondary "How it listens".
7 Device: a red concentric record button whose rings tick outward with the live input level.
10 Motion: rings scale 1.0 to 1.08 over 120ms on each peak, ease cubic-bezier(.2,.8,.2,1).
12 Floor: AA contrast, 2px focus ring in #E8322A, reduced motion shows static rings, the button has aria-pressed.
13 Budget: no hero image; LCP under 1.8s; CLS under 0.05; JS under 60KB gzipped.
```

## Reference files

None. The filled templates per style live in `style-library/references/`; the pipeline that calls these
prompts is `legendary-standard`; the check on what they produce is `quality-gate`.

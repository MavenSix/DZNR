---
name: style-library
description: >
  DZNR's prompt library of prompt libraries: one entry per style, each a working instrument rather than a
  mood board. Kevin's fifteen (Claymorphism, Cybercore, Neo-Brutalism, Scrapbook, Surrealism, Y2K, Pixel
  Art, Synthwave, Glassmorphism, Neumorphism, Bento Grid, Editorial Design, Swiss Design, Minimalism,
  Maximalism) plus eight families his references use (instrument-grade product, technical poster,
  grounded speculative realism, HUD as instrument, monumental calm, techwear editorial, mature 90s anime,
  ink and cel illustration). Every entry gives what it is in one line, when to use it and when not,
  signature cues (composition, palette with hex, materials, light, type pairing with real typeface names
  as suggestions, motion), anti-patterns with fixes, and ready templates with slots: a Midjourney still,
  a natural-language still for Nano Banana and Higgsfield, a video beat for Wan via Runway, Seedance and
  Kling, a structured UI or web section brief, and a Three.js scene note; plus the creators whose work
  exemplifies it, by handle. Owned by Snape; shared with Cheetara, Gibson and Neo. On an author's world
  the entries are options offered to the author, never imposed. Triggers on any style name above, "what
  style", "pick a style", "style options", "make it look like", "in the style of", "prompt for a [style]",
  and at Step 2 of legendary-standard.
---

# Style Library

Each style lives in `references/<style>.md`. This file is the index and the chooser. Load only the
entries you need: one base style, and at most one accent style.

**Whose choice it is.** On DZNR's own work, choose with `kevin-taste`. On an author's world, offer two or
three entries that fit the manuscript and brief as options in the author world pack draft, and let the
author choose (`author-world-authority`); a style entry never overrides the pack's declared medium,
palette or canon. On a QKI pack, `qki-style-authority` fixes the look and these entries do not apply. On a
client brand, the client's system leads and an entry may inform it.

**How an entry is used.** Fill its template slots from `pack.md` (`legendary-standard`), write the prompt
in the order `prompt-architecture` gives, and check the result with `quality-gate`, which reads each
entry's "Gate notes".

---

## Chooser: Kevin's fifteen

| Style | Choose it when | File |
|---|---|---|
| Claymorphism | The subject should feel touchable and friendly: soft inflated matte forms, palette sampled from the subject | `references/claymorphism.md` |
| Cybercore | An invisible system must be made visible as dense data spectacle, and every glow can carry a readable meaning | `references/cybercore.md` |
| Neo-Brutalism | The layout itself is the voice: heavy type at extreme contrast, flat blocks, visible frames, cut corners | `references/neo-brutalism.md` |
| Scrapbook | A process or world should read as hand-curated: annotation, tape, arrows, collage boards | `references/scrapbook.md` |
| Surrealism | One impossible relationship can argue the thesis as a metaphor, staged with full conviction | `references/surrealism.md` |
| Y2K Aesthetic | Translucent plastic and visible circuitry; for DZNR's own work the sober translucent-tech variant | `references/y2k.md` |
| Pixel Art | A visible grid and a limited palette carry warmth, nostalgia or dot-matrix precision | `references/pixel-art.md` |
| Synthwave | 1980s night-drive retro-futurism; for DZNR's own work one sodium or magenta signal on near-black, no grid sunset | `references/synthwave.md` |
| Glassmorphism | Depth comes from what frosted panels blur and bend over a rich backdrop, never from glow | `references/glassmorphism.md` |
| Neumorphism | A few controls should feel moulded hardware; never a whole interface, and never below AA contrast | `references/neumorphism.md` |
| Bento Grid | One skeleton, one idea per tile, art direction as the variable | `references/bento-grid.md` |
| Editorial Design | A magazine spread's logic: one idea, a characterful display face with a quiet text face, intentional crops, voiced copy | `references/editorial-design.md` |
| Swiss Design | Order is the beauty: an objective grid, one grotesk, flush-left text, geometric masks | `references/swiss-design.md` |
| Minimalism | One object, one line, one action; everything left is load-bearing | `references/minimalism.md` |
| Maximalism | Abundance with a spine: full-volume type, objects and colour, still one idea and one legible point | `references/maximalism.md` |

## Chooser: families found in Kevin's references

| Style | Choose it when | File | Exemplified by |
|---|---|---|---|
| Instrument-grade Product | The hero is a made thing and must look like it ships tomorrow | `references/instrument-grade-product.md` | @an_improbable_future, @vnarshia, @skvortsov.design; Kevin's Tech board |
| Technical Poster | A render must become a designed plate: vertical title, spec blocks, callouts, seal | `references/technical-poster.md` | @jasonscarecrowart, @jenya.kruglova, @skvortsov.design |
| Grounded Speculative Realism | An object or vehicle that never existed must look photographed in the real world | `references/grounded-speculative-realism.md` | @an_improbable_future, @designchapel |
| HUD as Instrument | An interface should read like an instrument panel: hairline gauges, mono numerals, one signal | `references/hud-instrument.md` | Ledger Stax, @tonythetechie with @augma.im, @jtansill; Kevin's Interface board |
| Monumental Calm | A place at architectural scale: silence, weather, a tiny figure, one warm light | `references/monumental-calm.md` | Kevin's Future Architecture board, Kasane |
| Techwear Editorial | Identity hidden behind engineered surfaces, fashion-editorial finish | `references/techwear-editorial.md` | @ovyonlabs, @pxdx.baddies; Kevin's Gear board |
| Mature 90s Anime | Body meets machine in dense hand-drawn cel line; never cute | `references/mature-90s-anime.md` | Kevin's Anime board |
| Ink and Cel Illustration | A drawn world must keep its ink and grain in motion | `references/ink-cel-illustration.md` | @bywaviboy |

## Pairings that work (base plus accent)

- Instrument-grade Product plus Technical Poster: the object, then the plate (Kevin's strongest pairing).
- HUD as Instrument plus Swiss Design: DZNR OS System views, the Pulse reader chrome.
- Grounded Speculative Realism plus Monumental Calm: a world's props in a world's places.
- Bento Grid plus any one look: the skeleton constant, the look swapped (@pxdx.baddies's seven worlds).
- Editorial Design plus Techwear Editorial: campaign and character dossiers.
- Cybercore as an accent only, over HUD as Instrument as the base, so the spectacle stays legible.

Never stack three looks; never pair two that fight for the signal colour.

## Reconciliation with existing skills

These entries say what a style looks like and how to prompt it. They point to, and do not duplicate:

- `high-end-visual-design` and `design-taste-frontend`: premium page craft, layout archetypes, motion and
  performance guardrails (the bento, glass and spacing rules there apply inside the UI templates here).
- `industrial-brutalist-ui`: the full build recipe for Neo-Brutalism's Swiss-industrial and
  tactical-telemetry modes, and for HUD as Instrument's terminal variant.
- `minimalist-ui`: the build recipe for Minimalism and editorial document UIs.
- `critique` and `polish`: run by `quality-gate`.
- `wan-video-prompts` and `seedance-director`: the full video grammar behind each entry's video beat.
- `threejs-*` and `threeui-catalog`: the build path behind each entry's 3D note.

Where a taste skill bans a typeface as a default (Helvetica, Inter) and an entry names it deliberately
(Swiss Design), the entry wins: the bans target defaults, not decisions.

## Credits

Creators are credited by handle where their studied work exemplifies a style
(`legendary-standard/references/evidence.md` lists every reference). Quotes are at most 15 words.
Reconstructed prompts in the entries are DZNR's own; no creator's withheld or paid prompt is reproduced.

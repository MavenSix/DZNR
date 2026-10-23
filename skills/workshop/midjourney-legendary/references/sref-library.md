# Kevin's sref library

Kevin, 2026-10-23: "Do you have access to my Midjourney style references? I know we are using them in DZNR
OS. If so, add those to the playbook." Yes: DZNR registers 21 of Kevin's style reference codes in
`qki-style-authority/references/midjourney-style-refs.md` (the QKI engine anchor), with his profile, the
default weight and the default code. This file is the same library, read for every kind of work DZNR does
for Kevin, not only QKI.

**What a code is.** `--sref <code>` captures colours, medium, texture and lighting, not objects. A code
lives on Midjourney's side; DZNR only records it. The codes, and Kevin's profile, are used on Kevin's own
Midjourney account and never through an aggregator.

## The registry defaults

| Setting | Value | Note |
|---|---|---|
| Version | `--v 8.2` | current default since 2026-07-24 |
| Profile | Kevin's "Global V7 Profile" | works in V8.2; pass its code as `--p <profile code>`. The code is not recorded yet, so templates carry the slot; the name is not a valid value |
| Style weight | `--sw 250` | the QKI default: the drawn style holds while the stated palette still reads. In range (0 to 1000, default 100) |
| Default code | `3730410722` | used by QKI generators when no `best_for` matches |

## Characterised (3)

These notes are DZNR's, written when the codes were registered. The public research of 2026-10-23 found
no catalogue sample for any of them, so the notes are not verified externally: render each in V8.2 before
a paid series leans on it.

| Code | Look (DZNR note) | best_for | Styles in this library that use it, and why |
|---|---|---|---|
| `3730410722` | inky graphic-novel character sheets, dramatic rim light, limited moody palette | character, character_sheet, key_art | **Ink and Cel Illustration**: the code's ink and limited palette are the style's line and fills, and its best_for is the character sheet the style builds first. **Mature 90s Anime**, V8.2 line: drawn line and rim light suit adult cel character work; Niji 7 is the alternative when no sref is needed |
| `1464381114` | moody cybernetic figures, atmospheric depth, desert and neutral tone | vehicle, prop, environment, character | **Techwear Editorial**: faceless engineered figures in neutral mineral tones are the style's subject and palette. **One-metaphor Campaign** family: a figure absorbed into a desert or mineral terrain |
| `1226151696` | darker nocturnal variant, high-contrast silhouette, cool cast | key_art, environment, mood | **Monumental Calm**, night variant: silhouette and a cool cast against one warm window. **Synthwave**, DZNR's sober variant: one sodium signal on near-black. **Explorable Brand World** family: the night megacity key art |

No other style in this library carries a Kevin code by default. The photographic styles (instrument-grade
product, grounded speculative realism, the archive and studio looks) get no sref: none of the three
characterised looks is documentary daylight, and an sref there would fight the anti-sheen recipe. They
carry `{SREF}` as an optional slot for a pack's own code.

## Registered, look not yet characterised (18)

Usable now by hand; never auto-selected, never assigned to a style, and never described until their look
is seen.

| # | Code | Status |
|---|---|---|
| 1 | `1134219297` | look not yet characterised |
| 2 | `4269372417` | look not yet characterised |
| 3 | `1723494616` | look not yet characterised |
| 4 | `3013913608` | look not yet characterised |
| 5 | `4059511452` | look not yet characterised |
| 6 | `4209589163` | look not yet characterised |
| 7 | `3188932791` | look not yet characterised |
| 8 | `1708771943` | look not yet characterised |
| 9 | `1695596002` | look not yet characterised |
| 10 | `3658338761` | look not yet characterised |
| 11 | `4040246036` | look not yet characterised |
| 12 | `1813085896` | look not yet characterised |
| 13 | `2363415158` | look not yet characterised |
| 14 | `2866257976` | look not yet characterised |
| 15 | `3877199276` | look not yet characterised |
| 16 | `1413022306` | look not yet characterised |
| 17 | `1241116031` | look not yet characterised |
| 18 | `2573225561` | look not yet characterised |

**Why their looks are unknown.** On 2026-10-23 none of the 21 codes appeared in any public sref catalogue
(sref-midjourney.com, srefm, midjourneysref, srefcodes, srefhunt, srefs.co) or in a web search, and
Midjourney's own style page (`midjourney.com/styles/<code>`) shows "Style preview unavailable" to a
logged-out visitor.

## How to characterise them (free first)

1. **Free:** Kevin logs in on midjourney.com and opens `https://www.midjourney.com/styles/<code>` for each
   code. Midjourney shows its own sample grid where one exists; viewing costs nothing, and Midjourney says
   it is generating sample grids for more codes every week. The lead writes a `note` and `best_for` from
   each grid, and the code graduates into the characterised table here and in the QKI registry.
2. **Paid, with Kevin's go-ahead:** one Draft prompt in V8.2 per code, the same neutral test prompt for
   all 21 (24 images at 512px, 0.4 GPU min each). Suggested test prompt, DZNR's own:

```text
A lone figure standing beside a small machine on a stone floor, one window behind them, a cup and a book on a table --v 8.2 --draft --sref {CODE} --sw 250
```

3. Judge from V8.2 renders only: V8 changed the default sref engine in March 2026, so any older catalogue
   grid can differ.

## Pairing, blending, moodboards, profiles

- **Sref plus a written palette:** the code carries the rendering; the text carries the colour, hue by
  hue; `--sw` balances. Palette washing out: lower `--sw`. Look slipping toward generic: raise it.
- **Blending codes:** list them, `--sref 3730410722 1226151696`. V8 documents mixing codes and images but
  not per-code `::` weights (and V8 has no `::` multi-prompting), so blends are unweighted until a test
  proves otherwise.
- **Sref plus image URLs:** allowed; an image adds its colours and texture to the code's.
- **`--sref random`:** for exploration only; in Draft it gives 24 different styles. Record any code worth
  keeping before it is lost.
- **Moodboards:** `--p <moodboard ID>`; no `--sw`, no `--sv`; `--s` scales the influence. A moodboard
  can carry a world's places and materials while a code carries the rendering.
- **Profile by code:** `--p <profile code>`. `--s` scales how strongly the profile applies.
- **A pack's own sref:** Midjourney cannot make a code from an upload; its Style Creator makes styles.
  A world that needs a bespoke look registers the resulting code in its pack's `midjourney` block.

## Sources

The registry: `qki-style-authority/references/midjourney-style-refs.md`. Midjourney behaviour: Style
Reference, Personalization and Moodboards pages on docs.midjourney.com, and the updates feed, read
2026-10-23 (`v8-parameters.md`).

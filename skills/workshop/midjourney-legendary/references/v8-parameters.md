# V8.2 parameters, with sources

Read on 2026-10-23 from docs.midjourney.com and midjourney.com/updates. Nothing was generated and no
credits were spent. General syntax: parameters go at the end of the prompt, a space before each `--`, no
punctuation inside a parameter (Parameter List,
https://docs.midjourney.com/hc/en-us/articles/32859204029709-Parameter-List).

## Version

- V8.2 is the current default, since 2026-07-24; it focuses on aesthetics, image quality and
  Personalization, and introduces the Edit Model, which replaces Omni Reference, Character Reference and
  the Retexture tool. V8.1 was released 2026-04-14 and was the default from 2026-06-10 to 2026-07-23.
  (https://docs.midjourney.com/hc/en-us/articles/32199405667853-Version)
- A "Global V7/V8 Personalization Profile" may need unlocking before V8.x can be used (same page).
- HD (V8.1 and V8.2): native 2048px without upscaling, set in the Version settings or with `--hd` and
  `--sd`. HD costs 1.3 GPU minutes, SD 0.8. "Run batch as HD" reruns a seedlocked prompt in HD. Pan,
  Zoom Out and Edit or Vary Region on an HD image return SD results; Upscale returns them to HD (same page).

## Compatibility, V8.1 and V8.2 (from the chart on the Version page)

| Feature | V8.1 / V8.2 |
|---|---|
| Max aspect ratio | 14:1 (4:1 for HD) |
| Variations | yes |
| Upscalers | SD images only |
| HD images, 2048px | yes |
| Pan, Zoom Out, Editor | yes, using the Edit Model |
| Remix, Personalization, Moodboards | yes |
| Edit Model | yes (V8 only) |
| Omni Reference and its weight (`--oref`, `--ow`) | no (V7 only) |
| Style Reference, sref codes, Style Weight | yes |
| Image prompts, Image Weight (`--iw`) | yes |
| Multi-prompting (`::`) | no (V6 and earlier) |
| `--no` | yes |
| Quality `--q` | no |
| `--seed` | yes, "99% identical" |
| `--chaos`, `--raw`, `--stylize`, `--tile`, `--weird`, `--exp` | yes |
| Niji inside V8 | no (Niji is its own model) |
| Draft Mode | no on the chart; yes on the website by the Draft page (see below) |
| Conversational Mode | yes |
| Relax, Fast | yes |
| Turbo | no |

## Parameters

| Parameter | Range or form | Notes | Source |
|---|---|---|---|
| `--ar`, `--aspect` | default 1:1; up to 14:1, 4:1 in HD | The web slider gained 6:11, 4:5, 5:4 and 21:9 (2026-01-20). The Edit Model matches the first reference's ratio unless `--ar` is given | Aspect Ratio page; Version page; updates |
| `--stylize`, `--s` | 0 to 1000, default 100 | Also scales how strongly `--p` profiles and moodboards apply | Stylize page; Personalization page |
| `--chaos`, `--c` (web: Variety) | 0 to 100, default 0 | Higher drifts from the prompt | Chaos page |
| `--weird`, `--w` | 0 to 3000, default 0 | Experimental and not fully seed-stable; removed from moodboard jobs (2026-01-20) | Weird page; updates |
| `--raw` | flag | Turns off Midjourney's auto-pilot: more photographic on short prompts, more control on detailed style prompts; helps text rendering and Edit Model precision; works on video | Raw page |
| `--exp` | supported in V7, V8.1 and V8.2 | Range 0 to 100, default 0, is **not confirmed** on a docs page (third-party source) | Version page chart |
| `--hd`, `--sd` | flags | HD native 2048px, 1.3 GPU min; SD 1024px, 0.8 GPU min | Version page; Parameter List |
| `--seed` | 0 to 4294967295 | "99% identical" in V8 | Version page; Legacy page |
| `--tile` | flag | Seams fixed for V8.1 and V8.2 on 2026-09-24. Not with the Edit Model or attached images. Do not upscale tiles | Tile page; updates |
| `--no` | a word or a list | `--no a, b` reads the whole list (alpha, 2026-09-16) | Multi-Prompts page; updates |
| `--sref` | one or more codes or image URLs; `--sref random` | Captures colours, medium, texture and lighting, not objects. Codes can be mixed and combined with images; rerun and variations keep the code. A code cannot be made from an upload (Style Creator makes styles) | Style Reference page |
| `--sw` | 0 to 1000, default 100 | Not compatible with moodboards | Style Reference page |
| `--sv` | V7: six versions, default 6 | V8 changed the default sref engine (2026-03-20); **which `--sv` values V8.2 accepts is not confirmed**. Not compatible with moodboards | Style Reference page; updates |
| `--p`, `--profile` | `--p`, `--p <ID>`, `--p <code>` | The Global V7 profile works in V8.1 and V8.2; no Global V8 profile exists; extra V8 profiles do not work in V7; an ID converts to a code at submit; a profile's name is not a valid value | Personalization page |
| Moodboards | `--p <moodboard ID>` | Cannot take `--sw` or `--sv`; `--s` scales influence | Moodboards page |
| Image prompts, `--iw` | `--iw` 0 to 3, default 1 (Niji 7: 0 to 2) | Describe the whole target image in text, not edit instructions | Image Prompts page |
| Edit Model (`--edit` on Discord) | up to 4 reference images | Replaces `--oref`, `--ow`, `--cref`, `--cw` and Retexture in V8.x. Takes instruction prompts. Works with image prompts, sref, moodboards, `--p`, `--hd`, `--raw`; not with `--tile`; results cannot be Remixed. Describe the style in words to activate an sref or moodboard | Edit Model page; post of 2026-08-27 |
| `--niji` | `--niji 7` (2026-01-09) | A separate model: more literal, flatter and cleaner line. Personalization and Moodboards since 2026-02-26 | Version page; updates |
| `--draft` | V8.1 and V8.2, website only | 24 images at 512px for 0.4 GPU min; Vary or Remix renders at full quality; `--sref random` in Draft gives 24 different styles. The chart says no; the Draft page and the 2026-10-07 changelog say yes on the web | Draft and Conversational Modes page; updates |
| `--repeat`, `--r`, `--stealth`, `--public`, `--fast`, `--relax` | as named | Turbo is not available in V8 | Parameter List |
| `--preview` | flag | Tests upcoming features (from 2026-06-16); unstable over time | updates |

**Not in V8, never written in a V8 prompt:** `--q`, `::` and text weights, `--cref` and `--cw`,
`--oref` and `--ow`, `--style raw` (the flag is `--raw`).

## Text

Put words to render in double quotes; Latin alphabet, short phrases; add "with the words", "text" or
"written". If it fails, use `--raw` or a lower `--s`, or fix it in the Editor.
(https://docs.midjourney.com/hc/en-us/articles/32502277092109-Text-Generation)

## Video

(https://docs.midjourney.com/hc/en-us/articles/37460773864589-Video)

| Item | Value |
|---|---|
| Form | image-to-video: the first frame from an image, an optional text prompt, 5-second clips |
| `--motion` | `low` (default: still scenes, slow camera, subtle movement) or `high` (big camera and character motion, risk of glitches) |
| `--raw` | more control, as for stills |
| `--loop` | the end frame equals the start frame |
| `--end` | a custom end-frame image |
| `--bs` | batch size 1, 2 or 4 (default 4) |
| Extend | +4 s each, up to 4 times, 21 s at most; Auto (original prompt) or Manual (new text); same cost as a generation |
| Resolution | SD 480p; HD 720p (Standard, Pro, Mega; Fast only). 16:9 gives 832x464 SD and 1280x720 HD; 1:1 gives 624x624 and 960x960; 2:3 gives 512x768 and 784x1168 |
| Cost per batch of 4 | SD 8 GPU min; HD 26 GPU min |
| Not compatible | image parameters (stripped when animating), `--sref`, image prompts, edit references |
| Model version | not named in the docs; presumably the V1 video model of June 2025 (**not confirmed**) |

## Editor and later features

- The Editor (inpaint, outpaint, pan, zoom out) runs on the Edit Model in V8.1 and V8.2. Since
  2026-09-24 an Edit Model inpaint or outpaint changes only the selected pixels, so repeated edits do not
  degrade. (Edit Model page; updates)
- Retexture is V7 and earlier; in V8 it is an Edit Model prompt such as "hand drawn pencil sketch of this
  image" with an sref. (Legacy Features page)
- Thinking Mode, "Rerun (Thinking)" on 8.2 standard and edit jobs, is alpha-only as of October 2026.
  (updates.midjourney.com)

## How V8 reads prompts (official guidance)

- V8 alpha post (2026-03-17): better at following detailed directions; text best "when specified in
  quotes"; switch to `--raw` for photographs or a controlled look; personalization and `--s` up to 1000
  encouraged; it "may require totally new prompting styles".
- V8.1 (2026-06-10): better adherence to detailed prompts and the best text rendering yet; sref,
  personalization and aesthetics consistent between V7 and V8.1; Describe returns longer, V8-style prompts.
- Prompt Basics (all versions): clear sentences covering subject, medium, environment, lighting, colour,
  mood and composition; numbers and collective nouns; say what you want and use `--no` for exclusions.
  Its advice to keep prompts short predates V8 and is at odds with the V8 posts.
- Style references: keep the text about content; avoid style words that fight the reference.
- Edit Model: accepts instructions, unlike normal prompts, which describe.

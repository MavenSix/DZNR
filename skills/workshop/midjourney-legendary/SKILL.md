---
name: midjourney-legendary
description: >
  The legendary Midjourney prompt library for V8.2, the default model since 2026-07-24. How V8.2 reads a
  prompt and the order DZNR writes one in (subject and thesis, medium and lens, light, palette with named
  hues, materials and wear, composition and negative space for the type layer, micro-detail), what goes in
  double quotes, and a parameter recipe table (--s, --c, --w, --raw, --exp, --sw, --ar, --hd) by goal:
  anti-sheen realism, editorial restraint, maximal density, series consistency, exploration. Kevin's sref
  library: all 21 codes registered in DZNR, the three characterised (3730410722, 1464381114, 1226151696)
  with best_for and the styles each serves, the 18 whose look is not yet characterised; how an sref pairs
  with a written palette, blending codes, moodboards, and --p by profile code. The library itself: for
  each of the 23 style-library styles and the six highest-scoring reference families, a hero still, a
  series variant, the Edit Model instruction that holds the series, a Midjourney video beat, and a filled
  example. Series in V8 (Edit Model with up to 4 references, seeds, sref plus moodboard, the locked hero),
  anti-sheen finishing and the draft-to-hero workflow. Every parameter is from docs.midjourney.com, checked
  2026-10-23; what the docs do not confirm is marked. Owned by Gandalf; used by Snape, Cheetara and Gibson.
  Triggers on "Midjourney", "MJ prompt", "V8", "V8.2", "sref", "style reference", "my srefs", "style
  code", "moodboard", "--p", "profile code", "Edit Model", "Niji 7", "Midjourney video", "draft mode",
  "legendary prompt", "prompt library", and at Steps 4, 5, 8 and 10 of legendary-standard when the tool
  is Midjourney.
---

# Midjourney Legendary

Kevin, 2026-10-23: "I think the best thing to do, given my references, is to create a legendary prompt
library, especially to achieve these results in the latest Midjourney release." This is that library.
It sits on top of `legendary-standard` (the method), `style-library` (the looks), `prompt-architecture`
(the slots), `kevin-taste` (DZNR's own taste) and `quality-gate` (the check), and turns them into V8.2
prompts.

**Sources.** Every parameter, range and feature here comes from docs.midjourney.com and
midjourney.com/updates, read on 2026-10-23 (`references/v8-parameters.md` cites each page). Where the
docs are silent or contradict themselves, this skill says "not confirmed" and the prompt avoids relying
on it. The suggested starting values in the recipe table are DZNR's own judgement inside the documented
ranges, not Midjourney's advice.

**Whose look it is.** Kevin's sref codes and his profile carry Kevin's look: they serve DZNR's own work
and QKI. On a QKI pack, `qki-style-authority` resolves the sref, weight and profile and this library
supplies only the grammar. On an author's world the author's approved pack decides: its own srefs, or
none, and a Kevin code only if the author chooses it in the pack. On a client brand, the client's system.

**Where it runs.** Sref-locked work runs on Kevin's own Midjourney account: the sref library and his
profile live there (`routing/mcps/browser-profile.md`; interactive sessions only, never the daemon).
RunningHub is ACTIVE through the DZNR OS `runninghub` driver with Kevin's key and runs saved workflows
and community AI Apps; it never carries an sref lock, so Midjourney there is for unlocked prompts only,
where a workflow or app offers it.

---

## 1. The release in one table

| | In V8.2 | Not in V8.2 (do not write it) |
|---|---|---|
| Model | V8.2, default since 2026-07-24; `--v 8.2` pins it | Turbo mode |
| Look | `--s` 0 to 1000 (default 100), `--raw`, `--exp`, `--w` 0 to 3000, `--c` 0 to 100 | `--q` (V6 and V7 only) |
| Style | `--sref` codes or image URLs, several mixed; `--sw` 0 to 1000 (default 100); moodboards; `--p` with a profile ID or code | `::` multi-prompts and text weights (V6.1 and earlier) |
| Reference | Edit Model: up to 4 reference images plus an instruction prompt; image prompts with `--iw` 0 to 3 | `--cref` / `--cw` (V6), `--oref` / `--ow` (V7): the Edit Model replaced them |
| Frame | `--ar` up to 14:1 (4:1 in HD), `--tile`, `--no`, `--seed` ("99% identical" in V8) | |
| Output | `--hd` (native 2048px, 1.3 GPU min) and `--sd` (1024px, 0.8 GPU min); Upscale for SD images | Upscaling an HD image (it is already 2K) |
| Niji | a separate model, `--niji 7` (2026-01-09) | Niji inside a V8 prompt |
| Draft | `--draft` on the website: 24 images at 512px for 0.4 GPU min | See the conflict note in section 9 |
| Video | image-to-video, 5 s, extend 4 s at a time to 21 s; `--motion low` / `high`, `--raw`, `--loop`, `--end`, `--bs 1`, `2` or `4`; 480p SD, 720p HD | `--sref`, image prompts and edit references in a video prompt |

Kevin's "Global V7 Profile" works in V8.2 (there is no Global V8 profile). `--p` takes the profile's ID or
code, never its name, and the code is not recorded yet, so every template here carries `--p <profile
code>` as a slot to fill or delete.

## 2. How V8.2 reads a prompt

- **Long and specific beats short and vague.** Midjourney's V8 post says V8 shines with "longer more
  specific prompting" and leans on the stylization systems; V8.1 improved adherence to detailed prompts
  and small detail. The generic Prompt Basics page still says short prompts work best; it is written for
  every version and is at odds with the V8 posts, so this library writes full natural-language sentences.
- **Describe, do not instruct.** A normal prompt describes the image ("a field recorder on a grey
  sweep"), never "make it look like". The one exception is the Edit Model, which takes instructions
  ("keep the object, change only the colourway").
- **Say what you want; exclude with `--no`.** Numbers and collective nouns help ("three containers").
  `--no glow, lens flare, text` reads the whole list.
- **With an sref, keep the text about content.** Avoid style words that fight the reference; add matching
  style words only if the look will not take. With the Edit Model, describe the style in words to
  "activate" an sref or moodboard.
- **Past the length limit a Prompt Shortener cuts in.** The limit is not published (not confirmed), so the
  templates stay at roughly 60 to 110 words of description.
- **No `::`.** V8 has no multi-prompt weights; order and specificity carry emphasis instead.

## 3. The order DZNR writes in

| # | Slot | What it carries | Example words |
|---|---|---|---|
| 1 | Subject and thesis | the object, place or character, and the idea it argues | "a 1999 portable data terminal that never shipped, the archive of a future that did not happen" |
| 2 | Medium and lens | photograph, render, cel, ink; format, focal length, aperture | "archival press photograph, medium format, 80mm, f/8" |
| 3 | Light | the source, its direction and quality, the time | "flat overcast daylight", "large soft key top-left, white bounce right" |
| 4 | Palette with named hues | neutrals plus one signal, named in words; the hex stays in `pack.md` for the eyedropper check | "bone, graphite and bead-blast aluminium, one safety orange cable" |
| 5 | Materials and wear | every visible surface named, two or three wear marks | "matte ABS, knurled aluminium knob, peeling asset-tag label, scuffed edges" |
| 6 | Composition and negative space | framing, where the subject sits, where the type layer goes | "subject in the lower third, the top third empty" |
| 7 | Micro-detail | true small print, counts, codes, legends | "printed legend \"REC\", container code \"22 G1\"" |
| 8 | Parameters | at the end, a space before each `--`, no punctuation inside | `--ar 4:5 --raw --s 50 --v 8.2 --no glow, text` |

## 4. What goes in double quotes

Only words that must appear in the image, and only short Latin-alphabet phrases: a printed legend on a
control, a code on a container, a counter on a display. Put them in double quotes and say "with the
words", "text" or "printed". V8 renders quoted text better than any earlier version, and V8.1 calls its
text rendering its best yet; if a word still fails, try `--raw` or a lower `--s`, or fix it with the
Editor. Titles, headlines and any poster-grade type are never asked of the model: they are set by hand in
the type layer (Step 6 of `legendary-standard`), so most templates carry `--no text, letters, logo` and
leave the space empty.

## 5. Parameter recipes

Ranges are Midjourney's; the starting values are DZNR's. Change one parameter at a time and keep the rest
of the prompt frozen, so a grid tells you what that parameter did.

| Goal | Parameters | Why |
|---|---|---|
| **Anti-sheen realism** (products, archive and field photographs, places) | `--raw --s 25 to 100` (start at 50), `--c 0`, no `--w`, no `--exp`, `--no glow, bloom, lens flare` | `--raw` switches off Midjourney's auto-pilot and reads more photographic on short prompts and more controlled on detailed ones; a low `--s` keeps the house aesthetic from varnishing the light; chaos at 0 keeps a grid comparable |
| **Editorial restraint** (campaigns, Swiss and minimal frames, plates for a type layer) | `--raw --s 50 to 150`, `--c 0 to 10`, `--ar 4:5`, `2:3` or `16:9`, the empty area written in words | `--raw` obeys the composition sentence and the negative space; a modest `--s` adds finish without ornament |
| **Maximal density** (maximalism, cybercore spectacle, painted worlds) | no `--raw` (or `--raw` when control slips), `--s 250 to 750`, `--c 10 to 25`, `--w` 0 to 250 only as an accent | higher `--s` gives V8.2's bolder aesthetic, which the V8 post encourages up to 1000; chaos varies the grid; weird is experimental and not seed-stable, so it stays low |
| **Series consistency** | the same prompt skeleton, `--seed <n>`, the same `--sref`, `--sw`, `--p`, `--ar` and `--s`; `--c 0`; no `--w`; coverage through the Edit Model | V8 seeds are "99% identical"; weird is not fully seed-stable; one variable per frame is the series rule of `legendary-standard` |
| **Exploration** (before a hero exists) | Draft mode on the website, `--c 30 to 60`, `--sref random`, `--exp 5 to 25`, `--w 50 to 500` | variety and strangeness are the point; `--sref random` in Draft gives 24 different styles; the `--exp` range (0 to 100) is from a third party, not a docs page |
| **Sref-led look** | `--sref <code> --sw 100 to 300` (QKI starts at 250), the colours written in the text | the sref carries rendering, the text carries colour, `--sw` balances them (section 6) |
| **Personal taste** | `--p <profile code>`, with `--s` as its strength | `--s` also scales how strongly a profile or moodboard applies |
| **Finals** | `--hd`, the hero's seed and every other parameter unchanged; `--ar` no wider than 4:1 | HD is native 2048px at 1.3 GPU min; "Run batch as HD" reruns a seedlocked prompt in HD |
| **Words in the image** | the words in double quotes, `--raw`, `--s` at 100 or below | quoted text renders best; raw and lower stylize help when it fails |

## 6. Kevin's sref library

`references/sref-library.md` lists all 21 codes registered in DZNR, with status. In short:

| Code | Look (DZNR's note, not verified externally) | best_for | Styles here that use it |
|---|---|---|---|
| 3730410722 | inky graphic-novel character sheets, dramatic rim light, limited moody palette | character, character_sheet, key_art | Ink and Cel Illustration, Mature 90s Anime (the V8.2 line) |
| 1464381114 | moody cybernetic figures, atmospheric depth, desert and neutral tone | vehicle, prop, environment, character | Techwear Editorial, the One-metaphor Campaign family |
| 1226151696 | darker nocturnal variant, high-contrast silhouette, cool cast | key_art, environment, mood | Monumental Calm (night), Synthwave, the Explorable Brand World family |

The other 18 are registered and usable, and their look is not yet characterised: Midjourney shows a
code's style preview only to a logged-in user, and no public catalogue lists them. Kevin can log in and
the lead will characterise them at no cost. This library never describes an uncharacterised code's look
and never assigns one to a style.

**Pairing an sref with a written palette.** The sref carries the rendering (line, texture, contrast,
light, brush); the prompt text carries the colour, named hue by hue; `--sw` balances them. Start at 250
for QKI and at 100 to 200 elsewhere. If the stated palette washes out, lower `--sw`; if the look slips
toward generic, raise it.

**Blending.** Several codes can be listed (`--sref 3730410722 1226151696`) and mixed with image URLs.
Per-code weights in the form `code::2` are not documented for V8, and V8 has no `::` multi-prompting, so
a blend here is an unweighted list: test before relying on any weight.

**Moodboards.** A moodboard is called with `--p <moodboard ID>`. It cannot take `--sw` or `--sv`; `--s`
scales its influence, and `--w` is removed from moodboard jobs. Use one when a single code is too thin.

**Profiles.** `--p` alone applies the defaults selected in settings; `--p <ID or code>` applies one
profile; the name never works. A profile ID converts to a code at submit. Extra V8 profiles can be made
and do not work in V7.

**Version of the sref engine.** V8 changed the default sref engine in March 2026; the docs give no
`--sv` values for V8.1 or V8.2 (not confirmed), so no template writes `--sv`. Judge every code from a
V8.2 render, not from an older catalogue grid.

## 7. Series and consistency in V8

The order that works is the one `prompt-architecture` gives: hero first, lock second, coverage third.

1. **Lock the hero.** Record the full prompt, the seed (`--seed`), the sref and `--sw`, the profile code,
   `--ar` and `--s` in `pack.md`. That record is the lock.
2. **Coverage with the Edit Model.** Attach up to 4 references (the locked hero first; then, if needed,
   the second angle, the colourway swatch, the character sheet) and write an instruction: what stays,
   then the one thing that changes. The Edit Model works with image prompts, sref, moodboards, `--p`,
   `--hd` and `--raw`; it does not take `--tile`, and its results cannot be Remixed. It matches the first
   reference's ratio unless `--ar` is given. Since 2026-09-24 inpaint and outpaint change only the
   selected pixels, so repeated edits do not degrade the frame. Retexture in V8 is an Edit Model prompt
   ("hand drawn pencil sketch of this image", with an sref).
3. **New frames from text, when the Edit Model is not the right tool.** Keep the skeleton, the seed,
   the sref, `--sw` and `--p`; change one slot; `--c 0`.
4. **Sref plus moodboard.** A moodboard can carry the world (its places and materials) while a code
   carries the rendering. Moodboards cannot take `--sw`, so tune the balance with `--s`.
5. **Contact sheet.** Lay the series out and run the series-coherence line of `quality-gate`.

## 8. Anti-sheen and finishing

**Inside Midjourney.**
- `--raw` and a low `--s` for anything that must look photographed or manufactured.
- Real-light vocabulary, never "cinematic lighting": "flat overcast daylight", "large soft key top-left,
  white bounce right, soft contact shadow", "raking late-afternoon sun", "one practical lamp at the
  window", "blue hour", "fluorescent hangar light".
- Name the wear: scuffed edges, a peeling asset tag, gaffer-tape repair, sun-faded label, graphite
  smudges, chipped enamel, water beading on fabric. Two or three per object.
- Micro-detail with true values: legends on controls, part counts, ISO container codes, coordinates.
- `--no glow, bloom, lens flare, neon, text, logo` as the default exclusion line, trimmed to the four or
  five that the style tends toward.

**Outside Midjourney** (Steps 6 and 10 of `legendary-standard`).
- **The type layer by hand:** titles, spec blocks, callouts, seals and lockups in Figma or Pencil.
- **Upscale before motion:** an SD image goes through Midjourney's Upscale; an HD image is already 2048px.
  For delivery resolution beyond that, Higgsfield's upscale tools or Topaz through a RunningHub workflow
  or AI App. Pan, Zoom Out and Vary Region on an HD image return SD results; Upscale brings them back to
  HD.
- **Grade:** a lifted black, 2 to 4 percent grain, halation only where the medium is film, scanlines only
  where the world is a screen; Adobe for creativity for grain, colour temperature and HSL.
- **Curation:** 12 to 20 candidates per kept hero, 3 to 5 per series frame; reject with the
  `quality-gate` failure codes.

## 9. Draft to hero

1. **Explore cheaply.** Draft mode on the website: 24 images at 512px for 0.4 GPU min, and Vary or Remix
   renders the chosen one at full quality. The docs conflict: the V8 compatibility chart marks Draft as
   unsupported, while the newer Draft page and the 2026-10-07 changelog say it works on the web in V8.1
   and V8.2. Use it on the website; if it is refused, explore at `--sd` with `--c 30 to 60` instead.
   `--sref random` in Draft gives 24 different styles.
2. **Curate.** Contact sheet; keep two or three directions; record why each was kept.
3. **Lock.** Pick the hero, write the lock into `pack.md` (prompt, seed, sref, `--sw`, `--p`, `--ar`, `--s`).
4. **Finals in HD.** Rerun the seedlocked hero with `--hd` (or "Run batch as HD"); then the series through
   the Edit Model at `--hd`.
5. **Finish outside Midjourney.** Type layer, upscale where needed, grade.
6. **Then video.** Animate the approved still (section 10).

Thinking Mode ("Rerun (Thinking)", where the model checks where it missed the prompt and regenerates) is
alpha-only as of October 2026; do not build a step on it.

## 10. Video

- Image-to-video from the approved still: 5 seconds, an optional text prompt for the motion.
- `--motion low` (default) for still scenes, slow camera and subtle movement; `--motion high` for big
  camera and character motion, with a higher risk of glitches. `--raw` gives more control.
- `--loop` ends on the start frame (a seamless loop); `--end <image>` sets the end frame, so two locked
  series frames can become one move; `--bs 1` renders one clip instead of four while drafting.
- Extend by 4 seconds at a time, up to 4 times, to 21 seconds: Extend Auto keeps the prompt, Extend
  Manual takes new text. Each extend costs a generation.
- SD is 480p and HD is 720p (Standard, Pro and Mega plans, Fast mode). A batch of 4 costs 8 GPU min in SD
  and 26 in HD.
- Image parameters are stripped when animating, and `--sref`, image prompts and edit references do not
  work in video: the look comes from the start frame.
- The video model's version is not named in the docs (presumably the V1 model of June 2025; not
  confirmed). For a drawn medium that must move on twos, or a beat that needs native sound, Kling, Wan
  via Runway or Seedance (`wan-video-prompts`, `seedance-director`) may hold the medium better; the beat
  written here still serves as the brief.

## 11. Not confirmed (do not rely on these)

- Which `--sv` values V8.2 accepts.
- Per-code `::` weights on sref codes in V8.
- The `--exp` range (0 to 100 is from a third-party source; the docs chart lists `--exp` as supported).
- The prompt length limit that triggers the Prompt Shortener.
- The video model's version.
- Whether `--sref` and `--raw` apply to Niji 7 (the docs confirm Personalization and Moodboards for it).
- Draft mode in V8 (works on the website by the newer pages; the chart says otherwise).
- The looks of 18 of Kevin's 21 codes, and the externally unverified notes on the other three.

---

## How to use the library

1. Resolve the world (Step 0 of `legendary-standard`) and pick the style (`style-library`).
2. Open the style's section in `references/library-kevins-fifteen.md`,
   `references/library-reference-styles.md` or `references/library-top-references.md`.
3. Fill the slots from `pack.md`; set the recipe from section 5; add `{SREF}` and `{P}` or delete them.
4. Draft, curate, lock, then the series variant and the Edit Model instruction, then the video beat.
5. Gate with `quality-gate` (after the Fidelity Gate or the Prime Gate where they apply).

Slots are in braces. `{SREF}` is either `--sref <code> --sw <weight>` from the pack or nothing; `{P}` is
either `--p <profile code>` or nothing; `{SEED}` is the locked hero's seed.

## Reference files

- `references/v8-parameters.md`: every V8.2 parameter with its range, notes and the docs page it came from.
- `references/sref-library.md`: Kevin's 21 codes, the three characterised, the 18 to characterise, and how.
- `references/library-kevins-fifteen.md`: Kevin's fifteen styles, five prompts each.
- `references/library-reference-styles.md`: the eight styles found in his references, five prompts each.
- `references/library-top-references.md`: the six reference families that scored highest, five prompts each.

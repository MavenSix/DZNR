---
name: legendary-standard
description: >
  DZNR's method for producing assets and artifacts at the bar Kevin set on 2026-10-23 ("the quality has
  to be legendary and I'm not there yet"), for DZNR OS and Pulse OS alike. Every job produces a pack, not
  a picture: one governing idea, a locked reference, a palette of neutrals plus one signal colour sampled
  from the subject, a locked hero frame with series coverage, a type layer set by hand, staging, one
  motion beat, micro-detail, a finishing pass, curation, and the quality gate before anything ships.
  Twelve numbered steps from brief to ship, each with its owner (Snape, Cheetara, Gibson, Neo, Morpheus,
  Gandalf), its DZNR tool (Midjourney with Kevin's sref, Nano Banana, Higgsfield, Flux, Wan via Runway,
  Seedance, Kling, Topaz via RunningHub, Blender MCP, Adobe for creativity, the threejs-* skills) and its
  pass test. Resolves the world first: DZNR's own work loads kevin-taste, an author's world loads
  author-world-authority and its approved pack, a QKI pack loads qki-style-authority. Pairs with
  style-library (the look), prompt-architecture (the words), quality-gate (the check) and
  immersive-world-site (when the pack becomes a site). Triggers on "legendary", "make it legendary",
  "quality bar", "raise the bar", "hero asset", "key art", "campaign pack", "asset pack", "make a pack",
  "this looks like AI", and on any image, video, 3D or site job for DZNR OS or Pulse OS that names no
  narrower skill.
---

# The Legendary Standard

Thirty-six references were studied on 2026-10-23 (`references/evidence.md` lists them). The ones that
scored 5 across the board shared one property: none of them was a single lucky image. Each was a
**pack**: an idea that governed ten to thirty artefacts, a palette that held across all of them, a
reference that locked the look, a layer of type the model never made, a stage, and one moment of motion.
Average AI output has a subject. Legendary work has a thesis.

> Every job produces a pack, not a picture: an idea, a palette, a locked reference, a type layer,
> staging and one motion beat, checked by a quality gate before anything ships.

This skill is the method. It is a pipeline, not a mood: every step has an owner, a tool, an output that
goes in the pack, and a test that says whether the step is done.

---

## Step 0: Resolve the world (before any word of a prompt)

| The job | Taste source | Gates, in order |
|---|---|---|
| DZNR's own work (DZNR OS, Pulse OS chrome, Kevin's brand, Kevin's pitches) | `kevin-taste` | `quality-gate` |
| An author's world (a Pulse OS job, a manuscript, anything naming no QKI pack) | `author-world-authority` and the author's **approved** pack; `lore-engine` canon | Fidelity Gate, then `quality-gate` |
| A QKI pack | `qki-style-authority` and the world pack | Prime Gate, then `quality-gate` |
| A client brand | the client's brand system (Snape) | `quality-gate` |

`kevin-taste` is never imposed on an author's world or a client's brand. On an author world the
`style-library` entries are options offered to the author, and the author's pack decides. Authors come
wary of AI: on their worlds the trust rules (`references/author-trust.md`) block alongside the gates. Nothing in this
method overrides a Fidelity Gate or Prime Gate failure: `quality-gate` runs after them, never instead.

---

## The pack (what ships)

A pack is a folder (or an asset-manifest group) holding, at minimum:

| # | Item | File or record |
|---|---|---|
| 1 | Thesis | `pack.md`: one sentence, plus three rules it implies |
| 2 | Reference lock | the sref code, the trained Flux style id, the Higgsfield Soul Character or reference element ids, or the approved hero plate's path |
| 3 | Palette | tokens with names and hex: up to four neutrals, one signal, one alarm only if a UI needs errors |
| 4 | Hero frame and series | the approved hero, plus at least six series frames that change one variable each |
| 5 | Type layer | the layout file (Figma, Pencil or code) with display and label faces named |
| 6 | Staging | at least one frame of the work in its world: a device on a set, a plate in a mockup, a scene in a film |
| 7 | Motion beat | one clip or one live interaction, 3 to 8 seconds, with its brief |
| 8 | Micro-detail sheet | the in-world codes, counts, coordinates and labels used, with where each came from |
| 9 | Scorecard | the `quality-gate` scorecard, with the gate result |

A single still for a single slot is still made this way; the pack is just smaller (thesis, palette,
lock, the frame, its type layer, the scorecard).

---

## The twelve steps

Each step: what to do, who owns it, which tool serves it (`references/tool-map.md` has the routes and
statuses), and the test that says it is done.

### 1. Brief to thesis
Write the governing idea as one sentence a stranger could apply. Then derive three rules from it, one each
for palette, framing and copy. Good: "The body as terrain" (@ovyonlabs, ASEMIC): faces recede, the
circle is the lens, spec text is texture. "Autumn is motion" (@danielsnows, FedEx concept): every frame
carries leaves in flight. "One login, everything connected" (@atsmatrix) was beautiful and still drew
"More AI slop" from its top comment, because the idea was never made legible on screen.
- **Owner:** Snape (DZNR and brands), Cheetara (worlds), Morpheus words it.
- **Tool:** none; a sentence in `pack.md`.
- **Done when:** every later choice can be justified by pointing at the thesis, and the thesis can be
  read off the hero frame by someone who has not seen the brief.

### 2. Reference lock
Name the taste source (Step 0) and one heritage anchor that gives model and viewer a grammar: Braun 1968,
a 1999 Sony that never shipped, The Designers Republic's Wipeout identity, Teenage Engineering, Territory
Studio's film interfaces (as comparison only). Pick the `style-library` entry or entries. Never "modern",
"futuristic" or "premium" alone.
- **Owner:** Snape (DZNR), Cheetara (author worlds and QKI; the author approves).
- **Tool:** `style-library`, `kevin-taste` or the author world pack.
- **Done when:** the lock is a named source plus a named anchor plus a style entry, written in `pack.md`.

### 3. Palette rule
Neutrals plus one signal colour, **sampled from the subject**: the broth in a ramen bowl, the safety
orange of a shipping container, the record button. Sample with an eyedropper from the approved hero or
the subject's reference, write the hex, name the token. The signal goes on the one element that carries
meaning. A second accent is allowed only as an alarm state in UI.
- **Owner:** Snape (tokens), Cheetara (pack roles on a world).
- **Tool:** `colorize`, `ds-theming`; the author pack's palette on an author world.
- **Done when:** a hue count of any pack frame finds the neutrals plus one signal, and each hex is in
  `pack.md` with its name.

### 4. Hero frame, then lock it
Generate the hero widely, approve one, and **lock it before making anything else**. Coverage comes from
the lock, not from fresh prompts: @kreevslab built a whole storyboard from one Midjourney base character
with a single `--sref`, using an edit model for every angle, ratio and beat.
- **Owner:** Cheetara (worlds), Gibson (experience and campaign heroes), Snape (brand).
- **Tool:** Midjourney V8.2 on Kevin's own account with `--sref` (interactive sessions only, through the
  browser profile; prompts, recipes and Kevin's sref library in `midjourney-legendary`), Flux with a trained style (where QKI work runs today), Higgsfield (identity lock), Nano Banana
  (image-to-image edits from the hero).
- **Done when:** the hero is approved and its lock id is recorded.

### 5. Series thinking
Make the series by changing **one variable per frame**: colourway, angle, ratio, beat, district. 20 hands
in 20 liveries (@jasonscarecrowart); one bento skeleton in seven worlds (@pxdx.baddies); a 2,000-post
feed with fixed framing (@an_improbable_future). Lay the series out as a contact sheet and check it reads
as one body of work.
- **Owner:** Cheetara, Gibson.
- **Tool:** Nano Banana or Higgsfield edits from the locked hero ("same object, same light, change only
  the colourway"); Midjourney's Edit Model from the locked hero (up to 4 references) or `--sref` with the same `--seed`
  (`midjourney-legendary`); Higgsfield reference elements.
- **Done when:** at least six frames, one variable changed in each, and the contact sheet passes the
  series-coherence line of `quality-gate`.

### 6. Type layer, by hand
Models do not set poster-grade type. Generate frames **without** text, then set the type layer in a
layout tool: a characterful display face plus a neutral or mono label face; one mixed-weight or italic
emphasis per headline; the technical-poster grammar where it fits (vertical title, 6pt spec blocks,
hairline callouts, a seal, a signature mark).
- **Owner:** Snape (type system), Morpheus (the words).
- **Tool:** Figma MCP or Pencil MCP for layout, `typeset` for the system, code for web.
- **Done when:** no model-made lettering remains in the frame, and the faces are named in `pack.md`.

### 7. Staging
Show the work in its world. A utility demo set into a terrazzo wall under raking sun
(@juliendesigncraft); a tablet floating over a set built from the subject's own materials
(@skvortsov.design); a real phone shot on black marble (@tonythetechie with @augma.im); a site mockup with
the hero's leaves in front of the device (@danielsnows).
- **Owner:** Gibson (experience and product staging), Cheetara (a world's plates in context).
- **Tool:** Blender MCP for sets and device placement, Higgsfield or Nano Banana for in-situ composites,
  Runway or Kling for a filmed stage.
- **Done when:** at least one pack frame shows the work in a lit, material context, not on a flat
  background.

### 8. One motion beat
Motion means one memorable beat, not constant movement: a notch morph, a full-grid white flash on success,
a scroll-scrubbed exploded view, a dial turning two detents. Always image-to-video from the approved and
upscaled plate.
- **Owner:** Cheetara (clips from a world's plates), Gibson (experience motion), Neo (live web motion).
- **Tool:** Wan via Runway (`wan-video-prompts`), Seedance (`seedance-director`, through Higgsfield or
  RunningHub), Kling; for live web, `threejs-animation`, GSAP or Motion.
- **Done when:** one beat, 3 to 8 seconds, with a hold before and after, and the medium preserved (ink
  stays ink, photo stays photo).

### 9. Micro-detail
Fiction feels engineered when its small print is true. Write the in-world specifics: ISO container codes
("22 G1"), part counts ("128 pieces"), fabric composition, coordinates, version strings, bracketed
numbering [01], a live counter. Source each from the domain or the canon, never lorem.
- **Owner:** Morpheus (in-world copy), Cheetara (canon on an author world: `lore-engine` facts only).
- **Tool:** the type layer (Step 6); `lore/canon.json` on an author world.
- **Done when:** the micro-detail sheet lists every code and its source, and none contradicts the canon.

### 10. Finishing pass
Upscale **before** animating (@bywaviboy: "Upscale everything before you move forward"). Then grade, lens
and grain: a lifted black, 2 to 4 percent grain, halation where the medium is film, scanlines only where
the world is a screen.
- **Owner:** Cheetara and Gibson for the asset; Gandalf checks.
- **Tool:** Higgsfield's upscale tools, Topaz via RunningHub; Adobe for creativity for grain, grade and
  colour temperature; Blender MCP for 3D render passes. Magnific, which creators use, is not a DZNR route.
- **Done when:** the plate is at delivery resolution before any motion, and grain and grade match across
  the series.

### 11. Curation
Generate many, keep few. For a hero, 12 to 20 candidates per kept frame is normal; for series frames,
3 to 5. Kill the sheen: reject anything with AI glow, plastic skin, waxy fabric, mushy background detail
or a centred hero pose nobody asked for. @an_improbable_future's line is the posture: "Designed by AI -
created & curated by me."
- **Owner:** Gandalf with Snape (DZNR taste) or the author (author worlds).
- **Tool:** a contact sheet; `quality-gate` failure list as the reject reasons.
- **Done when:** every kept frame has a reason it was kept, and the rejects are recorded with their failure
  mode.

### 12. The gate, then ship
Run the Fidelity Gate or Prime Gate where they apply, then `quality-gate`. Ship only at the threshold.
For UI and sites, `polish` and `critique` run inside the gate's craft and legibility checks.
- **Owner:** Gandalf.
- **Tool:** `quality-gate`.
- **Done when:** the scorecard is in the pack and says SHIP.

---

## Who owns what (summary)

| Agent | Steps |
|---|---|
| Snape | 1 (DZNR, brands), 2, 3, 6 (type system), 11 (taste) |
| Cheetara | 1 (worlds), 2 (worlds), 4, 5, 7 (worlds), 8 (clips), 9 (canon), 10 |
| Gibson | 4 (experience heroes), 5, 7, 8 (experience motion), 10 |
| Neo | 8 (live web motion), and builds the site when the pack becomes one (`immersive-world-site`) |
| Morpheus | 1 (words the thesis), 6 (the words), 9 (in-world copy) |
| Gandalf | 11, 12, and the check on 10 |

## Reconciliation with existing skills

- `high-end-visual-design`, `design-taste-frontend`, `minimalist-ui`, `industrial-brutalist-ui`: page and
  component craft. They apply inside Step 6 and Step 12 for UI. When a `style-library` entry names a
  typeface that one of them bans as a default (Helvetica in a Swiss pack), the named choice wins: the bans
  target defaults, not decisions.
- `critique` and `polish`: run by `quality-gate` for UI and sites.
- `seedance-director`, `wan-video-prompts`: Step 8's grammar.
- `midjourney-legendary`: Steps 4, 5, 8 and 10 when the tool is Midjourney: V8.2 grammar, parameter
  recipes, Kevin's sref library, and a hero, series, Edit Model and video prompt for every style.
- `qki-style-authority`, `author-world-authority`, `lore-engine`: Step 0 and the gates that run before
  `quality-gate`.

## Reference files

- `references/tool-map.md`: every tool by step, with its DZNR route, status and fallback.
- `references/pack-template.md`: the `pack.md` skeleton to copy.
- `references/evidence.md`: the 36 references this method was drawn from, one line each.
- `references/author-trust.md`: earning a sceptical author, eight rules with their tests, blocking on
  every author's world.
- `references/quickstart.md`: how Kevin makes one legendary asset in DZNR OS, step by step.

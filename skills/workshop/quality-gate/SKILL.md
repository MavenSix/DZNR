---
name: quality-gate
description: >
  The check every DZNR asset, artifact and site passes before it ships, for DZNR OS and Pulse OS alike.
  Scores six dimensions 1 to 5 (concept, craft, finish, originality, legibility of meaning, series
  coherence) against written anchors, applies a ship threshold (no dimension below 4), and runs a
  checklist of named failure modes drawn from the 2026-10-23 research: AI sheen, loose palette, no type
  layer, model-made lettering, illustration smoothed in motion, meaningless spectacle that draws "AI
  slop", no micro-detail, no staging, generic composition, default lighting, identity drift, the depth
  gimmick, and, on DZNR's own UI, outline strokes on cards and pills. Each failure has its test and its
  fix. Callable by any agent and by author-world-authority's Fidelity Gate; it runs after the Fidelity
  Gate or the Prime Gate, never instead of them, and never marks an author's chosen medium down. Writes a
  scorecard into the pack. Owned by Gandalf. Triggers on "quality gate", "is this ready", "ready to ship",
  "gate this", "score this", "is this legendary", "does this look like AI", "slop check", and at Step 12
  of legendary-standard.
---

# Quality Gate

The last check before anything leaves DZNR. It exists because the research found the same nine gaps
between Kevin's references and typical one-prompt output, and every one of them is checkable.

**Order is fixed.** On an author world, the Fidelity Gate (`author-world-authority`) runs first. On a QKI
pack, the Prime Gate (`qki-style-authority`) runs first. An asset that fails either never reaches this
gate: fidelity is not traded for finish. This gate then asks whether a faithful asset is also good enough
to ship.

**Whose taste.** On DZNR's own work the taste reference is `kevin-taste`. On an author world it is the
author's approved pack, and nothing here penalises the medium, realism level or palette the author chose:
a watercolour pack is judged as watercolour, a photographic pack as photography. On a client brand it is
the client's system. Originality is judged within the chosen world, never against Kevin's preferences.

---

## How to run it

1. **Confirm the upstream gate.** Author world: Fidelity Gate passed, with the pack version. QKI: Prime
   Gate passed. Record both in the scorecard. If not, stop and send the asset back to that gate.
2. **Gather the pack.** The asset, its series siblings, `pack.md` (thesis, palette, lock), the brief.
   A single asset with no pack is scored against the brief and the brand or world it belongs to.
3. **Run the failure checklist** (below and `references/failure-modes.md`). Each check is a yes or no
   with evidence. A blocker found is enough to stop: record it, apply the fix, re-run.
4. **Score the six dimensions** against the anchors. Write one sentence of evidence per score. A score
   with no evidence is a 3.
5. **Apply the threshold.** Write SHIP, REWORK or KILL, with the next action.
6. **Write the scorecard** (`references/scorecard-template.md`) into the pack or the asset manifest.

For UI and sites, step 3 also runs `critique` (its AI-slop detection and heuristics), `polish` (its
pre-ship pass) and `fixing-accessibility`; for sites with motion, `fixing-motion-performance`. Their
findings feed craft and legibility. This gate does not re-implement them.

---

## The six dimensions

| Dimension | 1 | 3 | 5 |
|---|---|---|---|
| **Concept** | No idea beyond the subject ("a robot hand") | An idea, applied unevenly; some frames could belong to any project | One governing idea that dictates palette, framing and copy in every frame ("the body as terrain") |
| **Craft** | Errors a viewer sees at once: anatomy, garbled text, broken mechanics, misaligned UI | Competent; a few soft spots (mushy background detail, one off-grid element, an unhandled state) | Every detail holds at 100 percent zoom: mechanics make sense, materials read, UI states complete, type set to a grid |
| **Finish** | Raw output: sheen, default grade, compression, wrong resolution | Graded and upscaled, but grain, lens or grade differ across the set | Delivery resolution before motion, one grade, grain and lens matched across the pack, staged |
| **Originality** | A known look copied, or the generic AI trope of its genre | A known grammar used well, nothing of its own | A heritage grammar remixed into something with its own point of view |
| **Legibility of meaning** | A viewer cannot say what it is or why it matters | The point is there if explained | The point reads in three seconds from the frame itself: a label, a caption, a title or a staging choice carries it |
| **Series coherence** | Frames look like different projects | Same subject, drifting palette, light or identity | Ten frames read as one catalogue: one lock, one palette, one camera language, one variable changed per frame |

Series coherence for a lone asset is scored against the existing pack, brand or world it joins. A true
first frame with no siblings scores it n/a, and then every other dimension must reach 4.

## The threshold

| Result | Rule | Next action |
|---|---|---|
| **SHIP** | No dimension below 4, no blocker failure open | Ship; record the scorecard |
| **LEGENDARY** | SHIP, plus a total of 27 or more and concept 5 | Ship; flag it as a reference frame for the pack and for `kevin-taste` or the author pack's examples |
| **REWORK** | Any dimension at 3, or a blocker with a known fix | Apply the named fixes, regenerate or re-edit, re-run the gate |
| **KILL** | Concept or legibility at 1 or 2, or three REWORKs on the same asset | Back to Step 1 of `legendary-standard`; the thesis or brief is the problem, not the render. On an author world after three failures, ask the author through the pack, as the Fidelity Gate does |

Internal drafts (never shown outside the team) may circulate at 3s; nothing reaches Kevin as "done", an
author in Pulse OS, a client, or a public channel below SHIP.

---

## Failure checklist (summary)

Full tests and fixes in `references/failure-modes.md`. B = blocker, M = major (lowers a score, does not
stop the gate alone).

| # | Failure | Sev | Test (yes means failed) | Fix in one line |
|---|---|---|---|---|
| F1 | AI sheen | B | Glow, plastic skin, waxy fabric, airbrushed surfaces, HDR halo on edges | Flat motivated light, name the wear, `--style raw`, grade down, add grain |
| F2 | Loose palette | B | More than one signal hue, or a hue not in the pack | Re-sample the signal from the subject; recolour or regenerate with the hex |
| F3 | No type layer | M | A frame meant to carry meaning has no designed type | Set display plus label faces by hand (Step 6) |
| F4 | Model-made lettering | B | Any text the model generated: garbled, fake brand marks, pseudo-kanji | Regenerate without text; set it in Figma, Pencil or code |
| F5 | Illustration smoothed in motion | B | A drawn plate turned soft, 3D-ish or interpolated in video | Upscale first, image-to-video, "hold linework and flat colour, on twos", reject smoothed takes |
| F6 | Meaningless spectacle | B | A viewer asked "what does this mean" would get no answer from the frame | Add the reading: a label, caption, title or staging that states the point |
| F7 | No micro-detail | M | In-world labels are lorem, generic or absent where the world would have them | Write domain codes, counts, coordinates, spec text from the domain or canon |
| F8 | No staging | M | The work is shown raw on a flat background when it will live in a context | Stage it: a device on a set, a plate in a mockup, a scene in a film |
| F9 | Generic composition | M | Centred hero pose, symmetrical template grid, or a layout from a starter kit, with no reason | Recompose from the thesis: orthographic plate, one-third, crop, type-behind-object |
| F10 | Default lighting | M | "Cinematic lighting" mush: unmotivated rim light, teal-orange by default, no source | Name the light: source, direction, quality, time; match the pack's camera language |
| F11 | Identity drift | B | A recurring subject's face, costume, object or marque changes across the series | Re-lock (sref, `--oref`, Higgsfield Soul Character, reference elements) and regenerate from the hero |
| F12 | Depth gimmick | M | Parallax or pop-out depth carries the piece with no type or art direction behind it | Remove the trick or earn it: art-direct the layers, add the type system |
| F13 | Outline strokes on DZNR UI cards and pills | M | DZNR OS or Pulse OS chrome uses 1px strokes to separate cards, pills or tags | Fill plus a soft two-layer shadow (DZNR OS decision 218); strokes return only under Increase Contrast |
| F14 | Missing respect controls | B (sites) | An immersive site with motion or sound lacks sound off, skip, replay or reduced motion | Add them (`immersive-world-site`) |

F13 applies to DZNR's own product chrome only, never to an author's or client's design.

---

## Called by the Fidelity Gate

`author-world-authority` hands an asset here after its Fidelity Gate passes. The scorecard records the
pack version and the gate passed. A REWORK from this gate regenerates within the pack (the pack's medium,
palette and camera language stay fixed); a fix here that would change the pack (a new palette, a new
medium) is not applied: it becomes a suggestion to the author, offered through the pack, never imposed.

## Reference files

- `references/failure-modes.md`: each failure with its source in the research, its test, its fix, the
  owner who applies the fix, and the prompt change that usually cures it.
- `references/scorecard-template.md`: the scorecard to write into the pack.

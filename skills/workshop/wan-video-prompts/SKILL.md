---
name: wan-video-prompts
description: Writing shot briefs for Wan 3.0 video (text-to-video and image-to-video, native audio), learned from a credited library of seven working cases. Use when a clip is to be made with Wan (DZNR OS reaches it through Runway as `wan3`), when Cheetara turns a world's approved plates (QKI or an author's world) into motion clips, or when any agent needs a video prompt that holds identity, screen direction and pacing across shots. Pairs with seedance-director for Seedance; this is the Wan grammar.
---

# Wan 3.0 shot briefs

A Wan clip is only as legible as its brief. The cases in `references/cases.md` (seven, each credited to its creator, CC BY 4.0) work for the same reasons, and those reasons are the skill. Read the cases for the directing logic; never copy a case's look into client, author or QKI work.

## The brief, in the order the model reads it

1. **Length, frame and form first.** "Create a 15-second, 9:16 ..." or "a 30-second, 16:9 ...". Then the medium: "2D hand-drawn cel-animated", "cinematic 3D-realism", "image-to-video from the attached still". Every case opens this way.
2. **Who and where, with what must not change.** Name each subject by role and look, then the continuity rule in words: "keep their faces, bodies, outfits, and positions consistent", "preserve the cyclist, bicycle geometry, horizon, and time of day". With reference inputs, assign each one a job: image 1 is identity, image 2 is location, audio 1 is the voice (case 4).
3. **Screen geography.** Where each subject starts and the camera axis that holds through every cut: "spear fighter screen-left, brawler screen-right; keep that south-side camera axis throughout" (case 2). Crossing the axis is what makes a fight unreadable.
4. **Beats on a clock.** Timed sections ("at 0-4 seconds ... at 4-8 seconds ...", case 5), or numbered shots for a multi-shot piece (case 2: seven shots in 15 seconds). Cut only when the story beat changes (case 3).
5. **The camera serves the beat.** One deliberate move per beat: a slow push-in to hold tension, a track toward a character to reveal, a handheld push through a window into a wide landscape (case 7). No move for spectacle alone.
6. **Readable action.** For action: what each exchange is, what is allowed ("only fists, blocks ..."), hit-stops, and colour-coded energy per side (cases 1 and 2), so the eye can follow who did what.
7. **Sound inside the brief.** Native audio is written with its timing, not added later: wind and distant surf first, then the cue that lands the beat (cases 6 and 7). With a voice reference, say who speaks and when.
8. **A motivated last beat.** End on the reveal or the turn the clip exists for (case 3), not on a fade because the clock ran out.

## Cheetara's motion clips: which engine

Cheetara resolves the engine before she writes a brief. A plate from a QKI pack follows the QKI section below. A plate from an author's world (a Pulse OS job, or anything not naming a QKI pack) follows the author-world section after it. QKI is never assumed for an author's work.

## Cheetara's motion clips from QKI plates

On a QKI pack, Cheetara uses this with the QKI engine, in this order, and the QKI rules win wherever they meet Wan's habits:

- Load `qki-style-authority` and resolve the world pack before writing a word. The pack's motion state (Stillness, Flow, Resonance, Collapse and the rest) sets how things move; write it into step 4 and step 5.
- Image-to-video from the approved plate, always (step 2's reference form): the plate is the identity, the place and the palette. Say "preserve the linework, flat colour fields and ink texture of the attached plate".
- **Never "3D-realism", "photoreal", "cinematic lighting with depth of field"** in a QKI brief: they pull the clip toward a render, and a render fails the Prime Gate however good it looks. Name the drawn medium instead ("hand-drawn ink and flat colour, graphic-novel panel motion"), as case 2 does for cel animation.
- Every output frame passes the Prime Gate before it reaches the manifest. A clip that reads as a 3D render is regenerated with a sharper drawn-medium directive, never accepted to keep the pipeline moving.
- Record the brief, the model (`runway:wan3` or the route used) and the plate it came from in the asset manifest.

## Cheetara's motion clips from an author's world

On an author world the pack's medium decides, and the author's rules win wherever they meet Wan's habits:

- Load `author-world-authority` and the author's approved pack before writing a word. The pack's motion language sets how things move; write it into step 4 and step 5, and its camera language into step 5.
- Image-to-video from the approved plate, always: the plate is the identity, the place and the palette. Say what to preserve in the pack's own medium ("preserve the faces, wardrobe, film grain and available light of the attached still").
- Name the pack's medium in step 1, whatever it is. A photographic or 3D-real pack may ask for "cinematic 3D-realism" or "photoreal"; a painterly or drawn pack names its own medium instead, as the QKI section does. The QKI exclusions apply only when the pack opted into QKI.
- Put the canon in step 2: the subject's stated look and age at this point in the story, with the passages it comes from.
- Every output frame passes the Fidelity Gate before it reaches the manifest: wrong medium or broken canon is regenerated with that field stated harder. A clip never fails for looking real when the pack says it should.
- Record the brief, the model, the plate, the engine and pack, and the canon passages in the asset manifest.

## Cost and route in DZNR OS

DZNR OS reaches Wan through the Runway driver (`wan3`, seen in the Ledger). Video is priced per clip before it runs, and a clip over the spend gate asks first. Draft at the shortest length that shows the beat (5 to 8 seconds), then extend the approved one: the cases' 15 to 30 seconds are finished pieces, not first passes.

## Attribution

The cases come from [imagineVid/Awesome-wan-3-0-prompts-and-skills](https://github.com/imagineVid/Awesome-wan-3-0-prompts-and-skills) at d789b69, CC BY 4.0 (`references/LICENSE-CC-BY-4.0.txt`). Each case names its creator and source; keep those with any case quoted elsewhere. The guidance above is DZNR's own reading of them.

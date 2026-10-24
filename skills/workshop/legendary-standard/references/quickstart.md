# How to make a legendary asset in DZNR OS

Kevin, 2026-10-23: "Bottom line, I need to know how to, one, create these legendary assets." This is the
sequence, in the order you do it. The method behind it is `legendary-standard`; this page is the short
way through.

## The steps

1. **Name the world in the request.** In DZNR OS, type (or say) what you want and whose world it is.
   DZNR's own: "Make a legendary hero for the DZNR OS launch: the field recorder that never shipped." An
   author's: "Make a legendary pack for scene 4 of The Salt Road" (a Pulse OS author's project). QKI:
   "Make a legendary key art for the Wound Keepers' stronghold, QKI." The world decides the taste: `kevin-taste` for DZNR's own, the author's approved pack for an author,
   `qki-style-authority` for QKI. Tár routes it.

2. **Approve the thesis.** Snape (DZNR and brands) or Cheetara (worlds) writes `pack.md`: one sentence,
   three rules it implies, the reference lock, the palette (neutrals plus one signal colour with its hex),
   and the style entry. Morpheus words the thesis. **You approve it or change it here.** Nothing is
   generated before this.

3. **The agents draft the prompts.** From `pack.md`, `prompt-architecture` and `midjourney-legendary`
   they write the hero still, the series variant, the Edit Model instruction and the video beat for the
   tools the pack names. For Midjourney you get the prompts to run yourself (step 4); for the other tools
   (Nano Banana, Higgsfield, Wan via Runway, Kling) DZNR OS runs them under the spend gate.

4. **Run Midjourney yourself on alpha.midjourney.com/imagine.** Paste the hero prompt. On DZNR's own
   work and QKI it already carries your srefs and your profile, `--p
   94b2bfcd-291e-4745-8ac6-a07a7c643e0b`; on an author's world it carries only what the author's pack
   holds, never your codes or profile. Explore first in **Draft** (24-image grids, cheap) and keep two or
   three directions. On a kept candidate that drifted, has a short word to render, or is dense, choose
   **Rerun (Thinking)**. Put the curated set in one shared folder and save the chosen hero into the
   project's inbox.

5. **Approve the hero frame.** Cheetara or Gibson records the lock (prompt, seed, sref, `--sw`, `--p`,
   `--ar`, `--s`) in `pack.md`. **You approve the hero here.** Everything else is made from it.

6. **The series, the type and the stage.** Cheetara and Gibson make six or more series frames, one
   variable each, from the locked hero (Edit Model, Nano Banana or Higgsfield). Snape sets the type layer
   by hand in Figma or Pencil. Gibson stages it (a set in Blender MCP, a device, a mockup). Morpheus
   writes the micro-detail.

7. **Finish, then the motion beat.** Upscale first (Higgsfield or Topaz via RunningHub; on a
   confidential author job no aggregator runs, so use Midjourney's own Upscale or `--hd`), grade and grain (Adobe for creativity), then one 3 to 8
   second beat from the upscaled plate (Wan via Runway, Seedance, Kling, or Midjourney video).

8. **The gate.** Gandalf runs the Fidelity Gate first on an author's world (the Prime Gate on QKI), the
   eight trust checks on author work, then `quality-gate`. **You see the scorecard here.** SHIP means no
   dimension below 4 and no blocker open.

9. **Where the files land.** The project's folder in DZNR OS: `pack.md`, the scorecard, the hero, the
   series, the type layer file, the staging frame and the beat, listed in the run's outputs and the
   Library. An author's work also goes back to Pulse OS (`immersive-world-site/references/pulse-integration.md`).

10. **Judge it yourself in thirty seconds.** Open the contact sheet and ask the gate's questions: can a
    stranger read the thesis off the hero? Is there one signal colour? Is every word set by hand? Any
    sheen, glow, plastic skin? Do the frames read as one catalogue? Any "no" is a REWORK with the named
    fix, not a ship.

## Worked example 1: a DZNR asset

1. You type: "Make a legendary hero for the DZNR OS launch: the field recorder that never shipped."
2. Snape writes `pack.md`. Thesis: "The archive of a future that did not happen." Lock: Instrument-grade
   Product plus Technical Poster; heritage anchor Braun 1968. Palette: bone, graphite, bead-blast
   aluminium, one safety-orange signal (`#FF5A1F`) on the record button. You approve.
3. The hero prompt (from `midjourney-legendary`, Instrument-grade Product):
   `A 1999 portable field recorder that never shipped, the archive of a future that did not happen, archival press photograph, medium format, 80mm, f/8, flat overcast daylight, bone, graphite and bead-blast aluminium with one safety orange record button, matte ABS, knurled aluminium knob, a peeling asset-tag label, scuffed edges, subject in the lower third and the top third empty, printed legend "REC" --ar 4:5 --raw --s 50 --v 8.2 --no glow, bloom, lens flare, logo --p 94b2bfcd-291e-4745-8ac6-a07a7c643e0b`
4. You run it in Draft on alpha, keep three, Rerun (Thinking) the one whose "REC" is soft, pick the hero.
5. Gibson stages it on a grey sweep and in a hand; Snape sets the vertical title and a 6pt spec block;
   Wan via Runway makes the beat: the reel turns two detents and the REC light comes on.
6. Gandalf gates it: concept 5, craft 4, finish 4, originality 4, legibility 5, series 4. SHIP.

## Worked example 2: a Pulse author's scene

1. The author's job arrives from Pulse OS (or you type: "Make a legendary pack for scene 4 of The Salt
   Road"). The lore pass has run; the author has approved pack v2 (photographic, 1962, a fishing town)
   and chose Monumental Calm by seeing its option still.
2. Cheetara writes `pack.md` from the author's pack. Thesis from the author's own sentence: "The tide
   covers the ward twice a day." Palette from the author's world: salt grey, wet slate, net green, one
   signal sampled from the harbour lamp in the approved plate. No `--sref` or `--p` of yours: the pack
   holds none.
3. The scene's passage is quoted on the composition (chapter 4, the ferry crossing). The ferryman's face
   is an open canon question, so he is seen from behind (trust rule T7).
4. Cheetara renders the plate and the beat (the lamp swings once, tide rising) in the pack's medium; the
   job is confidential, so no aggregator runs it.
5. Gandalf runs the Fidelity Gate (medium, canon, the rulings), the trust checks (passage shown, the
   author's choice recorded, plain provenance, a quieter text-led option offered) and `quality-gate`.
6. Only at SHIP does it go back to Pulse OS, where the author sees the plate with their sentence beside
   it, approves the scene, or removes it.

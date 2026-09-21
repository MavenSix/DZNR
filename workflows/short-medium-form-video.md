---
workflow: short-medium-form-video
name: Short and Medium Form Video
status: complete
version: 1.0
lead: gibson
supporting: [morpheus, cheetara, snake-eyes, snape]
chains: []
grounded_in:
  - path: ~/dznr-os/docs/decisions.md (175 — image-to-video, because a style cannot reach a moving picture any other way)
    date: 2026-09-21
  - path: ~/dznr-os/docs/decisions.md (155 — a style has two levers; video weights are unavailable)
    date: 2026-09-17
  - path: ~/dznr-os/docs/decisions.md (158 — colour is a lever, not a property of the weights)
    date: 2026-09-17
  - path: "QKI teaser shot 01 — a-man-kneeling-on-one-b9b7958c.jpg animated via runway:kling3.0_standard, $0.25, 5.04s at 1108x828"
    date: 2026-09-21
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["short video for", "reel for", "teaser for", "spot for", "trailer for", "animate this", "motion for"]
  spoken: ["Hey DZNR, make a teaser for [world]", "Hey DZNR, animate this frame", "Hey DZNR, cut a reel for [project]"]
inputs_required:
  - id: subject
    source: inline
    on_missing: ask
  - id: style
    source: memory
    on_missing: ask
stages:
  - id: s1
    name: Brief, format and runtime
    owner: morpheus
    chain_node: null
    skills: [campaign-plan, pitch]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [audience, runtime, aspect ratio, where it will be seen]
    checkpoint: true
    checkpoint_prompt: "How long, what shape, and where does this play? Shot count and cost follow from those three."
    gate: null
    exit_allowed: false
  - id: s2
    name: Shot list, costed before anything is made
    owner: gibson
    chain_node: null
    skills: [storyboarding, pitch-script]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [a numbered shot list, each with a still prompt and a motion prompt, and a total]
    checkpoint: true
    checkpoint_prompt: "N shots at 5 seconds each. Stills cost about $0.025 each, motion about $0.25 each. That is roughly $X. Go?"
    gate: "spend"
    exit_allowed: false
  - id: s3
    name: Style frames — the only place the style exists
    owner: cheetara
    chain_node: null
    skills: [aesthetic-system]
    models: null
    tools: [dznr-os]
    produces: [one still per shot, in the style, with the palette set per request]
    checkpoint: true
    checkpoint_prompt: "These are the frames. Motion cannot fix a frame that is wrong, so this is the last cheap moment."
    gate: null
    exit_allowed: false
  - id: s4
    name: Choose the frames
    owner: snape
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os]
    produces: [one chosen still per shot, and a set that can retrain the style later]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
  - id: s5
    name: Animate each chosen frame
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os, runway]
    produces: [one clip per shot, carrying the style from its frame]
    checkpoint: false
    checkpoint_prompt: null
    gate: "spend"
    exit_allowed: false
  - id: s6
    name: Voice and sound
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os, elevenlabs]
    produces: [narration or character voice; score is NOT available in DZNR today]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
  - id: s7
    name: Edit
    owner: snake-eyes
    chain_node: null
    skills: []
    models: null
    tools: [ffmpeg]
    produces: [an assembled cut at the briefed runtime and ratio]
    checkpoint: true
    checkpoint_prompt: "Here is the cut. Anything to re-shoot before variants?"
    gate: null
    exit_allowed: false
  - id: s8
    name: Platform variants
    owner: snake-eyes
    chain_node: null
    skills: []
    models: null
    tools: [ffmpeg]
    produces: [the ratios s1 asked for, each reframed rather than letterboxed]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
deliverables:
  - type: video
    dual_with: null
  - type: image
    dual_with: video
cost_envelope_usd: [3, 40]
time_envelope: "Stills are seconds each. Motion is roughly 75 seconds per 5-second shot, serially. A 6-shot teaser is under half an hour of machine time; the shot list and the frame choosing are Kevin's."
exit_criteria:
  - "Every shot began as a still that was LOOKED AT and chosen, not as a text prompt"
  - "The style is visible in the finished clip, checked on a frame pulled from the middle rather than the first"
  - "No shot was served by a driver that cannot take a starting frame"
  - "The cut matches the runtime and ratio agreed at s1, or the difference was agreed"
memory_writes:
  - "video.<project>.shot_count and total cost"
  - "video.<project>.frames (the chosen artifact ids)"
  - "video.<project>.motion_prompts (what actually moved, per shot)"
open_questions: []
---

# Short and Medium Form Video

## Purpose

Make a short film in a style DZNR OS actually holds, from frames it made, without an aggregator.

**Written from the QKI world teaser, 2026-09-21.** Shot 01 is real: a QKI still animated through
`runway:kling3.0_standard` for $0.25, 5.04 seconds at 1108×828, with the teal ground, the amber
linework and the bone rings intact in a frame pulled from the middle of the clip.

## The one fact this whole workflow is built around

**A trained style is image-only, so the frame is the only place the style exists.**

`fal-ai/ltx-video-trainer` is deprecated, so `styles.video_lora` is a declared column with no live
trainer behind it. Text-to-video therefore carries no style at all — there are no weights to load
and no frame to start from. A QKI teaser generated from text prompts would be a perfectly good
video of something that is not QKI.

So the pipeline is **still → choose → animate**, and it is not a workaround. It is the only route,
and it has a second benefit: the expensive step happens last, after a human has looked.

## Stages

### s1. Brief, format and runtime

Owner morpheus. Audience, runtime, ratio, where it plays. **Shot count and cost both follow from
these**, so getting them wrong here is the only mistake that is expensive to undo.

### s2. Shot list, costed before anything is made

Owner gibson. Each shot gets two prompts, and they are different jobs:

    still prompt    what is in the frame — subject, composition, light
    motion prompt   what MOVES — and mostly, what does not

Motion prompts are short and negative-heavy. *"Slow push in, dust and embers drifting, the figure
does not move"* held; asking for a figure to act produced drift in the face, which in a styled
world is the thing you notice.

**Spend gate here**, with the arithmetic on screen: stills about $0.025 each, motion about $0.25
each, so a six-shot teaser is roughly $1.65 plus retries.

### s3. Style frames

Owner cheetara. `dznr-os image --style <style> --palette "..." --variations N` per shot.

**This is the last cheap moment.** Motion cannot fix a frame that is wrong — it will animate the
wrong thing faithfully, for ten times the price. Look at every frame here.

Palette is set per request rather than baked in (decision 158), so one style covers a client's
colours and the world's own.

### s4. Choose the frames

Owner snape. `dznr-os choose <artifact>` on the keeper for each shot.

Not bookkeeping. The chosen set is what `dznr-os train <style> --from-chosen` reads, so choosing
frames for a teaser also assembles the training set that makes the next teaser better. A project
that skips this still ships; it just teaches the style nothing.

### s5. Animate each chosen frame

Owner gibson. `dznr-os video --from <artifact> "<motion prompt>"`.

Routes to `runway`, which posts the frame to `/v1/image_to_video`. **Kling and Luma refuse by
name** — they share the submit path, cannot send a first frame, and would otherwise return a
text-to-video clip reported as an animation of the still. That refusal is the guard this stage
depends on.

Roughly 75 seconds per shot. Serial, and worth running while the shot list is still open.

### s6. Voice and sound

Owner gibson. ElevenLabs for narration or a character voice, via `dznr-os say`.

**Score is not available and this workflow does not pretend otherwise.** `suno` is a stub with no
public API and the RunningHub music lane needs an Enterprise-Shared key Kevin has declined. Bring
music from outside, or cut without it.

### s7. Edit

Owner snake-eyes. ffmpeg, locally. Concatenate, trim to the briefed runtime, lay voice under.

### s8. Platform variants

Owner snake-eyes. Reframe rather than letterbox — a 9:16 crop of a 16:9 QKI frame loses the flat
ground the style is built on, so the crop is a composition decision, not a transform.

## Checkpoints

- **s1**, before a shot list exists: runtime, ratio, audience.
- **s2**, the spend gate: shot count times unit costs, on screen, before anything is made.
- **s3**, the last cheap moment: every frame, looked at.
- **s7**, the cut: before variants multiply any mistake in it.

## What this is not

Not a style-training workflow — `style-sheets` is that, and this one assumes a style already
exists.

Not a long-form workflow. Eight stages and a five-second shot unit stop being the right shape
somewhere around two minutes; `long-form-narrative` is the stub for that and is still a stub.

## Grounding notes

**What the stub asked, and what answered it.**

- *What is the first real video?* The QKI world teaser. Shot 01 exists.
- *Where does the edit happen?* ffmpeg, locally. Adobe via MCP needs a session the daemon cannot
  hold — the same structural blocker as `midjourney-sref` — and a manual NLE step would take the
  workflow out of DZNR at its last stage.
- *Are identity-locked characters required?* Not reachable: `higgsfield` is a stub and carries the
  Soul Character lock. Continuity today comes from the FRAME, which is a stronger lock for a
  single shot and no lock at all across shots. Characters recur by being animated from stills of
  the same character — see `characters/` and decision 161.
- *Which platform variants?* Whatever s1 names. Reframed, not letterboxed.
- *Cost threshold?* The gate is at s2 with the arithmetic shown, not a fixed dollar figure. A
  six-shot teaser lands near $1.65, well under the $5 spoken-task threshold, and a
  thirty-shot piece does not.

**What this cost Kevin to make possible: nothing new.** Runway, Fal and ElevenLabs are accounts he
already has. RunningHub Enterprise is not required at any stage.

## Changelog

- 1.0 (2026-09-21): written from QKI teaser shot 01. Status complete.
- 0.1 (2026-09-04): created as stub with open questions.

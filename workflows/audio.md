---
workflow: audio
name: Audio
status: complete
version: 1.0
lead: gibson
supporting: [morpheus, cheetara, snake-eyes]
chains: []
grounded_in:
  - path: ~/dznr-os/docs/decisions.md (177 — a character pack described a man's clothes and was asked what he sounds like)
    date: 2026-09-21
  - path: ~/dznr-os/docs/decisions.md (161 — a character is a third kind of pack)
    date: 2026-09-17
  - path: "Jericho Emory voice design — 3 previews from `## Voice`, spoken as a Wound Keeper's line"
    date: 2026-09-21
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["voice for", "sound design for", "narration for", "how does [character] sound", "design a voice"]
  spoken: ["Hey DZNR, make a voice for [character]", "Hey DZNR, how does [character] sound"]
inputs_required:
  - id: character
    source: inline
    on_missing: ask
stages:
  - id: s1
    name: Write how they sound
    owner: cheetara
    chain_node: null
    skills: []
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: ["a `## Voice` section in the character pack — pitch, pace, what it does under pressure"]
    checkpoint: true
    checkpoint_prompt: "Here is how I think they sound, in five lines. Is that the voice you hear?"
    gate: null
    exit_allowed: false
  - id: s2
    name: Write the line they will say
    owner: morpheus
    chain_node: null
    skills: [pitch-script]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [one passage this character would actually speak, 100 to 1000 characters]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s3
    name: Design, and listen
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os, elevenlabs]
    produces: [three previews as mp3 files, each with its own generated_voice_id]
    checkpoint: true
    checkpoint_prompt: "Three of them, saying the line. Which one is him?"
    gate: null
    exit_allowed: false
  - id: s4
    name: Keep one
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os, elevenlabs]
    produces: [a permanent voice id on the character row]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
  - id: s5
    name: Speak
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os, elevenlabs]
    produces: [lines in that character's voice, as artifacts]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
deliverables:
  - type: audio
    dual_with: null
  - type: markdown
    dual_with: audio
cost_envelope_usd: [0, 2]
time_envelope: "Writing the voice and the line is Kevin's, and is the whole job. Design returns in under a minute. Listening and choosing is minutes."
exit_criteria:
  - "The character pack has a `## Voice` section that a person wrote, not one derived from their appearance"
  - "The previews spoke a line this character would say, not vendor filler"
  - "A preview was LISTENED TO and chosen; nothing picked on anyone's behalf"
  - "`characters.voice_id` holds a real voice id, not a generated_voice_id"
memory_writes:
  - "character.<name>.voice_id"
  - "character.<name>.voice_notes (what was written at s1)"
open_questions:
  - "Is cloning a REAL person's voice — Kevin's own, a client's founder — in scope, and what consent record must the workflow hold before it runs? Out of scope until answered; nothing here clones anyone."
---

# Audio

## Purpose

Give a character in one of Kevin's worlds a voice, from the pack that already describes them.

**Written from Jericho Emory, 2026-09-21.** Three previews exist, designed from his `## Voice`
section and speaking a line a Wound Keeper would say.

## Scope, stated up front

**This workflow covers character voices.** Kevin named them as what matters first, and they are
what DZNR OS can do end to end today.

**Not covered, and not pretended:**

    score and music     `suno` has no public API, and the RunningHub music lane needs an
                        Enterprise-Shared key Kevin has declined on cost. There is no working
                        path. Bring music from outside.
    voice cloning       of a real person — Kevin's own, a client's founder. Out of scope until
                        the consent question in `open_questions` is answered. Nothing here
                        clones anyone, and that is a decision rather than an omission.
    mixing              ffmpeg lays a voice under a cut in the video workflow. A DAW is outside
                        DZNR and this workflow does not reach into one.

## The thing that went wrong first, because it will go wrong again

**A character pack describes a face, and a voice designer cannot use a face.**

The first real design run sent this:

> A Black man in his late thirties, lean and weathered, in layered tattered work dress over a
> wrapped underlayer

That is a man's clothes. Every one of Jericho's fixed traits is visual — locked hair, a scar
through the left brow, brass and bone rings — because traits exist to keep a FACE consistent
between two pictures. The designer returned three perfectly good voices chosen for reasons
unconnected to the character, and **nothing about the result looked wrong.**

So `## Voice` is its own section and `dznr-os character voice` refuses without it. A voice
designed from appearance is a guess wearing the character's name, and the mismatch only surfaces
when you hear it next to the picture — after the money and after the choosing.

## Stages

### s1. Write how they sound

Owner cheetara. A `## Voice` section in `characters/<name>.md`. What a designer can use, and
nothing a painter would:

- register and pace
- what the voice sits on — rasp, breath, weight
- what it does **under pressure**, which is where a voice becomes a person
- accent, and what has flattened it

Jericho's: *"never raises his voice; when pressed he gets quieter and slower, which is worse."*
That line does more than the other four together, because it describes behaviour rather than
timbre.

**Checkpoint.** Kevin hears the voice in his head already; this stage is checking the words match
what he hears, before anything is made.

### s2. Write the line they will say

Owner morpheus. 100–1000 characters, and it must be something **this character would say.**

The vendor will auto-generate a line if none is given. For Jericho it produced *"Mornin' folks.
Sun's comin' up, another day to make somethin' happen... hope y'all have a blessed one."* A voice
judged on that is judged on the wrong thing — it tests whether the voice can do folksy warmth,
which is the opposite of the character.

### s3. Design, and listen

Owner gibson. `dznr-os character voice <name> --say "<line>"`.

Three previews, each an mp3 in `~/Artifacts/voices/` with its own `generated_voice_id`. They are
alternatives in exactly the sense three takes of a prompt are.

**Nothing picks one, because nothing here can hear.** This is the same rule as `choose` on images
and it is load-bearing in the same way: a function returning "the best voice" would be inventing a
judgement it has no access to.

### s4. Keep one

Owner gibson. `dznr-os character voice <name> --keep <generatedVoiceId>`.

Turns a preview into a permanent voice and records it on the character row. **A
`generated_voice_id` is not a voice id** — the speech endpoint rejects it, so a preview id stored
here would produce a character that cannot speak, failing at the moment of use rather than the
moment of choosing.

### s5. Speak

Owner gibson. `dznr-os say --voice <voiceId> "..."`, and the character carries its own now.

Lines land as artifacts, so they reach the video workflow's s6 the same way stills reach its s5.

## Checkpoints

- **s1**, before anything is made: the written voice, against the one Kevin hears.
- **s3**, after three cheap previews: which one is him.

## What this is not

Not `short-medium-form-video` — that one lays a voice under a cut. This one makes the voice.

Not a cloning workflow. See the open question.

## Grounding notes

**What the stub asked, and what answered it.**

- *Which outputs matter first?* Kevin: character voices for QKI. This workflow is that and says so.
- *Is cloning a real person in scope, and what consent record?* **Unanswered, and it is the one
  open question left.** Out of scope until Kevin decides, because a consent policy is not
  something to infer.
- *Is Suno or Mureka primary for music, direct or through RunningHub?* Moot: there is no working
  music path at all. Stated rather than left to be discovered.
- *Does mixing happen in DZNR?* ffmpeg, in the video workflow, laying voice under a cut. No DAW.
- *Name one real audio deliverable.* Jericho Emory's voice, three previews, 2026-09-21.

**Cost:** ElevenLabs is a subscription Kevin already has. Design and speech draw on it; nothing
here needs a new account.

## Changelog

- 1.0 (2026-09-21): written from Jericho Emory's voice design. Status complete.
- 0.1 (2026-09-04): created as stub with open questions.

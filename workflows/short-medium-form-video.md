---
workflow: short-medium-form-video
name: Short and Medium Form Video
status: stub
version: 0.1
lead: gibson
supporting: [morpheus, cheetara, snake-eyes, snape]
chains: []
grounded_in: []
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["short video for", "reel for", "sizzle for", "product video", "ad spot", "explainer video", "shotlist for", "Seedance"]
  spoken: ["Hey DZNR, make a thirty second spot for [product]", "Hey DZNR, shotlist this script", "Hey DZNR, sizzle reel for [brand]"]
inputs_required: []
stages:
  - id: s1
    name: Brief and format
    owner: morpheus
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s2
    name: Script and shot list
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s3
    name: Style frames
    owner: cheetara
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Generate shots
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s5
    name: Edit and sound
    owner: snake-eyes
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s6
    name: Platform variants
    owner: snake-eyes
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
deliverables: []
cost_envelope_usd: [0, 0]
time_envelope: TBD
exit_criteria: []
memory_writes: []
open_questions:
  - "What is the first real video: a QKI world teaser, a client product spot, a DZNR OS demo, a Pulse trailer? The style-frame and identity-lock stages differ by answer."
  - "Where does the edit happen: Adobe via MCP (Premiere through quick-cut), ffmpeg in the daemon, or a manual step in Kevin's NLE?"
  - "Are identity-locked characters (Higgsfield Soul) required for any video with a recurring character, as in the QKI workflow?"
  - "Which platform variants are default (9:16, 1:1, 16:9) and does `adobe-create-social-variations` own that stage?"
  - "Cost confirmation threshold per video: the Build Plan says $5 for spoken tasks; is a 30-second Seedance 2.5 spot (roughly $1 to $3 at $0.036 per second) inside or outside that?"
---

# Short and Medium Form Video

## Purpose

Stub. This project type is in Kevin's first set but no past project exists to write it from. Tár treats a match on this workflow as a prompt to read the open questions aloud and offer the nearest complete workflow, never as something to execute.

## Stages

### s1. Brief and format

Owner morpheus. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s2. Script and shot list

Owner gibson. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s3. Style frames

Owner cheetara. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s4. Generate shots

Owner gibson. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s5. Edit and sound

Owner snake-eyes. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s6. Platform variants

Owner snake-eyes. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

## Checkpoints

Not yet defined. At minimum, the first stage after inputs are confirmed and the stage before any spend over the voice threshold.

## Deliverables

Not yet defined.

## What this is not

Not executable. Not a substitute for the nearest complete workflow.

## Grounding notes

**Precedent that exists:** `seedance-director` and `seedance-shotlist-director` produce production-ready prompts and an editable HTML shot list (15 seconds per prompt, CUT-separated). `adobe-edit-quick-cut` makes sizzle reels from footage. Higgsfield MCP is active for generation. RunningHub (v2.5.0) is the execution path for Seedance 2.5. No video has shipped end to end through DZNR.

**Why that is insufficient:** none of it is a shipped project of this type with stages, checkpoints, deliverables, and a cost and time envelope that were actually observed. Writing those from theory would produce a workflow that reads plausible and is wrong where it matters.

**To complete this stub:** answer the open questions in the frontmatter (or name one real project and let it be written from that), set `status: complete`, fill `grounded_in`, and bump to 1.0.

## Changelog

- 0.1 (2026-09-04): created as stub with open questions.

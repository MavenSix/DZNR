---
workflow: long-form-narrative
name: Long Form Narrative
status: stub
version: 0.1
lead: cheetara
supporting: [gibson, morpheus, sherlock, gandalf]
chains: [8, 9]
grounded_in: []
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["series bible for", "episode for", "long form story", "serialized narrative", "season arc", "graphic novel"]
  spoken: ["Hey DZNR, outline season one of [world]", "Hey DZNR, write episode [n] of [world]", "Hey DZNR, series bible for [idea]"]
inputs_required: []
stages:
  - id: s1
    name: Premise and series bible
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
  - id: s2
    name: Season arc and episode map
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
  - id: s3
    name: Episode script
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
    name: Visual pass per episode
    owner: cheetara
    chain_node: "Chain 8"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s5
    name: Continuity check
    owner: sherlock
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
    name: Assemble and publish
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
deliverables: []
cost_envelope_usd: [0, 0]
time_envelope: TBD
exit_criteria: []
memory_writes: []
open_questions:
  - "Is the output prose (novel, serialized fiction), script (screen or graphic novel), or an immersive episode (Pulse-style walkthrough)? Each has a different s6."
  - "Does the series bible here become a Pulse World Bible, or are they different documents with different owners?"
  - "Who holds voice: does Kevin write and Cheetara or Morpheus edit, or does DZNR draft and Kevin directs? The author-is-the-director principle from Pulse suggests the latter but it needs saying."
  - "What is the continuity mechanism for text (the visual side has identity locks): a canon register, a fact table, both?"
  - "Which world is first: Friends and Anarchists (the original QKI world referenced by the style authority), one of the test packs, or something new?"
---

# Long Form Narrative

## Purpose

Stub. This project type is in Kevin's first set but no past project exists to write it from. Tár treats a match on this workflow as a prompt to read the open questions aloud and offer the nearest complete workflow, never as something to execute.

## Stages

### s1. Premise and series bible

Owner cheetara. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s2. Season arc and episode map

Owner morpheus. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s3. Episode script

Owner cheetara. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s4. Visual pass per episode

Owner cheetara, Chain 8. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s5. Continuity check

Owner sherlock. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s6. Assemble and publish

Owner gibson. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

## Checkpoints

Not yet defined. At minimum, the first stage after inputs are confirmed and the stage before any spend over the voice threshold.

## Deliverables

Not yet defined.

## What this is not

Not executable. Not a substitute for the nearest complete workflow.

## Grounding notes

**Precedent that exists:** Cheetara's QKI cluster is built for serialized worlds and the identity-lock mechanism exists so 'the same character across every episode reads as the same character.' `immersive-experience-design` covers narrative arc and emotional journey; `presentation-storytelling` covers four arcs. The Pulse OS workflow ingests a finished manuscript. Nothing in DZNR yet authors long-form narrative from scratch, and no episode or season has been produced.

**Why that is insufficient:** none of it is a shipped project of this type with stages, checkpoints, deliverables, and a cost and time envelope that were actually observed. Writing those from theory would produce a workflow that reads plausible and is wrong where it matters.

**To complete this stub:** answer the open questions in the frontmatter (or name one real project and let it be written from that), set `status: complete`, fill `grounded_in`, and bump to 1.0.

## Changelog

- 0.1 (2026-09-04): created as stub with open questions.

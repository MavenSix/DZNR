---
workflow: native-app
name: Native App
status: stub
version: 0.1
lead: neo
supporting: [gibson, snape, sherlock, gandalf]
chains: [3, 4]
grounded_in: []
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["native app for", "iOS app for", "Android app for", "mobile app for", "SwiftUI app", "React Native app"]
  spoken: ["Hey DZNR, build a native app for [idea]", "Hey DZNR, prototype an iOS app for [brand]"]
inputs_required: []
stages:
  - id: s0
    name: Prototype prerequisites
    owner: gibson
    chain_node: "Chain 3 NODE 0"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s1
    name: Concept and platform choice
    owner: gibson
    chain_node: "Chain 3 NODE 1"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s2
    name: Design in Figma
    owner: snape
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
    name: Build
    owner: neo
    chain_node: "Chain 4 NODE 5"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Device QA
    owner: neo
    chain_node: "Chain 4 NODE 7"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s5
    name: Store submission
    owner: neo
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
  - "Which platform path is primary: SwiftUI native, React Native, or Expo? The v1.12.3 test used React Native; is that the default?"
  - "Does Chain 4 need a mobile branch (Expo EAS, TestFlight, Play Console) alongside Sitecore, Salesforce, AEM, other?"
  - "What is the device QA matrix Kevin considers minimum before a client sees a build?"
  - "Is store submission in scope for DZNR, or does the workflow end at a TestFlight or internal-track build?"
  - "Which past or upcoming app should this be written from? Name it and the stub becomes a complete workflow."
---

# Native App

## Purpose

Stub. This project type is in Kevin's first set but no past project exists to write it from. Tár treats a match on this workflow as a prompt to read the open questions aloud and offer the nearest complete workflow, never as something to execute.

## Stages

### s0. Prototype prerequisites

Owner gibson, Chain 3 NODE 0. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s1. Concept and platform choice

Owner gibson, Chain 3 NODE 1. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s2. Design in Figma

Owner snape. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s3. Build

Owner neo, Chain 4 NODE 5. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s4. Device QA

Owner neo, Chain 4 NODE 7. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s5. Store submission

Owner neo. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

## Checkpoints

Not yet defined. At minimum, the first stage after inputs are confirmed and the stage before any spend over the voice threshold.

## Deliverables

Not yet defined.

## What this is not

Not executable. Not a substitute for the nearest complete workflow.

## Grounding notes

**Precedent that exists:** DZNR's v1.12.3 live test produced a working React Native chat prototype on the iOS simulator (2026-05-27), and the `figma-swiftui` skill exists. Neither is a shipped app with a persona, journey, store submission, or analytics. Chain 4 has no mobile platform branch.

**Why that is insufficient:** none of it is a shipped project of this type with stages, checkpoints, deliverables, and a cost and time envelope that were actually observed. Writing those from theory would produce a workflow that reads plausible and is wrong where it matters.

**To complete this stub:** answer the open questions in the frontmatter (or name one real project and let it be written from that), set `status: complete`, fill `grounded_in`, and bump to 1.0.

## Changelog

- 0.1 (2026-09-04): created as stub with open questions.

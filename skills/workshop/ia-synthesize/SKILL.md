---
name: ia-synthesize
description: Stage 4 of the Innovation Accelerator — same-day post-sign-off synthesis. AI-led with human validation. Produces requirements + specs, Linear backlog, investment estimate. Use this skill when the user says "synthesize the workshop", "Linear backlog from IA", "workshop synthesis", "estimation from sign-off", or invokes Stage 4 standalone.
owner: Gandalf
operating_mode: orchestrator (calls Neo for Linear + estimation; Morpheus for client-facing deliverables)
parent_skill: innovation-accelerator
stage: 4 of 5
duration: same day after Day 2 sign-off · ~2-4 hours auto + 1 hour ISHIR review
---

# Stage 04 — Synthesize

## Goal
Within hours of sign-off, produce the engineering-ready package: extracted requirements, Linear backlog, investment estimate. Human validates before client delivery.

## Trigger
Auto-triggered by successful sign-off in Stage 3 Activity 8. Can also be invoked standalone if Stage 3 outputs exist.

## Inverse orchestration

Gandalf calls Neo for:
- Linear board population (1 ticket per Must Have feature with ACs)
- Story-point estimation per ticket
- Dependency mapping into Linear hierarchy
- Sprint 1 candidate list

Gandalf calls Morpheus for:
- Client-facing deliverable packaging (PDF Spec Matrix, executive summary)
- 48-hour delivery email
- Friday review meeting prep

## Embedded AI Agents

- **Agent 13:** Requirements Extraction — turns Spec Matrix + journey + architecture into structured requirements
- **Agent 14:** Linear Backlog Population — creates tickets with hierarchies, labels, story points
- **Agent 15:** Investment Estimation — sprint-by-sprint cost projection based on team rate cards

## Outputs

**Output 1: Requirements + Specs**
- Engineering-ready requirements doc
- Per-feature: acceptance criteria, technical notes, dependencies, story points
- Architecture brief finalized
- Format: structured Markdown + JSON

**Output 2: Linear Backlog**
- Linear board populated with Sprint 1 + Backlog
- Hierarchy: Project → Epic → Story → Sub-task
- Labels: persona-served, golden-path, must-have-tier
- Format: live Linear URL

**Output 3: Investment Estimate**
- Sprint-by-sprint cost
- Total project investment range
- Risk-adjusted ranges (best/expected/worst)
- Format: structured doc

## Human validation gate

Before client delivery, ISHIR team reviews:
- Requirements accuracy (matches sign-off scope?)
- Linear hygiene (tickets readable, ACs complete?)
- Estimation realism (matches team velocity?)

If validation fails: loop back with Neo for fixes.

## Delivery to client

Within 48 hours of sign-off, package delivered:
- Spec Matrix PDF
- Linear board URL
- Architecture Brief PDF
- Investment Estimate
- 30-min Friday review scheduled

Morpheus handles the delivery email and meeting prep.

## See also
- `innovation-accelerator` (parent)
- `ia-define-day2` (previous stage — produces inputs)
- `ia-build-handoff` (next stage — Day 3 sprint kickoff)

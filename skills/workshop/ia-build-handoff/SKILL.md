---
name: ia-build-handoff
description: Stage 5 of the Innovation Accelerator — Day 3 build handoff. Gandalf hands off completely to Neo. Sprint 1 begins. Use this skill when the user says "trigger the build pipeline", "kick off Sprint 1 from IA", "Day 3 begin", "build handoff", or invokes Stage 5 standalone.
owner: Gandalf hands off to Neo at this stage
operating_mode: orchestrator → handoff
parent_skill: innovation-accelerator
stage: 5 of 5
duration: Day 3 onward · ongoing sprint cycles
---

# Stage 05 — Build Handoff

## Goal
Day 3: pipeline activates. Every artifact from Stages 01-04 feeds directly into ISHIR's AI-powered software development process. Sprint 1 begins immediately.

## The handoff

This is the moment Gandalf releases the chain. Stage 5 is **Neo's territory** — Gandalf has produced the spec, the backlog, the estimate. Neo takes it from here.

Gandalf's final actions:
1. Verify all Stage 4 artifacts are ready
2. Confirm Linear board is populated and assigned
3. Brief Neo on the engagement specifics
4. Hand off to Neo's Chain 4 (Delivery flow)

## Neo's pickup

Neo enters Chain 4 (Delivery flow) with the IA-produced inputs:
- NODE 1: Determine platform — Sitecore / Salesforce / AEM / custom (already specified in Architecture Brief)
- NODE 2: Generate spec from Linear + Architecture Brief inputs
- NODE 3: User stories already in Linear from Stage 4
- NODE 4: Layer 1 validation
- NODE 5: Generate component code (with mandatory Gandalf calls for harden, polish, fixing-accessibility)
- NODE 6+: Standard delivery flow continues

## Morpheus picks up communication

Morpheus owns ongoing stakeholder communication:
- Sprint demo packaging (weekly)
- Status reports to client
- Friday review meeting recurring
- Amendment requests routed through formal change protocol

## Outputs

This stage's "outputs" are ongoing:
- Working software (Sprint 1+ deliverables)
- Sprint demos (weekly)
- Live product (eventually)
- Status reports (weekly)
- Amendments handled (as needed)

## Exit from IA chain

Once Sprint 1 is active, the IA chain is **complete**. Future work on this client engagement runs through standard DZNR chains:
- Sherlock for additional research as scope evolves
- Snape for design system additions
- Gibson for any immersive/AI product extensions
- Neo for ongoing delivery
- Morpheus for ongoing client comms

If the client requests a NEW IA engagement (e.g. for a different product or initiative), that's a fresh invocation of `innovation-accelerator` master skill.

## See also
- `innovation-accelerator` (parent — engagement complete after this stage)
- `ia-synthesize` (previous stage — produced the inputs Neo uses)
- Neo's Chain 4 (Delivery flow) — picks up from here
- `routing/CHAINS.md` Chain 4 for Neo's delivery pipeline

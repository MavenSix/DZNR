---
name: ia-prepare
description: Stage 1 of the Innovation Accelerator — pre-workshop preparation. Run 2-3 days before Day 1. AI-led with human review. Produces Intelligence Brief, tailored agenda, risk & alignment flags. Use this skill when the user says "prepare for the IA", "Day 1 prep", "intelligence brief", "tailored agenda", or invokes Stage 1 standalone.
owner: Gandalf
operating_mode: orchestrator (calls Sherlock + Snape)
parent_skill: innovation-accelerator
stage: 1 of 5
duration: 2-3 days before workshop, ~2-4 hours of agent + human time
---

# Stage 01 — Prepare

## Goal
Arm the team with everything needed to facilitate Day 1 with precision. AI ingests the brief, researches the client's domain, evaluates their existing web/app property, and produces three artifacts.

## Inputs required
- Client name + industry
- Client web property or app URL(s) (or "no existing property")
- Initial brief or kickoff notes
- Stakeholder list (names + roles)
- Workshop date (Day 1)

## Inverse orchestration in this stage

Gandalf calls:
- **Sherlock** for:
  - `discover-brand` on the client's web property
  - `site-audit` for UX baseline
  - `competitive-brief-pm` for product landscape
  - `synthetic-audience` for early persona drafts
- **Snape** for:
  - `discover-brand` interpretation of extracted assets
  - `design-language` synthesis from existing brand
  - `aesthetic-system` read of current visual treatment

Then Gandalf synthesizes outputs into the three Stage 1 deliverables.

## Outputs

**Output 1: Intelligence Brief**
- Client context: industry, business model, key pressures
- Domain research: market position, competitors, recent moves
- Stakeholder profiles: roles, interests, likely tensions
- Brand baseline: extracted from existing property
- Open questions for the room
- Format: structured Markdown doc + executive summary

**Output 2: Tailored Agenda**
- Day 1 and Day 2 timing with activity-by-activity breakdown
- Client-specific framing of generic activities (e.g. "Lightning Talks" becomes "Lightning Talks: [their specific problem space]")
- Pre-circulated to participants 24h before Day 1
- Format: PDF + shareable HTML

**Output 3: Risk & Alignment Flags**
- Known stakeholder tensions surfaced by Sherlock's research
- Domain risks flagged
- Alignment gaps between stated brief and observed brand reality
- Mitigation suggestions for facilitator
- Format: facilitator-internal checklist

## Embedded AI Agents (from facilitator guide)

This stage embeds the protocols for these named agents:
- **Agent 01: Intelligence Brief generator** — synthesizes Sherlock + Snape outputs into Intelligence Brief
- **Agent 02: Agenda tailoring** — uses Intelligence Brief to client-specific the agenda

These are prompt protocols, not standalone skills (per Evolution Protocol decision to embed agents in v1).

## Facilitator review checkpoint

Before workshop, Engagement Lead reviews:
- Intelligence Brief — anything missed?
- Agenda — any pacing concerns?
- Risk flags — any to defuse before Day 1?

Output flagged for human review with explicit review prompts.

## Failure modes

- **No client property found:** flag for "blank-slate" branch — methodology continues with brand-from-scratch in Day 1
- **Conflicting Sherlock + Snape findings:** Gandalf escalates via Snape clarifier voice
- **Stakeholder list incomplete:** request before proceeding (workshop needs participant clarity)

## See also
- `innovation-accelerator` (parent)
- `references/IA_Facilitator_Run_of_Show_Guide.html` for facilitator-side context

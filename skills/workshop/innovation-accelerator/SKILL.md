---
name: innovation-accelerator
description: Master skill for Kevin's Innovation Accelerator methodology — a 5-stage end-to-end client engagement framework that takes a fuzzy idea to build-ready specification in 2 days plus pre-work. Use this skill when the user asks to "run the Innovation Accelerator", "IA workshop", "innovation workshop for [client]", "2-day accelerator", or any explicit invocation of the IA methodology. This skill orchestrates 5 stage sub-skills (ia-prepare, ia-discover-day1, ia-define-day2, ia-synthesize, ia-build-handoff) and calls other DZNR subagents (Sherlock, Snape, Morpheus, Neo) as tools. This is a Gandalf-owned skill operating in inverse orchestration mode — Gandalf leads, other subagents participate.
owner: Gandalf
operating_mode: orchestrator
chain: Chain 6 (Innovation Accelerator)
references:
  - ./references/Innovation_Accelerator_HighLevel_Flow.html
  - ./references/IA_Facilitator_Run_of_Show_Guide.html
---

# Innovation Accelerator (master skill)

## What this is

Kevin's signature client engagement methodology. **From fuzzy idea to development-ready specification in 2 days plus pre-work.** Used at ISHIR. Battle-tested. 15 AI agents deployed across 5 stages. 10+ deliverables. ~75% faster than traditional discovery-to-spec processes.

This is the master skill. It orchestrates the 5 stage skills and coordinates other DZNR subagents.

## When to use this skill

Gandalf invokes this skill when:
- User says "run the Innovation Accelerator", "IA workshop", "innovation workshop for [client]"
- User says "2-day accelerator", "the IA" (in context of a client engagement)
- User asks for the full methodology as a bundle
- User has a client engagement that needs the full 5-stage flow

**Do NOT use this skill if:**
- User wants a generic workshop (route to Sherlock's `hcd-ai-design` instead)
- User wants only one stage (invoke the relevant `ia-*` sub-skill directly)
- User wants design sprint methodology (Google Ventures style, different framework)

## The 5 stages

| Stage | Skill | When | Mode | Outputs |
|-------|-------|------|------|---------|
| 01 Prepare | `ia-prepare` | 2-3 days before | AI-led, Human review | Intelligence Brief, tailored agenda, risk & alignment flags |
| 02 Discover | `ia-discover-day1` | Day 1, 4 hours | Human + AI | Product vision, validated personas, problem statement |
| 03 Define | `ia-define-day2` | Day 2, 4 hours | Human + AI, Sign-off gate | MoSCoW Spec Matrix, journey map + golden path, architecture brief |
| 04 Synthesize | `ia-synthesize` | Same day after sign-off | AI-led, Human validate | Requirements + specs, Linear backlog, investment estimate |
| 05 Build | `ia-build-handoff` | Day 3 onward | Human + AI | Sprint 1 active, working software, demos |

See `references/Innovation_Accelerator_HighLevel_Flow.html` for the visual flow.
See `references/IA_Facilitator_Run_of_Show_Guide.html` for full operational detail (1193 lines, all activities, scripts, watch-fors, recovery moves).

## Inverse orchestration pattern (IMPORTANT)

When this skill runs, **Gandalf orchestrates other DZNR subagents** instead of being called by them. This is a documented exception to the usual Gandalf pattern.

Gandalf calls:
- **Sherlock** in Stage 1 for client discovery + research synthesis. In Stage 2 for HMW affinity mapping support. In Stage 3 for journey mapping support.
- **Snape** in Stage 1 for brand & style breakdown of client's existing web property or app. In Day 1 / Day 2 for design fidelity guidance.
- **Morpheus** in every stage for facilitator deliverables: scripts, watch-for recovery moves, presenter notes, post-workshop reports, stakeholder updates, and the final pitch-ready summary.
- **Neo** in Stage 4 for Linear backlog population, story-point estimation, dependency mapping. In Stage 5 for repo scaffold, sprint setup, and the prototype build pipeline.

**Tár's role:** Tár routes the initial request to Gandalf when IA triggers fire. Tár does NOT orchestrate inside Chain 6 — Gandalf does.

## Bundle plan template

When a user invokes this skill with a full IA request, Gandalf produces this bundle plan before executing:

```
Innovation Accelerator detected for [client name] in [industry].

Workshop dates: [Day 1 date] and [Day 2 date]
Pre-work window: [2-3 days before Day 1]

PHASE 1 — Stage 01 Prepare (2-3 days before)
  Lead: Gandalf · Participants: Sherlock + Snape
  ├─ Sherlock: discover-brand on [client property], site-audit, competitive-brief
  ├─ Snape: brand & style breakdown from extracted inputs
  └─ Gandalf (ia-prepare): synthesize into Intelligence Brief, tailored agenda, risk flags
  Output: Intelligence Brief, agenda, risk flags

PHASE 2 — Stage 02 Discover (Day 1, 4 hours)
  Lead: Gandalf · Participants: Morpheus (deliverables)
  ├─ Activity 1: Lightning Talks (25 min) — Agent 03 transcription
  ├─ Activity 2: Product Vision Workshop (50 min) — Agent 04 vision clustering
  ├─ Activity 3: Persona Co-Creation (60 min) — Agent 05 persona generation
  ├─ Activity 4: HMW + Voting (60 min) — Agents 06+07 HMW affinity + voting
  └─ Day 1 Wrap (20 min) — Agent 08 end-of-day synthesis
  Output: Product vision, personas, problem statement, Day 1 synthesis report

PHASE 3 — Stage 03 Define (Day 2, 4 hours, sign-off gate)
  Lead: Gandalf · Participants: Snape (design fidelity), Sherlock (journey support), Morpheus (deliverables)
  ├─ Activity 5: MoSCoW + Live Spec Matrix (75 min) — Agent 09 ⭐
  ├─ Activity 6: User Journey + Gap Analysis (50 min) — Agent 10
  ├─ Activity 7: Tech Solutioning + Architecture Brief (50 min) — Agent 11
  └─ Activity 8: Stakeholder Alignment & Sign-Off (35 min) — Agent 12 ⭐ CRITICAL
  Output: Signed MoSCoW Spec Matrix, journey + golden path, architecture brief, sign-off record

PHASE 4 — Stage 04 Synthesize (same day after sign-off)
  Lead: Gandalf · Participants: Neo (Linear + estimation)
  ├─ Agent 13: requirements extraction
  ├─ Agent 14: Linear backlog population
  └─ Agent 15: investment estimation
  Output: Requirements + specs, Linear backlog, investment estimate

PHASE 5 — Stage 05 Build (Day 3 onward)
  Lead: Neo (Gandalf hands off completely)
  ├─ Neo: repo-scaffold + sprint kickoff
  ├─ Neo: prototype build (uses xcm-* skills, web-artifacts-builder, etc.)
  └─ Morpheus: weekly demo cadence + stakeholder updates
  Output: Working software, sprint demos, live product

Total artifacts produced: 10+
Workshop duration: 2 days (8 hours total)
Pre-work: 2-3 days
End-to-end: ~Day 3 sprint start
```

Gandalf presents this plan to the user, gets confirmation, then executes.

## Customization handles

The methodology has these knobs the user can adjust before kickoff:

- **Client name** (required) — replaces [client] tokens in templates
- **Industry context** (required) — shapes Sherlock's pre-work research
- **Existing brand inputs** — URL, Figma, brand guide PDF
- **Participant count** — defaults to 5-8, methodology assumes this
- **Workshop format** — in-person, remote, hybrid (changes some activity logistics)
- **Workshop duration** — defaults to 2 days × 4 hours, can be compressed to 1 day or stretched to 3
- **Stage skips** — user can skip stages: "skip prepare, we have the inputs already" or "skip synthesis, we'll do it manually"
- **Build handoff target** — Sitecore / Salesforce / AEM / custom / no-build (defaults to no-build)

## Failure modes specific to IA

**Capability gap — client property has no extractable brand:**
- Snape returns "no brand inputs found"
- Gandalf escalates via Snape's clarifier voice: "Stage 1 brand eval failed — client has no extractable inputs. Options: ask user for assets, proceed with blank-slate brand-from-scratch in Stage 1, or skip brand eval."

**Capability gap — sign-off doesn't happen:**
- Stage 3 Activity 8 sign-off gate fails
- Gandalf pauses chain. Snape's clarifier voice: "Sign-off was not captured. Specify recovery: reschedule sign-off, run async follow-up, or escalate."

**Workshop interrupted mid-stage:**
- Compound request collapse pattern (per FAILURE_MODES.md Category 5)
- Gandalf produces partial delivery of completed activities + diagnostic of where it stopped

**Stakeholder requests scope change post-sign-off:**
- Documented amendment via Agent 12 protocol
- Gandalf invokes Morpheus to draft amendment doc + new sign-off request

See routing/FAILURE_MODES.md for the full failure-mode playbook this skill inherits.

## What this skill is NOT

- Not a replacement for `hcd-ai-design` — that's the generic framework, this is Kevin's specific implementation
- Not a one-shot artifact generator — this is a multi-day orchestrated engagement
- Not invocable without explicit IA language — generic "workshop" requests still route to Sherlock's hcd-ai-design

## See also

- `ia-prepare` — Stage 1 standalone invocation
- `ia-discover-day1` — Stage 2 standalone invocation
- `ia-define-day2` — Stage 3 standalone invocation
- `ia-synthesize` — Stage 4 standalone invocation
- `ia-build-handoff` — Stage 5 standalone invocation
- `references/IA_Facilitator_Run_of_Show_Guide.html` — full operational detail for Day 1 + Day 2
- `references/Innovation_Accelerator_HighLevel_Flow.html` — 5-stage visual overview
- `routing/CHAINS.md` Chain 6 — the routing logic
- `governance/proposals/2026-05-18-innovation-accelerator.md` — the proposal that approved this skill pack

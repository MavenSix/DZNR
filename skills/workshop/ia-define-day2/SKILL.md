---
name: ia-define-day2
description: Stage 3 of the Innovation Accelerator — Day 2 facilitation with sign-off gate. 4 hours, 4 activities. Human + AI mode. Produces MoSCoW Spec Matrix, journey map with golden path, architecture brief, formal signed-off scope. Use this skill when the user says "Day 2 facilitation", "MoSCoW workshop", "sign-off workshop", "Spec Matrix", or invokes Stage 3 standalone.
owner: Gandalf
operating_mode: orchestrator (calls Snape for design fidelity; Sherlock for journey support; Morpheus for sign-off deliverables)
parent_skill: innovation-accelerator
stage: 3 of 5
duration: 4 hours · 4 activities · sign-off gate · 4 AI agents active (Agents 09-12)
---

# Stage 03 — Define (Day 2)

## Goal
Converge on the solution. By Day 2 close: signed-off MoSCoW Spec Matrix, journey + golden path, architecture brief, and formal stakeholder approval.

## Day 2 Run of Show

**0:00 – 0:05 · WELCOME BACK & RECAP (5 min) · 👤 Human**
- Engagement Lead opens, Design Strategist recaps Day 1
- Confirm any overnight adjustments from synthesis report

**0:05 – 1:20 · ACTIVITY 5 ⭐ MoSCoW + Live Spec Matrix (75 min) · 🤝 Human + AI**
- Goal: Convert Day 1 hypotheses into prioritized, sized, dependency-mapped Spec Matrix
- Agent 09 ⭐ (MoSCoW Spec Matrix — most critical) — active throughout, updates live
- Walk every feature row-by-row: M/S/C/W decision, story points, dependencies
- Capacity check: total Musts vs sprint capacity
- Output: Complete MoSCoW Spec Matrix (machine-readable JSON), story points, ACs for Musts, dependency map

**1:20 – 1:30 · COFFEE BREAK (10 min)**

**1:30 – 2:20 · ACTIVITY 6: User Journey + Gap Analysis (50 min) · 🤝 Human + AI**
- Goal: Map primary persona's end-to-end journey. Identify gaps where Musts don't cover key steps.
- Agent 10 (Journey & Gap Analysis) drafts scaffold pre-activity, runs gap analysis after fill-in
- Identify Golden Path (3-5 steps representing core value) — must be supported by Musts
- Output: Validated journey map with golden path, gap analysis report, updated Spec Matrix if needed

**2:20 – 2:25 · STAND-UP BREAK (5 min)**

**2:25 – 3:15 · ACTIVITY 7: Tech Solutioning + Architecture Brief (50 min) · 🤝 Human + AI**
- Goal: Solutions Architect leads tech stack and build-vs-buy decisions
- Agent 11 (Architecture Brief) drafts live, uses web search for vendor recommendations
- Frontend / Backend / DB / Auth / Hosting — 2 options + SA recommendation for each
- Build vs. Buy: per Must Have feature area
- Top 3 technical risks identified
- Output: Draft Architecture Brief — tech stack, build vs buy, NFR list, top 3 risks

**3:15 – 3:20 · STRETCH BREAK (5 min)**

**3:20 – 3:55 · ACTIVITY 8 ⭐ CRITICAL — Stakeholder Alignment & Sign-Off (35 min) · ✅ Sign-Off Gate**
- Goal: Explicit, recorded stakeholder approval on Spec Matrix, journey, architecture
- Engagement Lead leads. Agent 12 (Sign-Off & Amendment) tracks amendments live.
- Each stakeholder explicitly says yes by name
- Captured: signed-off Spec Matrix + Approval Record
- Pipeline triggers: Agents 13, 14, 15 run automatically (Stage 4)

**3:55 – 4:00 · WRAP-UP & NEXT STEPS (5 min) · 👤 Human**
- Engagement Lead closes
- Confirms 48-hour deliverable window, Sprint 1 Day 3 start, Friday review

## Sign-off gate criteria

The sign-off gate in Activity 8 is the most critical moment. Pass criteria:
- Every named stakeholder verbally confirms "yes"
- Amendments captured with who-requested + who-approved
- No hedged yeses (Watch-for: "That sounds like a no. Tell me what needs to change for it to be a yes.")
- Absent stakeholders: silent approval assumed unless objection within 3 business days

If sign-off fails: Gandalf invokes failure mode protocol (see innovation-accelerator failure modes section).

## Facilitator scripts embedded

All 4 activities have explicit Opening scripts, Watch-For scenarios with Recovery Moves, and Output specifications. Pulled directly from `references/IA_Facilitator_Run_of_Show_Guide.html` lines 817-1076.

## Embedded AI Agents

- **Agent 09 ⭐:** MoSCoW Spec Matrix — most critical agent in the entire methodology
- **Agent 10:** Journey & Gap Analysis
- **Agent 11:** Architecture Brief (with web search for vendors)
- **Agent 12:** Sign-Off & Amendment Tracking

## Outputs by Day 2 close

- Complete MoSCoW Spec Matrix (signed)
- User journey + golden path
- Architecture brief (SA-approved)
- Formal sign-off record + approval audit trail
- Amendment log (if any)
- Pipeline trigger to Stage 4

## See also
- `innovation-accelerator` (parent)
- `ia-discover-day1` (previous stage)
- `ia-synthesize` (next stage — auto-triggered by sign-off)
- `references/IA_Facilitator_Run_of_Show_Guide.html`

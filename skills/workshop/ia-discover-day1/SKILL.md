---
name: ia-discover-day1
description: Stage 2 of the Innovation Accelerator — Day 1 facilitation. 4 hours, 4 activities. Human + AI mode. Produces product vision, validated personas, problem statement. Use this skill when the user says "Day 1 facilitation", "run Day 1", "Lightning Talks setup", "vision workshop", or invokes Stage 2 standalone.
owner: Gandalf
operating_mode: orchestrator (calls Morpheus for deliverables; Snape for design fidelity if needed)
parent_skill: innovation-accelerator
stage: 2 of 5
duration: 4 hours · 4 activities · 5-8 participants · 3 AI agents active (Agents 03-08)
---

# Stage 02 — Discover (Day 1)

## Goal
Explore the problem broadly. By Day 1 close: product vision, validated personas, and a sharp problem statement.

## Day 1 Run of Show

**0:00 – 0:05 · WELCOME (5 min) · 👤 Human**
- Engagement Lead opens
- Ground rules, intros, hand off to Design Strategist

**0:05 – 0:30 · ACTIVITY 1: Lightning Talks (25 min) · 🤝 Human + AI**
- Goal: Surface the problem from each stakeholder's perspective
- Format: 5 SMEs × 3 min talks. 30 sec clarifying questions only after each.
- Agent 03 (Live Transcription & Insight) activates and runs all of Day 1
- Output: Lightning Talk Insight Log

**0:30 – 0:35 · STAND-UP BREAK (5 min)**

**0:35 – 1:25 · ACTIVITY 2: Product Vision Workshop (50 min) · 🤝 Human + AI**
- Goal: Build shared product vision using Geoffrey Moore's 7 prompts
- 7 prompts: FOR · WHAT · IS A TOOL FOR · SO THAT · UNLIKE · OUR PRODUCT WILL · BUT IT DOESN'T
- Agent 04 (Vision Clustering) generates 3 candidate vision statements
- Output: Validated Product Vision Statement, Won't Have seed list, consensus heat map

**1:25 – 1:35 · COFFEE BREAK (10 min)**

**1:35 – 2:35 · ACTIVITY 3: Persona Co-Creation (60 min) · 🤝 Human + AI**
- Goal: Validate AI-generated draft personas. Land 2-3 personas.
- Agent 05 (Persona Generation) produced drafts pre-workshop, updates live
- Anti-persona: who is NOT our user?
- Output: 2-3 validated personas with goals/frustrations/context, anti-persona named, structured JSON

**2:35 – 2:40 · STRETCH BREAK (5 min)**

**2:40 – 3:40 · ACTIVITY 4: HMW + Voting (60 min) · 🤝 Human + AI**
- Goal: Generate HMW questions, cluster, vote on priorities
- Agents 06 + 07 (HMW Affinity + Voting)
- 5 dot stickers per person for voting
- Co-author Problem Statement: "[Persona] needs [need] because [insight], but currently [obstacle]"
- Output: Top 3 priority clusters, agreed Problem Statement, persona-to-priority mapping

**3:40 – 4:00 · WRAP-UP & DAY 2 PREVIEW (20 min) · 👤 Human**
- Design Strategist closes
- Agent 08 (End-of-Day Synthesis) auto-runs overnight

## Facilitator scripts embedded

Each activity has explicit Opening script, Watch-For scenarios with Recovery Moves, and Output specification. Pulled directly from `references/IA_Facilitator_Run_of_Show_Guide.html` lines 540-810.

## Embedded AI Agents

- **Agent 03:** Live Transcription & Insight (Otter.ai feed, real-time insight extraction)
- **Agent 04:** Vision Clustering (sticky → 3 candidate vision statements)
- **Agent 05:** Persona Generation (pre-workshop drafts + live updates)
- **Agent 06:** HMW Affinity Mapping (sticky board → themed clusters)
- **Agent 07:** Voting Tallies (dot count → ranked priorities)
- **Agent 08:** End-of-Day Synthesis (full Day 1 transcript → overnight report)

Each agent is a prompt protocol embedded in this skill. Activation triggers are documented per the Run of Show guide.

## Outputs

By Day 1 close:
- Product Vision Statement (validated)
- 2-3 personas (goals, frustrations, context, anti-persona)
- Problem Statement (1-line, persona-grounded)
- Top 3 priority clusters
- Won't Have seed list (for Day 2 MoSCoW)
- Day 1 Synthesis Report (Agent 08, sent overnight to Engagement Lead)

## Facilitator support

Morpheus is called for:
- Daily wrap-up report packaging
- Stakeholder check-in template
- Optional public-facing summary

## See also
- `innovation-accelerator` (parent)
- `ia-define-day2` (next stage)
- `references/IA_Facilitator_Run_of_Show_Guide.html` (1193 lines, full operational detail)

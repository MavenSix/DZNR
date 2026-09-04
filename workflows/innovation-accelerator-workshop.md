---
workflow: innovation-accelerator-workshop
name: Innovation Accelerator Workshop
status: complete
version: 1.0
lead: gandalf
supporting: [sherlock, snape, morpheus, neo, tar]
chains: [6, 4]
grounded_in:
  - path: ~/DZNR/routing/CHAINS.md (Chain 6)
    date: 2026-05-19
  - path: ~/DZNR/skills/workshop/innovation-accelerator/SKILL.md
    date: 2026-05-19
  - path: ~/DZNR/skills/workshop/innovation-accelerator/IA_Facilitator_Run_of_Show_Guide.html
    date: 2026-05-19
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["innovation accelerator", "IA workshop", "IA for [client]", "run the accelerator", "2-day accelerator", "MoSCoW workshop", "spec matrix", "sign-off workshop", "ia-prepare", "ia-discover-day1", "ia-define-day2", "ia-synthesize", "ia-build-handoff"]
  spoken: ["Hey DZNR, run the Innovation Accelerator for [client]", "Hey DZNR, fire the accelerator", "Hey DZNR, prep the IA for [client] next week"]
inputs_required:
  - id: client_name
    source: inline
    on_missing: ask
  - id: industry_context
    source: inline
    on_missing: ask
  - id: brand_inputs
    source: inline
    on_missing: route:sherlock:discover-brand
  - id: participant_count_and_format
    source: inline
    on_missing: ask
stages:
  - id: s1
    name: Bundle plan
    owner: gandalf
    chain_node: "Chain 6 NODE 1"
    skills: [innovation-accelerator]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [five-phase plan with lead, participants, timings, agent numbers, customization handles applied]
    checkpoint: true
    checkpoint_prompt: "Plan is set: two days, four hours each, [n] participants, [format], build target [x]. Confirm and I execute."
    gate: null
    exit_allowed: false
  - id: s2
    name: Stage 1 Prepare
    owner: gandalf
    chain_node: "Chain 6 NODE 2"
    skills: [ia-prepare, discover-brand, site-audit, competitive-brief, synthetic-audience, design-language, aesthetic-system]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [claude-in-chrome, notion-mcp, google-drive-mcp, granola-mcp]
    produces: [Intelligence Brief, tailored agenda, risk and alignment flags]
    checkpoint: true
    checkpoint_prompt: "Intelligence Brief and agenda are ready for Engagement Lead review. Approve, or adjust?"
    gate: "Engagement Lead review: loop with adjustments until approved"
    exit_allowed: false
  - id: s3
    name: Stage 2 Discover (Day 1)
    owner: gandalf
    chain_node: "Chain 6 NODE 3"
    skills: [ia-discover-day1, hcd-ai-design, synthetic-audience]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [figjam-mcp, slack-mcp]
    produces: [product vision, validated personas, problem statement, top three priorities, Day 1 synthesis report, overnight check-in]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Stage 3 Define (Day 2)
    owner: gandalf
    chain_node: "Chain 6 NODE 4"
    skills: [ia-define-day2, journey-mapping, design-language, engineering:architecture]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [figjam-mcp, figma-mcp]
    produces: [MoSCoW Spec Matrix, journey map with golden path and gap analysis, architecture brief]
    checkpoint: true
    checkpoint_prompt: "Activity 8 is the sign-off. All stakeholders verbal yes?"
    gate: "Sign-off gate: no verbal yes from all stakeholders means the failure-mode protocol, not Stage 4"
    exit_allowed: false
  - id: s5
    name: Stage 4 Synthesize
    owner: gandalf
    chain_node: "Chain 6 NODE 5 (auto-triggered by sign-off)"
    skills: [ia-synthesize, product-management:write-spec, xcm-user-stories, product-playbook]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [linear-mcp, clickup-mcp, asana-mcp]
    produces: [requirements and specs doc, Linear backlog with story points and dependencies, investment estimate, client-facing package]
    checkpoint: true
    checkpoint_prompt: "Synthesis package is ready for team validation before client delivery. Validate, or send back to Neo for fixes?"
    gate: "Validation gate: team review before the 48-hour client delivery"
    exit_allowed: true
  - id: s6
    name: Stage 5 Build handoff
    owner: neo
    chain_node: "Chain 6 NODE 6 into Chain 4"
    skills: [ia-build-handoff, repo-scaffold, xcm-spec-generator, xcm-context-package]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [claude-code, linear-mcp, github-mcp]
    produces: [Sprint 1 active, repo scaffolded, working software, demo cadence]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
  - id: s7
    name: Client communications
    owner: morpheus
    chain_node: "Chain 4 NODE 9"
    skills: [stakeholder-update, status-report, engineering:standup]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: [slack-mcp, gmail-mcp]
    produces: [weekly demos, status reports, Friday review notes]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
deliverables:
  - type: markdown
    dual_with: deck
  - type: deck
    dual_with: markdown
  - type: code
    dual_with: null
cost_envelope_usd: [40, 250]
time_envelope: "2 to 3 days pre-work, 2 days of 4 hours each, 48-hour delivery, Sprint 1 from Day 3; compressible to 1 day or stretched to 3"
exit_criteria:
  - "Engagement Lead approved the Intelligence Brief"
  - "Sign-off captured from all stakeholders at Activity 8"
  - "Team validation passed before the 48-hour delivery"
  - "Linear backlog pre-populated with story points and dependencies"
  - "Chain 4 NODE 1 platform detection reads from the Architecture Brief without asking"
memory_writes:
  - "client.intelligence_brief_path"
  - "client.personas (validated on Day 1)"
  - "client.spec_matrix and golden_path"
  - "client.architecture_brief and build_target"
  - "client.sign_off_record (who, when)"
open_questions: []
---

# Innovation Accelerator Workshop

## Purpose

Kevin's signature engagement: fuzzy idea to development-ready specification in two days plus pre-work. Five stages, fifteen named AI agents, ten-plus deliverables, three human gates. This is the one workflow where Gandalf orchestrates the other subagents rather than being called by them, and Tár does not orchestrate inside it. Chain 6 is the spine; the `innovation-accelerator` skill and its facilitator run-of-show are the script.

## Stages

### s1. Bundle plan

Gandalf applies the customization handles (client, industry, brand inputs, participant count, format, duration, stage skips, build target, defaulting to no-build) and prints the five-phase bundle plan with lead, participants, timings, and agent numbers. "Gandalf presents this plan to the user, gets confirmation, then executes." Checkpoint.

### s2. Stage 1 Prepare (2 to 3 days before)

`ia-prepare`. Gandalf calls Sherlock (`discover-brand`, `site-audit`, `competitive-brief`, `synthetic-audience`) and Snape (brand interpretation, `design-language`, `aesthetic-system` read). Output: Intelligence Brief, tailored agenda, risk and alignment flags. First gate: Engagement Lead review; loop until approved.

### s3. Stage 2 Discover (Day 1, 4 hours)

`ia-discover-day1`. Lightning Talks (Agent 03), Product Vision (Agent 04), Persona Co-Creation (Agent 05), How Might We plus voting (Agents 06 and 07), Day 1 Wrap (Agent 08). Morpheus produces the Day 1 synthesis report and the overnight stakeholder check-in template. Output: vision, validated personas, problem statement, top three priorities. The persona produced here satisfies the Prototype Prerequisites for everything downstream.

### s4. Stage 3 Define (Day 2, 4 hours)

`ia-define-day2`. MoSCoW and live Spec Matrix (Agent 09), User Journey and gap analysis with Sherlock mid-activity (Agent 10), Tech Solutioning and Architecture Brief with Snape mid-activity for design fidelity (Agent 11), Stakeholder Alignment and Sign-Off (Agent 12, critical). Second gate: "IF sign-off captured (all stakeholders verbal yes) → proceed to NODE 5 (auto-trigger) ELSE → invoke failure mode protocol." The checkpoint is the sign-off itself.

### s5. Stage 4 Synthesize (same day, after sign-off)

`ia-synthesize`, auto-triggered. Requirements and specs (Agent 13); Neo builds the Linear backlog (Agent 14) with story points (Agent 15) and dependency mapping; investment estimate; Morpheus packages the client deliverable. Third gate: team validation before the 48-hour delivery. Exit allowed after delivery when the build target is no-build.

### s6. Stage 5 Build handoff (Day 3 onward)

`ia-build-handoff`. "THIS IS THE EXIT POINT FOR GANDALF'S ORCHESTRATION." Neo enters Chain 4 with the pre-populated backlog, Architecture Brief, Spec Matrix, and golden path; Chain 4 NODE 1 reads the platform from the Architecture Brief without asking. Repo scaffolded, Sprint 1 active.

### s7. Client communications

Morpheus continues: weekly demos, status reports, Friday reviews.

## Checkpoints

- **s1** plan confirmation.
- **s2** Engagement Lead review (gate).
- **s4** sign-off (gate).
- **s5** team validation (gate).

Four checkpoints, three of them gates. This is the most gated workflow in DZNR by design.

## Deliverables

Intelligence Brief, agenda, Day 1 synthesis, Spec Matrix, journey map with golden path, Architecture Brief, requirements and specs doc, Linear backlog, investment estimate, client package (markdown dual with deck), and from Stage 5 working software.

## What this is not

- Not a generic design workshop (Sherlock, `hcd-ai-design`).
- Not a GV design sprint.
- Not innovation strategy consulting.
- Not something Tár runs; Gandalf orchestrates and Tár stands down inside Chain 6.

## Grounding notes

Source: Chain 6 (the only chain with three named human gates), the `innovation-accelerator` master skill with its five-stage table and bundle plan template, and the facilitator run-of-show guide (1,193 lines). The methodology is battle-tested at ISHIR per the skill; DZNR has not yet logged a run of Chain 6 end to end through Tár, so the stage structure follows the skill and chain exactly and adds nothing. Failure modes inherit from the skill: no extractable brand (Snape offers three options), sign-off not captured (reschedule, async follow-up, or escalate), interrupted mid-stage (partial delivery plus diagnostic), post-sign-off scope change (Morpheus drafts amendment, new sign-off).

## Changelog

- 1.0 (2026-09-04): created from Chain 6 and the Innovation Accelerator skill.

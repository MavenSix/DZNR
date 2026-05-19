# DZNR Change Proposal — Innovation Accelerator Skill Pack

**Proposer:** Kevin (with Claude drafting)
**Date:** 2026-05-18
**Type:** New skill pack (6 skills) + new architectural pattern (inverse orchestration) + new chain (Chain 6)
**Status:** PROPOSED → REVIEW → APPROVED

---

## What

Add the **Innovation Accelerator** methodology to DZNR as a coordinated skill pack owned by Gandalf.

**Skill pack composition (6 new skills):**

| Skill | Role |
|-------|------|
| `innovation-accelerator` | Master skill — orchestrates the 5-stage methodology |
| `ia-prepare` | Stage 1 — pre-workshop discovery + brand eval (2-3 days before) |
| `ia-discover-day1` | Stage 2 — Day 1 facilitation (4 activities, 4 hours) |
| `ia-define-day2` | Stage 3 — Day 2 facilitation (4 activities + sign-off gate) |
| `ia-synthesize` | Stage 4 — requirements extraction, Linear backlog, estimation |
| `ia-build-handoff` | Stage 5 — prototype + sprint kickoff handoff |

**New architectural pattern: Inverse Orchestration**

For the IA methodology, Gandalf orchestrates other subagents instead of being called by them. This is an explicit, documented exception to the usual Gandalf pattern.

When `innovation-accelerator` runs, Gandalf:
- Calls Sherlock for Stage 1 (client discovery + brand evaluation)
- Calls Snape for Stage 1 (brand & style breakdown of client property)
- Calls Morpheus for facilitator deliverables and post-workshop comms
- Calls Neo for Stages 4–5 (Linear, estimation, prototype, sprint kickoff)

This is the **first inverse orchestration pattern in DZNR**. It establishes a precedent for future methodology-driven skill packs.

**New routing chain: Chain 6 — Innovation Accelerator**

Adds to `routing/CHAINS.md` as a coequal chain alongside Chains 1-5. Gandalf is the chain owner. Other subagents are participants.

---

## Why

The Innovation Accelerator is Kevin's existing client engagement methodology. It already runs as a real 2-day workshop for real clients with documented facilitator guides, AI agent specifications, and output artifacts. Two HTML reference files document the full methodology:

- `Innovation_Accelerator_HighLevel_Flow.html` — 5-stage overview, metrics, handoff
- `IA Facilitator Run of Show Guide.html` — 1193 lines, full operational detail with scripts, timing, watch-fors, recovery moves

Without integration into DZNR:
- The methodology lives as static HTML, not invokable
- Kevin manually orchestrates the 5 stages each time
- AI agents in the methodology (15 named) are conceptual, not executable
- The team can't run the methodology without Kevin

With integration:
- Kevin says "run the IA for [client]" and the chain executes
- Stage 1 pre-work is automated (Sherlock + Snape)
- Day 1 / Day 2 facilitator guides are accessible via the skill
- Stage 4 synthesis is automatic
- Stage 5 hands cleanly to Neo for actual build

**Real use cases this unlocks:**
- "Run the Innovation Accelerator for [client] — workshop is next Thursday"
- "Prepare the Day 1 deck for tomorrow's IA session"
- "Generate the Spec Matrix from yesterday's MoSCoW voting"
- "Synthesize the Day 1 outputs into tonight's report"
- "Trigger the IA pipeline — sign-off is locked"

**Team impact:**
Kevin's 2-3 designers can now facilitate the IA without Kevin's direct involvement. The methodology becomes portable and consistent across team members.

---

## Which subagent claims it

**Primary owner: Gandalf**
- This is methodology — Kevin's accumulated craft
- Workshop-flavored skills live in Gandalf's roster
- Cross-cutting nature (touches design, research, engineering, facilitation) fits Gandalf's mentor-craftsman archetype

**Inverse orchestration:**
- Gandalf calls Sherlock for Stage 1 discovery and brand input gathering
- Gandalf calls Snape for Stage 1 brand & style breakdown of client property
- Gandalf calls Morpheus for facilitator scripts and post-workshop deliverables
- Gandalf calls Neo for Stage 4 synthesis (Linear population, estimation) and Stage 5 build handoff

**Tár's role:**
- Tár still routes the initial request to Gandalf when IA triggers fire
- Tár does NOT orchestrate within Chain 6 — Gandalf does
- This is the documented exception

---

## Overlap analysis

**Adjacent skills:**
- `hcd-ai-design` (Sherlock, anthropic-skills) — covers AI-augmented design thinking workshops. **Real overlap.** Resolution: hcd-ai-design is the generic workshop framework. `innovation-accelerator` is Kevin's specific methodology built ON TOP of hcd-ai-design principles. The IA pack references hcd-ai-design as a foundation skill.
- `discovery` (Sherlock, anthropic-skills) — used in Stage 1. Not duplicative — IA invokes it as a tool.
- `discover-brand` (brand-voice plugin) — used in Stage 1. Same pattern — invoked, not duplicated.
- `site-audit` (Sherlock) — used in Stage 1 for client web/app evaluation.
- `synthesize-research` (Sherlock) — used in Stage 2 for activity output synthesis.
- `journey-mapping` (shared) — used in Day 2 Activity 6. Inherits the journey-mapping disambiguation rules from SHARED_SKILLS.md.
- `pitch` / `presentation-storytelling` (Morpheus) — used for Day 1 wrap-up reports and final deliverables.
- `product-playbook` (anthropic-skills) — adjacent to IA's project plan output. Not duplicative — IA produces a more structured Spec Matrix.
- `repo-scaffold` / `xcm-*` skills (Neo) — used in Stage 5 build handoff.

**No skill that IA duplicates entirely.** IA is a meta-methodology that *uses* existing skills as building blocks.

---

## Routing impact

### New triggers (TRIGGERS.md — Gandalf section)

```
Innovation Accelerator (Gandalf orchestrates):
- "innovation accelerator", "IA workshop", "innovation workshop"
- "2-day accelerator", "design sprint" (with Kevin-specific framing)
- "run the accelerator", "run IA for [client]"
- "prepare for the workshop", "Day 1 prep", "Day 2 prep"
- "Spec Matrix", "MoSCoW workshop", "sign-off workshop"
- "post-workshop synthesis", "workshop deliverables"

Stage-specific (callable individually):
- "ia-prepare" / "workshop pre-work" / "intelligence brief"
- "ia-discover-day1" / "Day 1 facilitation" / "Day 1 run of show"
- "ia-define-day2" / "Day 2 facilitation" / "Day 2 sign-off"
- "ia-synthesize" / "Linear backlog from workshop" / "workshop synthesis"
- "ia-build-handoff" / "sprint kickoff from IA" / "trigger the build pipeline"
```

### New chain (CHAINS.md — Chain 6)

Full Chain 6 spec added to routing/CHAINS.md with:
- Entry conditions
- 5-stage decision tree
- Gandalf orchestration logic
- Cross-subagent call points
- Exit conditions
- Interruption rules

### Updated Gandalf agent definition (agents/gandalf/AGENT.md)

Adds "Orchestrator mode" as a third operating model alongside peer and tool:

> **Gandalf has three operating models:**
> 1. As peer (Tár routes directly)
> 2. As tool (other subagents pull Gandalf in mid-work)
> 3. **As orchestrator** (Gandalf calls other subagents for methodology-driven skill packs — currently only the Innovation Accelerator)

---

## Test coverage

**Re-trace existing tests that might intersect:**
- TEST 18 (Innovation workshop with interactive synthesis) — should now route to `innovation-accelerator` directly, not the generic hcd-ai-design path. Confirm.
- TEST 14 (Deep brand + heuristic audit + pitch deck) — adjacent but distinct. Should still route as currently designed (not IA).
- TEST 2 (Kevin's compound discovery example) — adjacent but distinct. Should still route as currently designed.

**Propose 3 new tests:**

**NEW TEST 23:** "Run the Innovation Accelerator for [client]. Workshop is next Thursday and Friday."
- Expected: Gandalf takes lead, initiates Chain 6, Stage 1 begins (Sherlock + Snape pre-work)
- Pass criteria: No clarification needed, full chain initiates with bundle plan

**NEW TEST 24:** "Prepare the intelligence brief and tailored agenda for the IA — client is [name], they're in [industry], session is in 3 days."
- Expected: Gandalf invokes `ia-prepare` directly (Stage 1 only). Sherlock + Snape do pre-work.
- Pass criteria: Stage 1 fires standalone without triggering Stages 2-5

**NEW TEST 25:** "Synthesize Day 1 outputs from the workshop into the overnight report."
- Expected: Gandalf invokes `ia-synthesize` standalone. Pulls in Day 1 transcripts + agent outputs.
- Pass criteria: Stage 4 fires standalone without dragging in earlier stages

---

## Risks

**Risk 1: Inverse orchestration confuses the routing system**
- Severity: High (architectural)
- Mitigation: Explicit documentation in CHAINS.md, TRIGGERS.md, agents/gandalf/AGENT.md, and SHARED_SKILLS.md. Add "Chain 6 ownership" as an explicit note everywhere it could matter.

**Risk 2: Team members don't know about IA**
- Severity: Medium
- Mitigation: Add to docs/TEAM_REFERENCE_CARD.md. Add IA section to docs/GETTING_STARTED.md.

**Risk 3: The methodology is heavy — invoking it accidentally would be expensive**
- Severity: Medium
- Mitigation: Triggers require explicit IA-specific language ("innovation accelerator", "IA workshop"). Generic "workshop" alone doesn't trigger — that goes to hcd-ai-design via Sherlock.

**Risk 4: The 15 named AI agents in the methodology have specific responsibilities that aren't yet implemented**
- Severity: Medium
- Mitigation: V1 embeds them as prompt protocols inside the stage skills. V2 can extract as standalone skills if usage warrants.

**Risk 5: Stage 1 pre-work might conflict with existing Sherlock chains**
- Severity: Low
- Mitigation: Stage 1 calls Sherlock as a tool, not as a chain-leader. Sherlock's existing chain 1 entry conditions still apply for non-IA discovery requests.

---

## Decision

**Status:** APPROVED
**Approver:** Kevin
**Approval date:** 2026-05-18

**Rationale:**
- Methodology is real, documented, and battle-tested with clients
- Skill pack structure preserves modularity (each stage can be invoked alone)
- Inverse orchestration is an explicit, bounded exception with clear documentation
- Existing routing rules don't break
- New tests cover the new patterns

---

## Next steps (Evolution Workflow Steps 3-5)

- ✅ Step 1: Proposal written (this doc)
- ✅ Step 2: Approved
- 🔄 Step 3: Build the 6 skills, update routing docs, co-locate reference HTML files
- ⏭ Step 4: Regression test — re-trace existing tests + add 3 new IA-specific tests
- ⏭ Step 5: Deploy — version bump to 1.1.0 (minor, per EVOLUTION.md semver rules — new skills + new chain)

---

## CHANGELOG entry (to add to CHANGELOG.md)

```
## [1.1.0] — 2026-05-18

### Added
- Innovation Accelerator skill pack (6 skills owned by Gandalf):
  - innovation-accelerator (master)
  - ia-prepare (Stage 1: discovery + brand eval)
  - ia-discover-day1 (Stage 2: Day 1 facilitation)
  - ia-define-day2 (Stage 3: Day 2 facilitation + sign-off)
  - ia-synthesize (Stage 4: requirements + Linear + estimation)
  - ia-build-handoff (Stage 5: prototype + sprint kickoff)
- New architectural pattern: Inverse Orchestration (Gandalf calls other subagents during IA chains)
- New routing chain: Chain 6 — Innovation Accelerator
- 3 new stress tests (Tests 23, 24, 25)
- Reference HTML files co-located in skills/workshop/innovation-accelerator/references/

### Changed
- agents/gandalf/AGENT.md — adds "Orchestrator mode" as third operating model
- routing/CHAINS.md — adds Chain 6 + inverse-orchestration documentation
- routing/TRIGGERS.md — adds Gandalf IA triggers + stage-specific triggers
- routing/SUBAGENT_ROSTERS.md — Gandalf roster grows from 38 to 44 skills
```

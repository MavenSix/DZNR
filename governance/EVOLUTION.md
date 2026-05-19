# DZNR Evolution Protocol

**Phase 3.1 of the DZNR build**
**Status:** Draft v1
**Last updated:** 2026-05-18

## Why this document exists

DZNR is not static. New MCPs ship. New skills are written. Plugins update. Your workshop evolves. Sometimes you'll find something cool (Mobbin, a new Figma integration, a better SEO tool) and want to bring it into DZNR.

Without a protocol, you'd end up doing one of two bad things:
1. **Hoarding decisions** — every new skill becomes a multi-step debate, slow and exhausting
2. **Breaking things silently** — additions slip in without updating routing, and DZNR starts misrouting

This protocol prevents both. It defines exactly how DZNR changes over time, who can propose what, who decides, and what regression-tests run before changes go live.

---

## Three ownership types in DZNR

Different parts of DZNR have different update rules.

### Type 1: Architecture — strictly Kevin

The constitutional layer. Only Kevin changes these.

| File | What it owns |
|------|--------------|
| TRIGGERS.md | Routing keywords for each subagent |
| CHAINS.md | Chain decision trees + compound request handling |
| SHARED_SKILLS.md | Shared-skill disambiguation matrix |
| FAILURE_MODES.md | Failure response protocols |
| DECISIONS.md | Locked architectural decisions |
| SUBAGENT_ROSTERS.md | The cast (Tár, Snape, etc.) |

**Rule:** Team can PROPOSE changes here via the contribution workflow below, but only Kevin approves.

### Type 2: Skills — split ownership

Skills come from four sources, each with different update rules.

| Source | Count | Who owns | Update rule |
|--------|-------|----------|-------------|
| Plugin skills | ~97 | Plugin authors | Updates when plugin updates. DZNR doesn't modify. |
| Anthropic-skills core | ~57 | Anthropic | Same as above. |
| Gandalf's workshop | 38 | Kevin | Kevin modifies freely. Synced to DZNR repo. |
| DZNR-curated skills | varies | DZNR repo | Kevin or team via PR. Includes renamed versions (competitive-brief-pm, etc.) |

**Rule:** Workshop and DZNR-curated skills are editable. Plugin and core skills are NOT — if they need to change, that's an upstream issue or a fork.

### Type 3: Integration — distributed proposal, Kevin approves

The "what gets added to DZNR" layer. Team can propose; Kevin approves.

| Integration type | Who proposes | Who approves | Where it lands |
|------------------|--------------|--------------|----------------|
| New MCP | Team or Kevin | Kevin | Subagent roster + TRIGGERS.md |
| New plugin | Team or Kevin | Kevin | SUBAGENT_ROSTERS.md + TRIGGERS.md |
| New workshop skill | Kevin only | Kevin | Gandalf's roster + sync to DZNR |
| New DZNR-curated skill | Team or Kevin | Kevin | Subagent roster + TRIGGERS.md |
| Modification to existing skill | Owner per Type 2 | Kevin if it affects routing | Per Type 2 rules |
| New subagent (8th character) | Team or Kevin | Kevin | Major change — full Phase 2 re-stress-test required |
| Skill deprecation | Team or Kevin | Kevin | Roster removal + stress-test |

---

## The Evolution Workflow

For ANY proposed change, the workflow is the same. Five steps.

### Step 1: Propose

The proposer (Kevin, team member, or even Claude detecting a pattern) writes a short proposal. Template lives at the bottom of this doc. It captures:

- What's being added/changed/removed
- Why (what use case it serves)
- Which subagent claims it
- Which existing skills it overlaps with (if any)
- Whether it changes routing

### Step 2: Review

Kevin reviews. Three possible outcomes:
- **Approve** — proposer proceeds to Step 3
- **Reject** — proposer is told why, can revise and re-propose
- **Defer** — interesting but not now, parked for later review

### Step 3: Update routing docs

If approved, the relevant docs get updated:
- TRIGGERS.md gets new keywords
- SUBAGENT_ROSTERS.md gets the new skill in the right roster
- SHARED_SKILLS.md gets new disambiguation rules if needed
- CHAINS.md gets updated if the new skill changes any chain flow
- DECISIONS.md gets a changelog entry

### Step 4: Regression test

Re-run the stress test (STRESS_TEST.md) — at minimum the 20 traced requests. Confirm:
- No existing test gets a different verdict
- No new ambiguity is introduced
- Snape's clarification rate doesn't spike

If any test now fails, the change needs refinement before going live.

### Step 5: Deploy

- Push to DZNR GitHub repo
- Update version number in CHANGELOG
- Notify team

---

## Worked example: Adding Mobbin

Mobbin is a UI pattern reference library (mobbin.com — searchable database of mobile app screenshots and design patterns by app, by flow, by component). If Mobbin shipped an MCP and you wanted to add it to DZNR, here's what would happen.

### Step 1: Propose

```
PROPOSAL: Add Mobbin MCP to DZNR

What:
  - Integrate Mobbin MCP (when available)
  - Tools: search_apps, search_patterns, get_screenshots, get_flow

Why:
  - Sherlock needs reference data for competitive analysis and pattern research
  - Snape needs reference patterns when designing from scratch or in brand-build flows
  - Kevin has used Mobbin extensively in design work — it's part of his existing process

Which subagent claims it:
  - PRIMARY: Sherlock (research / pattern discovery)
  - SECONDARY: Snape (called as tool when designing — similar to Gandalf pattern)

Overlap with existing skills:
  - Adjacent to: competitive-brief (Sherlock), design-critique (Snape), discover-brand (brand-voice plugin)
  - Not duplicative — Mobbin provides reference patterns; existing skills analyze and synthesize

Routing changes:
  - Add Sherlock triggers: "Mobbin", "find patterns from", "show me examples of", "reference apps for"
  - Add Snape secondary trigger: "design like [app]", "what does [app] do for this", "Mobbin reference"

Proposer: Kevin
Date: TBD when Mobbin MCP is available
```

### Step 2: Review

Kevin approves. Mobbin fits cleanly — it's a research tool that maps to Sherlock and gets called by Snape similar to how Gandalf is called.

### Step 3: Update routing docs

Changes to TRIGGERS.md:
- Sherlock primary triggers add: "Mobbin", "reference apps", "find patterns from real apps", "show me how [Brand] does X"
- Snape context-dependent triggers add: "design like [app]" → call Sherlock for Mobbin lookup, then Snape designs

Changes to SUBAGENT_ROSTERS.md:
- Sherlock roster gets "mobbin:search_apps", "mobbin:search_patterns", "mobbin:get_screenshots", "mobbin:get_flow"

Changes to SHARED_SKILLS.md:
- Add Mobbin as a "called-by-Sherlock, used-by-Snape" pattern (like Gandalf for workshop tools)

Changes to DECISIONS.md changelog:
- "2026-XX-XX: Added Mobbin MCP. Primary owner: Sherlock. Secondary tool-call: Snape. Rationale: design reference library, fills a gap in pattern discovery."

### Step 4: Regression test

Re-trace STRESS_TEST.md Tests 11-20. Specifically watch for:
- Test 12 ("design a website... extract all the styles from their site") — does Mobbin get pulled in now? It would help Sherlock's discover-brand work.
- Test 15 ("design system from scratch") — does Mobbin help Snape with reference patterns? Yes, likely a Snape→Sherlock(Mobbin) tool call.
- New test added: "Show me how Linear handles onboarding — I want to use that as inspiration for our client's app." → Sherlock + Mobbin direct invocation.

### Step 5: Deploy

- Mobbin appears in DZNR's available capabilities
- CHANGELOG entry written
- Team notified: "DZNR can now pull design references from Mobbin. Trigger phrases include..."

---

## Special cases

### Adding a workshop skill (Gandalf-only)

You're the only one who can add workshop skills, since they're authored by you in `~/.claude/skills/`. Workflow:

1. Author the skill locally
2. Sync to DZNR repo via the sync script (to be built in Phase 3.2)
3. Add to Gandalf's roster in SUBAGENT_ROSTERS.md
4. If the skill creates new trigger words, update TRIGGERS.md
5. If the skill overlaps with another subagent's skill, update SHARED_SKILLS.md (likely Gandalf-override rule)
6. Re-run stress test
7. Push

### Adding a new subagent (8th character)

Major architectural change. Treat as a full Phase 2 re-do for the new character:

1. Propose the new character's archetype, domain, and skill mapping
2. Define their primary triggers, context-dependent, anti-triggers, handoff signals (TRIGGERS.md)
3. Define their chain participation (CHAINS.md)
4. Identify shared skills with existing characters (SHARED_SKILLS.md)
5. Re-run the FULL stress test, not just the 20 traced requests — add 5 new tests specifically targeting the new character
6. Deploy

**Important:** if the new character's role overlaps significantly with an existing one, consider modifying the existing character's scope INSTEAD of adding a new one. The cast of 7 active + 1 parked is intentionally bounded.

### Deprecating a skill

When a skill is broken, outdated, or replaced by something better:

1. Mark it deprecated in SUBAGENT_ROSTERS.md (don't remove yet)
2. Identify the replacement (could be a new skill, a different subagent's skill, or "no replacement, just drop")
3. Update TRIGGERS.md to redirect its triggers
4. Run stress test with the deprecated skill removed from routing
5. After one project cycle without issues, fully remove
6. Archive the SKILL.md in DZNR/archive/ (never delete — for audit trail)

### Modifying a routing rule

Examples: changing the "design" default from Snape to someone else, changing the audit default, adding a new disambiguation default.

1. Propose with rationale
2. Re-trace ALL 20 stress tests with the new rule
3. Confirm no test gets WORSE (a test that used to pass cleanly shouldn't now require clarification)
4. Update TRIGGERS.md
5. DECISIONS.md changelog entry

---

## Team contribution workflow

Your 2 to 3 close collaborators are the second tier of DZNR users. They can propose changes via this workflow.

### Proposal channels

- **GitHub Issue** (recommended once DZNR is on GitHub) — use the proposal template
- **Slack/direct to Kevin** — for fast back-and-forth on small ideas
- **Inline comments** — they can edit a draft proposal directly in the DZNR repo's `/proposals/` folder

### Proposal template

```markdown
# DZNR Change Proposal

**Proposer:** [name]
**Date:** [date]
**Type:** [new skill / new MCP / modify skill / deprecate / new subagent / routing change]

## What
Brief description of the change.

## Why
The use case it serves. Specific example helpful.

## Which subagent claims it
Primary owner + secondary tool-callers if applicable.

## Overlap analysis
Which existing skills overlap? Are they duplicative or complementary?

## Routing impact
- New triggers needed: [list]
- New chain branches needed: [list]
- Shared-skill rules needed: [list]

## Test coverage
Which stress-test scenarios would exercise this? Propose 1-2 new tests if relevant.

## Risks
What could go wrong? What's the worst-case if the change is wrong?
```

### Approval criteria

Kevin approves when:
- The change has a clear use case (not speculative)
- Ownership is unambiguous (or can be made so)
- It doesn't break existing stress tests
- It's worth the cognitive load on the team to learn about

Kevin rejects when:
- The capability exists already (duplicate)
- The proposed routing would conflict with locked architecture
- The change is too narrow to justify the system complexity

Kevin defers when:
- Interesting but not urgent
- Need more usage data before committing
- Better solved by a different change

---

## Cadence

### Continuous
- Team members can propose changes any time
- Kevin reviews proposals as they come in (target: within 1 week)

### Quarterly review
Every 3 months, Kevin reviews:
- The stress test pass rate (any regressions?)
- The failure-mode log (any recurring patterns suggesting routing gaps?)
- The deferred proposals (anything ready to revisit?)
- Workshop skills (any that should graduate to Gandalf-promotion or get archived?)

### Annual architecture review
Once a year, full constitutional review:
- Is the cast still right? (Do we need to add/remove characters?)
- Are the chains still right? (Have new patterns emerged?)
- Is the failure-mode playbook still working? (Any new failure categories?)
- Is the team contribution workflow working? (Friction points?)

---

## Version control

DZNR uses semantic versioning for its routing architecture:

- **Major** (1.0 → 2.0): Cast changes, chain structure changes, locked architecture changes
- **Minor** (1.0 → 1.1): New skills added, new MCPs integrated, new disambiguation rules
- **Patch** (1.0.0 → 1.0.1): Trigger keyword tweaks, Snape phrasing refinements, doc clarifications

Current version: **DZNR v1.0** (locked after Phase 2 completion)

CHANGELOG entries in DECISIONS.md track every version.

---

## What this enables

With the Evolution Protocol in place:
- **You** can confidently approve or reject team proposals using a consistent rubric
- **Your team** has a clear path to contribute without breaking DZNR
- **New MCPs** get integrated cleanly (Mobbin example shows the flow)
- **Routing changes** can't slip in unnoticed — every change runs through stress tests
- **Long-term maintenance** stays manageable because changes are tracked and reversible

---

## Status

- ✅ Phase 2.1-2.5 — Complete (routing system designed and stress-tested)
- ✅ Phase 3.1 — Evolution Protocol (this doc)
- ⏭ Phase 3.2 — Repo scaffold
- ⏭ Phase 3.3 — Skill migration script
- ⏭ Phase 3.4 — First subagent build (Tár recommended)
- ⏭ Phase 3.5+ — Remaining subagents in priority order

---

## Mobbin integration: deferred to availability

Per registry check on 2026-05-18, Mobbin is not currently in the MCP registry. When it becomes available:

1. Pull this doc up
2. Follow the "Worked example: Adding Mobbin" section above
3. Total integration time estimated at 30-45 minutes including stress test re-run

If you want to mock-integrate Mobbin now (i.e. pre-define the routing as if Mobbin existed), we can. But it's better to wait until the real MCP shape is known — the actual tool names and capabilities will inform sharper triggers.

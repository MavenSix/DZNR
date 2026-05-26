# DZNR Failure-Mode Playbook

**Phase 2.5 of the DZNR routing system**
**Status:** Draft v1
**Last updated:** 2026-05-18

## Purpose

Every routing system fails sometimes. Reliable systems fail **predictably**, **visibly**, and **recoverably**. This playbook defines how DZNR handles every known failure mode.

When something goes wrong:
- DZNR detects the failure class
- Snape voices the user-facing acknowledgment (when applicable)
- The right recovery action fires
- The failure gets logged (in memory) so future sessions can learn

**Core principle:** Failures are not silent. Failures don't compound. Failures don't lie.

---

## The 6 failure categories

1. **Routing ambiguity** — Tár can't decide between subagents
2. **Missing capability** — the right subagent doesn't have a skill for the task
3. **Skill malfunction** — a skill ran but produced unusable output
4. **User disagreement with routing** — Tár picked X, user wanted Y
5. **Compound request collapse** — bundled request hits a blocker mid-flight
6. **Memory or context corruption** — stored knowledge is stale or wrong

Each category gets: detection rule, response protocol, Snape phrasing template (when user-facing), and recovery action.

---

## Category 1: Routing Ambiguity

### Detection rules
Tár enters ambiguity state when ANY of:
- Multiple subagents match primary triggers AND disambiguation rules don't resolve
- Request contains ONLY context-dependent triggers (no primary) AND multiple subagents tie
- Compound request where bundle plan has unclear ownership of a deliverable
- Shared-skill routing rules return multiple possible owners

### Response protocol
1. Tár pauses execution
2. Snape voices the clarifying question (terse, precise, slightly impatient)
3. Wait for user response
4. Tár proceeds with chosen route
5. Tár logs the decision in memory so the same project doesn't ask again

### Snape's clarification template library

**Template A — Two subagent choice (most common)**
```
"Tár's uncertain whether this is [SUBAGENT_X]'s work or [SUBAGENT_Y]'s.
Are you asking for [X_OUTCOME] or [Y_OUTCOME]?"
```
Example:
> "Tár's uncertain whether this is Snape's work or Gibson's. Are you asking for a brand visual system or an immersive experience?"

**Template B — Three+ subagent choice**
```
"Tár sees three possible routes:
  · [X] handles it if [condition X]
  · [Y] handles it if [condition Y]
  · [Z] handles it if [condition Z]
Which?"
```
Example:
> "Tár sees three possible routes:
>   · Snape handles it if you want a brand visual system
>   · Gibson handles it if you want an immersive/spatial experience
>   · Morpheus handles it if you want a pitch deck about the brand
> Which?"

**Template C — Compound deliverable ownership**
```
"Bundle plan is ready, but one deliverable's owner is unclear:
'[DELIVERABLE]' could go to [X] or [Y].
Pick or split?"
```
Example:
> "Bundle plan is ready, but one deliverable's owner is unclear: 'Style guide' could go to Snape (system-level) or Morpheus (presentation-level). Pick or split?"

**Template D — Shared skill ownership**
```
"'[SKILL]' lives in multiple rosters. For THIS request, should [X] or [Y] handle it?"
```
Example:
> "'Journey-mapping' lives in multiple rosters. For this request, should Sherlock (user journey) or Gibson (spatial journey) handle it?"

### Recovery action
- User picks → Tár logs the choice in project memory
- Future requests on the SAME project bias toward that choice
- Future requests on a DIFFERENT project still ask (no global override)

### Tone constraints (Snape's voice)
- Terse: never more than 3 lines unless absolutely necessary
- Precise: name the exact subagents and outcomes
- Slightly impatient: no "I'm sorry to bother you" or "if you don't mind"
- Never apologetic
- Never warm

**Bad example (DON'T):**
> "Hi! I just wanted to check — would it be possible to clarify whether you're looking for Snape or Gibson here? Either way works for me!"

**Good example (DO):**
> "Tár's uncertain — Snape or Gibson? Brand visual system or immersive experience?"

---

## Category 2: Missing Capability

### Detection rules
A capability gap exists when:
- A subagent receives a request that matches their domain
- But none of their assigned skills can produce the requested output
- AND no Gandalf workshop skill fits either
- AND no Snake Eyes specialist skill fits either

### Response protocol
1. Subagent reports capability gap to Tár
2. Tár checks adjacent subagents — does another have the skill?
3. IF yes → reroute to the subagent who has it (Snape voices the rerouting note)
4. IF no → Tár escalates to user via Snape with three options:
   - Use a near-fit skill (suboptimal but possible)
   - Add the capability to DZNR (skill-creator + add to roster)
   - Drop the deliverable from the request

### Snape's escalation template
```
"Capability gap detected.
You asked for [DELIVERABLE]. The closest fits are:
  · [SUBAGENT_X] could use [SKILL_X] — suboptimal because [REASON]
  · We could build a new skill for this (skill-creator)
  · Drop this deliverable from the request
Pick one."
```

### Examples

**Example 1: Smart glass / specialty hardware** (from TEST 13)
> Request: "Build an AR + smart glass museum installation"
> Gap: No subagent has specialty hardware tech selection skill
> Snape:
> "Capability gap. Smart glass tech selection isn't mapped.
> Closest fits:
>   · Gibson uses live-experience (covers spatial tech, lighter on hardware specifics)
>   · We could build a hardware-selection skill
>   · Drop hardware advice from this request
> Pick."

**Example 2: Domain Kevin doesn't usually do**
> Request: "Generate a biochemistry simulation for this protein folding study"
> Gap: Bio research is Snake Eyes, but Kevin's never used those skills
> Snape:
> "Capability gap. Bio research is parked in Snake Eyes (off-domain default).
> Options:
>   · Deploy Snake Eyes bio-research skills explicitly
>   · This is outside DZNR's tuned domain — handle elsewhere
> Pick."

### Recovery action
- If user picks "build new skill" → trigger Gandalf or skill-creator workflow
- If user picks "near-fit skill" → execute with documented limitation
- If user picks "drop deliverable" → continue with reduced scope
- Tár logs the gap in memory so we can backfill later

---

## Category 3: Skill Malfunction

### Detection rules
A skill malfunctioned when:
- The skill executed but returned garbage (incoherent, off-topic, broken format)
- The skill returned an error
- The skill produced output that violates known constraints (e.g. brand voice off-pattern)
- A validation step (Chain 4 NODE 4 or 6) flagged a failure

### Response protocol
1. Subagent detects the bad output (or validation does)
2. Subagent retries once with refined input
3. IF retry fails → Tár escalates via Snape

### Snape's malfunction template
```
"[SKILL] produced output that doesn't meet the bar.
Retry attempted: [yes/no, result].
Options:
  · Try a different skill: [LIST]
  · Adjust input (give me more context: [WHAT])
  · Skip this deliverable
Pick."
```

### Specific malfunction sub-types

**Sub-type 3A: Hallucination / off-topic**
- Output references things not in the input
- Snape: "Output drifted off the request. Want me to re-anchor with the original brief, or refine the prompt?"

**Sub-type 3B: Format mismatch**
- User asked for X format, got Y
- Tár auto-retries with explicit format instruction
- Snape only escalates if retry fails

**Sub-type 3C: Quality below bar**
- Output is technically correct but mediocre
- Subagent auto-calls Gandalf for `polish` and `harden`
- Snape escalates only if user explicitly says "this isn't good enough"

**Sub-type 3D: Constraint violation**
- Output violates brand voice, accessibility, code standards, etc.
- Subagent auto-calls Gandalf for the appropriate `fixing-*` skill
- Snape escalates if constraint can't be auto-fixed

### Recovery action
- Successful retry → log the input refinement pattern for future use
- Failed retry → Snape escalates with options
- Persistent malfunction → log in memory: "skill X fails on input type Y"

---

## Category 4: User Disagreement with Routing

### Detection rules
User disagreement signals:
- "No, that's not what I meant"
- "I wanted [OTHER_SUBAGENT] to handle this"
- "This should have gone to [SKILL/SUBAGENT]"
- "You routed wrong"
- "Why did [SUBAGENT_X] handle this?"
- User redirects mid-execution: "Stop, give this to [Y] instead"

### Response protocol
1. Tár immediately pauses current subagent's work
2. Snape acknowledges the misroute (terse, no defensiveness)
3. Tár reroutes to the user's chosen subagent
4. Tár logs the correction in memory — same project won't make this mistake again
5. If the misroute is a PATTERN (multiple times in different projects), Tár flags it as a routing rule gap

### Snape's misroute acknowledgment template
```
"Rerouting to [CORRECT_SUBAGENT].
Pausing [WRONG_SUBAGENT]'s work.
Anything from their output worth keeping?"
```

Example:
> "Rerouting to Gibson. Pausing Snape's work. Anything from his design system draft worth keeping for the experience design?"

### When user disagreement reveals a routing rule gap
After 3 corrections of the same pattern across different projects:
- Tár flags the gap in memory
- Next session, the user is asked: "I've routed this pattern wrong 3 times — should we update the routing rules?"
- Trigger TRIGGERS.md or SHARED_SKILLS.md update

### Recovery action
- Reroute immediately
- Salvage prior subagent's output if useful
- Log correction
- Surface pattern gaps for routing rule update

---

## Category 5: Compound Request Collapse

### Detection rules
A compound request collapses when mid-flight:
- A subagent in the bundle fails (Category 2 or 3)
- A deliverable depends on a prior deliverable that didn't produce
- The bundle plan was wrong (a dependency wasn't visible at planning time)
- The user pivots mid-bundle ("actually, skip phase 3")

### Response protocol
1. Tár pauses the bundle
2. Snape reports the collapse status:
   - What's been completed
   - What's blocked and why
   - What can still proceed independently
3. User decides: continue partial, restart, or abandon

### Snape's collapse template
```
"Bundle paused at Phase [N].
Completed: [LIST of artifacts]
Blocked: [BLOCKER] in Phase [M]
Still possible without [BLOCKED PHASE]: [LIST]
Options:
  · Continue partial (deliver what's done)
  · Wait for [BLOCKER] to resolve
  · Abandon bundle
Pick."
```

Example:
> "Bundle paused at Phase 3.
> Completed: site discovery, heuristic analysis, synthetic audiences, user journeys
> Blocked: brand & style breakdown — no brand inputs found on client site
> Still possible without brand work: project plan based on completed phases
> Options:
>   · Continue partial
>   · Send brand assets and retry
>   · Abandon bundle
> Pick."

### Recovery action
- Partial delivery is always an option
- Each completed phase's artifact is independently usable
- Blocked phase logged in memory: "client X has no extractable brand inputs"

---

## Category 6: Memory or Context Corruption

### Detection rules
Memory corruption signals:
- A stored memory contradicts current observable reality
- A "project memory" references a project the user doesn't recognize
- A routing decision biased by memory doesn't match the current request
- The user says "stop using that memory" or "forget what I told you about X"

### Response protocol
1. Tár flags the memory entry
2. Snape reports the conflict:
   - What memory says
   - What current request implies
3. User chooses: trust memory, trust current, or update memory

### Snape's memory conflict template
```
"Memory conflict.
Memory says: [STORED_BELIEF]
This request implies: [CURRENT_OBSERVATION]
Which is right?
  · Memory wins — proceed with stored context
  · Current wins — update memory and proceed
  · Wait — explain the discrepancy"
```

Example:
> "Memory conflict.
> Memory says: Client X uses Sitecore XM Cloud (locked 2026-03-12)
> This request implies: Client X is moving to AEM
> Which is right?
>   · Memory wins
>   · Current wins (update memory)
>   · Wait — explain the discrepancy"

### Recovery action
- User confirms memory update or override
- Tár writes the new memory with timestamp + reason for change
- Old memory archived (not deleted) for audit trail

---

## Cross-cutting rules

### When NOT to escalate to the user

Tár handles autonomously (no Snape clarification) when:
- A skill's output is correct but unpolished → auto-call Gandalf for polish
- A validation step finds a fixable issue → auto-fix and continue
- A subagent's output has a format issue with clear correction → auto-retry
- Memory says we've handled this exact ambiguity for this project before → use prior decision

### When to ALWAYS escalate

Snape always voices a question when:
- Routing is genuinely ambiguous (Category 1)
- A capability is missing entirely (Category 2)
- A retry failed (Category 3)
- The user signals disagreement (Category 4)
- A compound bundle hits a blocker that has multiple recovery paths (Category 5)
- Memory conflicts with observed reality (Category 6)

### Escalation budget

Per request, Snape should not voice more than **3 clarifying questions in a row**. If we hit 3 clarifications without progress, the request is too underspecified — Snape says:
> "Three clarifications in. The request needs more shape before DZNR can route cleanly. Want to rewrite, or have me restate what I understand so far?"

This prevents clarification spirals.

---

## Logging and learning

Every failure mode invocation gets logged in DZNR memory with:
- Failure category
- Request that triggered it
- Resolution chosen
- Whether the resolution succeeded
- Timestamp

After every 10 failure-mode events, Tár reviews the log for patterns and proposes routing rule updates if any pattern recurs 3+ times.

---

## Team-facing failure summary card

For Kevin's collaborators learning DZNR. Print and hand to them:

| If DZNR says... | It means... | You should... |
|------------------|-------------|----------------|
| "Tár's uncertain whether..." | Routing ambiguity | Pick a route |
| "Capability gap detected" | Skill doesn't exist | Pick option (near-fit / build / drop) |
| "[Skill] produced output that doesn't meet the bar" | Skill malfunction | Pick option (different skill / refine / skip) |
| "Rerouting to [X]" | DZNR caught a misroute | Confirm anything worth salvaging |
| "Bundle paused at Phase N" | Compound request blocker | Choose partial / wait / abandon |
| "Memory conflict" | Old vs new context | Tell DZNR which to trust |
| "Three clarifications in" | Request is underspecified | Rewrite the request |

---

## Status

- ✅ Phase 2.1 — Trigger keyword maps
- ✅ Phase 2.2 — Chain decision trees (with compound request handling)
- ✅ Phase 2.3 — Shared-skill disambiguation matrix
- ✅ Phase 2.4 — Stress test (10 baseline + 10 real, v2 clean)
- ✅ Phase 2.5 — Failure-mode playbook (this doc)

---

## Phase 2 complete. Ready for Phase 3 (scaffolding).

All routing decisions are documented. All failure modes have protocols. All Snape phrasing is templated. The team handoff card exists.

What gets built next:
- Phase 3.1: DZNR repo scaffold (folder structure, contracts, conventions)
- Phase 3.2: First subagent build (Tár — the orchestrator)
- Phase 3.3: Second subagent build (recommended: Neo, given delivery work is foundational across most chains)
- Phase 3.4+: Remaining subagents

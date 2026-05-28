# DZNR Change Proposal

**Proposer:** Kevin (with Claude drafting)
**Date:** 2026-05-27
**Type:** Architectural feature, multi-level rollout
**Status:** PROPOSED → REVIEW
**Target version:** v1.14.0 (Level 2 + Level 3)
**Related shipped work:** v1.13.0 Level 1 in-character status announcements

---

## What

Make DZNR orchestration visible to users at three levels of fidelity, building on the Level 1 in-character status announcements that shipped in v1.13.0.

The headline pattern is Pencil's design agent swarm. When Pencil's multi-agent system is working, the user sees who is doing what at each handoff. DZNR adopts that pattern in a way that fits Claude Code as the host.

Three levels:

**Level 1 (shipped, v1.13.0):** In-character status announcements at handoff points. Each subagent has a Visibility Protocol section in their AGENT.md describing voice, examples, and constraints. Tár narrates phase opens and closes. Subagents narrate their own openings and completions. Status announcements are part of the normal text stream Claude Code already renders.

**Level 2 (proposed for v1.14.0):** Cowork progress widgets. When DZNR runs in Cowork mode, status announcements render as live progress widgets above the text stream. A widget per active subagent showing current phase, current skill, current MCP if any, elapsed time. The widget updates as the subagent narrates. Closes when the subagent finishes their phase.

**Level 3 (proposed for v1.14.0):** Orchestration ledger. A persistent log written to `.dznr/orchestration.log` capturing every phase open, phase close, skill invocation, MCP call, and subagent handoff with timestamps. The ledger is the source of truth that Levels 1 and 2 read from. Adopters can pipe it to their own dashboards, debugging tools, or analytics.

---

## Why

**Level 1 already shipped.** It gave DZNR a voice. Users see who is on stage and what they are doing. The character voices make orchestration narratable rather than opaque.

**Level 2 is the Pencil parity move.** Cowork users are already familiar with widgets that render alongside the chat. The progress widget pattern is native to Cowork. Level 1 alone reads as text in the stream; Level 2 makes the orchestration spatially distinct, the way Pencil distinguishes the swarm from the conversation.

**Level 3 is the foundation.** Without a ledger, Levels 1 and 2 are display-only. With the ledger, adopters can build their own visualizations, run debugging tools against past orchestrations, generate per-project orchestration histories, and feed the ledger into observability tools. The ledger also unlocks regression testing of orchestration patterns ("did Tár dispatch Sherlock before Snape in this run?").

**Architectural reality check.** The live test on 2026-05-27 confirmed Tár absorbs subagent prompts as context rather than dispatching them via the Task tool. Levels 1, 2, and 3 work whether dispatch is collapsed (current architecture) or expanded (future architecture). The visibility lives at the narration layer, not the dispatch layer.

---

## Which subagent claims it

This is infrastructure, not a domain skill. Owner: Tár (the orchestrator).

Tár writes phase boundaries to the ledger and emits widget events. Subagents write their own narration to the ledger and emit widget updates. Snake Eyes writes minimal events (one line per skill deployed, one line per completion) to honor its silent-by-design constraint.

**Not owned by:** any specialist subagent. Visibility is orchestration infrastructure; domain subagents author their narration but do not own the rendering pipeline.

---

## Level 2 design (Cowork progress widgets)

**Trigger condition:** DZNR detects it is running inside Cowork mode (Cowork-specific tools are present in the available tool list).

**Widget structure (proposed):**

```
+-------------------------------------------+
| Tár                                        |
| Phase 2 of 3, compound flow                |
| Brand layer in sequence                    |
| 00:42 elapsed                              |
+-------------------------------------------+
+-------------------------------------------+
| Snape                                      |
| Brand-from-scratch                         |
| Reading industry posture: fintech          |
| 00:18 elapsed                              |
+-------------------------------------------+
```

**Lifecycle:** widget opens on subagent dispatch, updates as the subagent narrates, closes on completion. Multiple widgets render simultaneously when subagents work in parallel.

**Style:** the widget renders subagent name, current activity, elapsed time. No emojis, no exclamation marks, lowercase plain text. Honors Kevin's style constraints from CLAUDE.md.

**Fallback:** if not in Cowork mode, Level 2 is a no-op. Level 1 text narration is the only visible signal. No degradation message, the user sees normal Level 1 behavior.

**Open questions for Level 2:**
1. Should widgets persist across the full orchestration or close immediately at phase end? (Recommendation: close at phase end, log to ledger for retrospection.)
2. Should subagents emit progress percentages, or is current-activity sufficient? (Recommendation: current-activity only. Percentages imply linear progress that orchestration does not have.)
3. Should Tár's widget show the full dependency graph for the compound flow, or only the current phase? (Recommendation: full graph, with the current phase highlighted. Helps the user see what is coming.)

---

## Level 3 design (orchestration ledger)

**Location:** `.dznr/orchestration.log` in the project root. JSON Lines format. One event per line.

**Event schema (proposed):**

```json
{"ts": "2026-05-28T14:23:01Z", "type": "phase_open", "phase": 2, "subagent": "snape", "summary": "Brand layer, in sequence"}
{"ts": "2026-05-28T14:23:01Z", "type": "subagent_open", "subagent": "snape", "narration": "Wealth-management posture, then..."}
{"ts": "2026-05-28T14:23:15Z", "type": "skill_invoke", "subagent": "snape", "skill": "brand-from-scratch"}
{"ts": "2026-05-28T14:24:02Z", "type": "mcp_call", "subagent": "snape", "mcp": "figma", "tool": "get_design_context"}
{"ts": "2026-05-28T14:24:48Z", "type": "subagent_close", "subagent": "snape", "narration": "Brand foundation locked..."}
{"ts": "2026-05-28T14:24:48Z", "type": "phase_close", "phase": 2, "subagent": "snape", "summary": "Brand foundation locked"}
```

**Adopter use cases:**
- Per-project orchestration history (read the ledger to see what happened on the last run)
- Debugging tools (find the phase where Tár dispatched the wrong subagent)
- Analytics (most-used subagents, longest-running phases, skill invocation patterns)
- Regression tests for the Evolution Protocol (assert phase sequence and skill invocation against expected pattern)

**Privacy:** the ledger lives in the project repo. It is not transmitted anywhere. Adopters add `.dznr/orchestration.log` to `.gitignore` by default if they prefer not to commit it; the ledger pattern documents this in adopter guidance.

**Open questions for Level 3:**
1. Should the ledger be append-only, or should it rotate per run? (Recommendation: append-only with run boundaries marked by a `run_start` and `run_end` event. Easier for analytics.)
2. Should narration text be captured verbatim or truncated? (Recommendation: verbatim. The ledger is the source of truth for what users saw.)
3. Should user-facing prompts (Tár's clarifying questions) be captured? (Recommendation: yes, with the user's response. Helps debugging when clarification went sideways.)

---

## Acceptance criteria

For v1.14.0 to ship:

1. Level 3 ledger writes from all eight subagents on phase open, phase close, skill invocation, MCP call, and narration.
2. Level 2 widgets render in Cowork mode for at least Tár, Sherlock, Snape. Other subagents follow in subsequent patches.
3. Level 1 narration continues to function unchanged.
4. Adopter documentation in `docs/INSTALLATION.md` explains the ledger location, the `.gitignore` recommendation, and how to disable Level 2 widgets if not desired.
5. Regression test against the v1.13.0 live test scenario produces a readable ledger entry for every observed narration.

---

## Out of scope for v1.14.0

- Custom user-defined widget styles (Level 2 widgets render in the DZNR default style only; theming is a v1.15 candidate)
- Per-subagent ledger filtering (filtering happens in adopter tooling, not in the ledger writer)
- Real-time ledger streaming to external endpoints (a webhook adopter could build this against the ledger, not DZNR core)
- Replacing collapsed-dispatch architecture with expanded Task-tool dispatch (a separate proposal, not a visibility concern)

---

## Industry impact

None. Visibility is industry-neutral. The industry posture system continues to work as documented; the ledger captures industry tags as part of subagent context but does not change posture logic.

---

## MCP impact

Visibility infrastructure does not call MCPs. It observes MCP calls made by subagents and writes them to the ledger.

---

## Failure modes

**Ledger write failure:** subagent continues, narration continues at Level 1. Ledger failure is non-blocking. A single warning surfaces in the text stream noting the ledger could not be written.

**Cowork widget render failure:** Level 2 falls back to Level 1 silently. No user-facing degradation message; the orchestration continues.

**Disk space exhaustion from append-only ledger:** the ledger is plain text and small per event. A typical orchestration generates kilobytes, not megabytes. Adopters who run thousands of orchestrations rotate the file manually or via a cron job. Documentation notes the recommendation.

---

## Decision

PROPOSED. Awaiting Kevin's review of the three open questions per level (six total). After review, status moves to APPROVED, implementation phases get tasks created, and the work ships under v1.14.0.

The v1.13.0 cycle should close before v1.14.0 begins. Level 1 alone is a usable feature; Levels 2 and 3 add fidelity but are not blockers for the headline visibility commitment Kevin made in this session.

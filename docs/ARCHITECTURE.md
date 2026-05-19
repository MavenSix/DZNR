# DZNR Architecture

For the visual architecture, open [DZNR_architecture.html](./DZNR_architecture.html) in a browser.

## High-level flow

```
User → User Request → DZNR Agent → Tár (orchestrator)
                                     ↓
                ┌────────────────────┴────────────────────┐
                ↓                                          ↓
         6 active subagents                          Snake Eyes
   (Snape, Sherlock, Gibson,                  (parked specialist,
    Neo, Morpheus, Gandalf)                     called by name only)
                ↓
         Skills + Gandalf calls + Snape clarifications
                ↓
            Artifacts
```

## Cast (7 active + 1 parked)

See `agents/` folder for each subagent's definition.

| Character | Subagent | Skills |
|-----------|----------|--------|
| Tár | Orchestrator | 8 |
| Snape | Brand & Design Systems + Clarifier | 32 |
| Sherlock | Discovery & Research | 22 |
| Gibson | Experience Eng + AI Product | 19 |
| Neo | Delivery & Code | 24 |
| Morpheus | Pitch & Story | 19 |
| Gandalf | Workshop (peer + tool) | 38 |
| Snake Eyes | Specialist Arsenal (parked) | ~55 |

## Routing system

The routing system is documented across 5 files in `routing/`:

- **TRIGGERS.md** — keyword maps per subagent
- **CHAINS.md** — multi-subagent chain decision trees + compound request handling
- **SHARED_SKILLS.md** — disambiguation matrix for shared skills
- **FAILURE_MODES.md** — 6 failure categories with response protocols
- **SUBAGENT_ROSTERS.md** — full skill rosters per subagent

## Evolution

The architecture is not frozen. New MCPs, skills, and subagents can be added via the 5-step Evolution Protocol documented in `governance/EVOLUTION.md`.

## Stress testing

22 stress tests live in `tests/STRESS_TEST.md`. They get re-run whenever routing changes via CI (`scripts/validate-routing.sh`).

# Contributing to DZNR

DZNR is owned by Kevin Williams. Changes follow the Evolution Protocol in `governance/EVOLUTION.md`.

## Quick rules

- **Architecture changes** (routing, cast, chains): Kevin only.
- **Skill additions / MCP integrations:** team can propose, Kevin approves.
- **Workshop skill modifications:** Kevin only.
- **Documentation fixes:** anyone via PR.

## How to propose a change

1. Read `governance/EVOLUTION.md` first.
2. Use the proposal template at `.github/ISSUE_TEMPLATE/change-proposal.md`.
3. Open a GitHub Issue with the proposal.
4. Wait for Kevin's review (target: within 1 week).
5. If approved, make a PR with the changes.
6. CI runs routing validation. If it passes and Kevin signs off, it gets merged.

## What's in scope

- Adding a new MCP (e.g. Mobbin, Pencil.dev)
- Adding a new plugin to a subagent's roster
- Modifying a workshop skill
- Adding new disambiguation rules to SHARED_SKILLS.md
- Adding new stress tests to STRESS_TEST.md
- Documentation improvements

## What's out of scope (proposal-only, never merged without Kevin)

- Changing the cast (8 characters)
- Changing chain structure
- Changing the failure-mode playbook protocols
- Renaming subagents
- Removing Snape's clarifier role

## CI requirements

Before submitting a PR, run:

```bash
./dznr/scripts/validate-routing.sh
```

If validation fails, fix the issue before submitting.

## Style guide

- Markdown docs use second-level headings (## ...) for main sections
- Code blocks specify language (```bash, ```json, etc.)
- Skill names in code formatting (`skill-name`)
- Character names capitalized (Tár, Snape, Sherlock, etc.)

## Questions?

Open a GitHub Issue with the `question` label, or message Kevin directly.

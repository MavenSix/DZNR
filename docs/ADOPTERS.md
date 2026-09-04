# DZNR for Adopters

DZNR was built for Kevin Williams' design and AI product practice. It's also built so other designers, design teams, and practitioners can fork it for their own work. This document covers what's universal in DZNR, what's Kevin-specific, and how to make it yours.

If you're kicking the tires and not sure whether to fork, start with [GETTING_STARTED.md](./GETTING_STARTED.md). If you're committed to running DZNR for your own practice, read on.

## Honest framing

DZNR is opinionated. The opinions come from real practitioner work, not from theoretical purity. Some of what you'll find in the routing files, agent prompts, and workshop skills reflects Kevin's specific way of working. None of that is meant to constrain you; it's meant to give you a concrete starting point that already holds up under scrutiny.

What's universal:

- The eight-subagent cast structure (Tár, Snape, Sherlock, Gibson, Neo, Morpheus, Gandalf, Snake Eyes)
- The ten architectural patterns (mode determination, industry posture, four-lens, per-claim attribution, etc., documented in [ARCHITECTURE.md](./ARCHITECTURE.md))
- The routing system shape (TRIGGERS, CHAINS, SHARED_SKILLS, FAILURE_MODES, SUBAGENT_ROSTERS, INDUSTRIES, MCPS)
- The Evolution Protocol for adding changes
- The MCP integration framework
- The Innovation Accelerator chain as one example of an inverse-orchestration skill pack

What's Kevin-specific (substitute or extend):

- Gandalf's 44-skill workshop (Kevin's personal craft accumulated over years)
- The 8-industry posture profiles (you can extend, prune, or rewrite per your practice)
- The Innovation Accelerator methodology (Kevin's signature client engagement; you may have your own)
- The specific Snake Eyes specialist clusters (some are Kevin-relevant like Adobe; some are parked capability like Bio Research)
- Particular routing decisions logged in Kevin's project memory files (those are Kevin's projects)

The architecture is the gift. The content is the example.

## Pre-fork checklist

Before forking DZNR, decide:

1. **Will you run DZNR alone or as a team?** DZNR is built for solo practitioners and small teams (2-5 people). The Evolution Protocol assumes someone (you, or a designated lead) signs off on architecture changes.

2. **What's your domain?** DZNR's eight subagents are designed for design, AI product, and experience engineering work. If your practice is heavily different (pure research, pure operations, pure legal), some subagents will be parked capability for you, and you may want to add or replace clusters.

3. **What's your workshop?** Gandalf carries Kevin's personal craft (44 skills). You will substitute your own. The architecture of Gandalf (peer + tool + orchestrator modes) transfers; the specific skill list does not.

4. **What industries do you serve?** DZNR ships with nine industries. You may need to add some (real estate, energy, telecom, etc.) or prune some you do not serve.

5. **What MCPs do you use?** DZNR documents nine MCP integrations. You may have proprietary internal tools, niche integrations, or different design tools to wire in.

## Fork and customize

### Step 1: Fork the repo

```bash
# Clone Kevin's repo as a starting point
git clone https://github.com/MavenSix/DZNR.git
cd DZNR
git remote rename origin upstream
git remote add origin git@github.com:[yourname]/[your-dznr-fork].git
git push -u origin main
```

You now have your own copy. Upstream remote lets you pull future updates from Kevin's version if you want.

### Step 2: Substitute Gandalf's workshop

Gandalf's workshop lives at `skills/workshop/`. The 44 skills there are Kevin's. Your move:

**Option A: Start from scratch.**
- Back up Kevin's workshop somewhere safe
- Empty `skills/workshop/` (keep the `innovation-accelerator/` subdirectory if you want to keep that methodology; otherwise remove it too)
- Add your own workshop skills
- Update `agents/gandalf/AGENT.md` to reflect your roster (the categorized skill table is in his prompt)

**Option B: Layer on top of Kevin's.**
- Keep Kevin's skills as a reference set
- Add your own alongside
- Update `agents/gandalf/AGENT.md` to add your skills to the categorized table

**Option C: Hybrid.**
- Keep the skills you actually use from Kevin's workshop
- Remove the ones you don't
- Add your own
- Update the prompt accordingly

In all three cases, run `./scripts/sync-workshop.sh` after to symlink `~/.claude/skills` to your updated `skills/workshop/`.

### Step 3: Customize industry posture

The industry system lives in `routing/INDUSTRIES.md`. Eight industries across four clusters. Your move:

- Read each profile. Some will fit your practice cleanly; some won't.
- Add industries you serve that aren't listed (real estate, energy, telecom, sports, etc.). Use the template structure (aesthetic defaults, tone defaults, research weights, compliance considerations, pitch vocabulary).
- Prune industries you don't serve, OR leave them as "parked capability" the same way Kevin leaves Bio Research and Legal parked.
- Update Sherlock's `identify-industry` inference signals if you've added new industries.

The industry posture system is referenced by Snape, Sherlock, Gibson, and Morpheus. After changes, walk through their AGENT.md files and verify the references hold.

### Step 4: Customize specialist clusters (Snake Eyes)

Snake Eyes carries seven specialist clusters: Bio Research, Legal, Product Tracking, Operations, Adobe Creativity, SearchFit SEO, Data Analytics.

- Keep the clusters that fit your practice
- Remove or de-prioritize the ones that don't
- Add new clusters if you have specialist needs not covered (e.g., scientific computing, education, journalism)
- Update `agents/snake-eyes/AGENT.md` to reflect your cluster list

Each cluster has explicit invocation patterns. The SEO cluster is the one soft-route exception. If you want to soft-route a different cluster (e.g., legal for legal-heavy teams), update `routing/TRIGGERS.md` accordingly.

### Step 5: Add or remove MCPs

MCP integration framework: `routing/MCPS.md`. Per-MCP specs in `routing/mcps/`.

- Read existing specs (Figma, Pencil, Adobe, Blender, Magic Patterns, Mobbin, Higgsfield, workspace cluster, deployment cluster)
- Keep the ones you use
- Remove the ones you don't (move to `routing/mcps/deprecated/` if you want to preserve history)
- Add specs for MCPs you use that aren't documented. Use `routing/mcps/_template.md` as the starting point.

After changes, update the "Currently documented MCPs" section in `routing/MCPS.md`.

### Step 6: Tune the subagent prompts (optional)

Each subagent's prompt at `agents/[name]/AGENT.md` has architectural decisions baked in:

- Snape's pushback-with-reasoning posture (one pushback per decision, then execute and log deviation)
- Gibson's mandatory four-lens check on AI product work
- Neo's hard validation loops with no override on Layer 1 or Layer 2
- Sherlock's confirm-before-auto-run on rebuild language
- Morpheus's per-claim source attribution
- Gandalf's tri-mode dispatch determination

These are practitioner-grade reliability rules. You can soften them, but the system loses some of its trust properties when you do. Soften deliberately, not casually.

If you want to change subagent character (different archetypes, different voices), the framing is in the Archetype and Communication Style sections of each AGENT.md. Architectural decisions live in their own sections and should stay even if the voice changes.

### Step 7: Customize routing decisions

The routing files in `routing/` are Kevin's defaults. Some you may want to change:

- TRIGGERS.md: keyword maps per subagent. Add triggers specific to your practice's vocabulary.
- CHAINS.md: chain decision trees. The six chains may fit your work; you may need to add a seventh (e.g., a Research Synthesis chain that's heavier than Chain 1).
- SHARED_SKILLS.md: disambiguation matrix. Adjust based on which skills you have in multiple rosters.
- FAILURE_MODES.md: six failure categories and recovery protocols. These hold up across practices; rarely needs change.
- SUBAGENT_ROSTERS.md: full skill rosters. Update to reflect your additions, removals, and substitutions.

After changes, regenerate `routing/SUBAGENT_ROSTERS.md` and walk through each subagent's AGENT.md to verify roster references match.

### Step 8: Regression test

DZNR has 30 stress tests in `tests/STRESS_TEST.md`. Your move:

- Read through the tests. Some will still pass with your customizations; some may not because they reference Kevin's specific decisions.
- Adjust tests that reference Kevin-specific content
- Add new tests for your customizations
- Run `./scripts/validate-routing.sh` to check routing doc integrity

The stress test suite is your regression net. Adopt the same discipline Kevin uses: when you change routing, re-walk the tests.

### Step 9: Update version and stability

Update `.claude-plugin/plugin.json`:
- `version`: pick your own versioning (start from 1.0.0)
- `description`: rewrite to reflect your practice
- `stability`: "alpha" until you've kicked the tires on real work, then "beta", then "stable"
- `author`: your details

### Step 10: Commit your fork

Standard git workflow. Tag your first version and document the change in your fork's CHANGELOG.

## Pulling upstream updates

If you want to pull Kevin's future updates into your fork:

```bash
git fetch upstream
git checkout main
git merge upstream/main
# resolve conflicts (probably in agents/gandalf/AGENT.md and routing/INDUSTRIES.md where you've made changes)
git push origin main
```

Conflicts will mostly be in the files you customized (Gandalf's workshop, industry profiles, Snake Eyes clusters). Architectural changes from Kevin (new patterns, new chains, new MCPs) will merge cleanly because they touch files you probably haven't customized.

## Common adopter patterns

### Pattern 1: Solo design practice (similar to Kevin's)

- Keep most of the cast as-is
- Replace Gandalf's workshop with your own design craft
- Adjust industries based on the verticals you serve
- Remove Bio Research and possibly Legal from Snake Eyes if you don't use them
- Keep Adobe, SEO, Data Analytics if you do

Expected fork delta: ~20-30% of files modified, mostly Gandalf's workshop and industry-specific content.

### Pattern 2: Small design team (2-5 designers)

- Same as solo, plus:
- Pick a team lead who handles Evolution Protocol approvals
- Decide whose workshop becomes the team workshop (or build a hybrid)
- Document team conventions in a TEAM.md file
- Consider adding a project memory template specific to your team's project shape

Expected fork delta: ~30% of files modified.

### Pattern 3: Practitioner in adjacent domain (research, ops, content)

- Keep Tár and Snake Eyes; they're domain-neutral
- Possibly remove Snape, Gibson if your work isn't visual or experiential
- Possibly add a new subagent for your primary domain (e.g., a Research Lead subagent for pure researchers)
- Heavily customize Snake Eyes clusters for your specialist work
- Industry posture may need significant rewrites for your domain

Expected fork delta: ~50% of files modified. Architectural patterns transfer; content changes significantly.

### Pattern 4: AI product team

- Keep Gibson; he's the AI product specialist
- Lean heavily on the mandatory four-lens check
- Possibly remove Snape if you're product-team-internal without brand work
- Customize Neo for your specific platform (web vs mobile vs backend services)
- Industry posture matters less; user research weights matter more

Expected fork delta: ~30-40% of files modified.

## Honest limits

DZNR is built for Claude Code. Other Claude surfaces (web, mobile app, Claude API directly) may not support the plugin format DZNR depends on. If you want DZNR-style routing in a non-Claude-Code surface, you'll need to adapt.

The 30 stress tests are documented but the full test suite execution is currently manual. Automating stress test execution is on the roadmap.

The architecture HTML diagram at `docs/DZNR_architecture.html` predates several Phase 3 additions. A refresh is planned.

DZNR is beta. The cast is complete, the architectural patterns are proven across the cast, but real adopter usage will surface friction we haven't seen yet. Expect bumps; report them via the issue tracker.

## Getting help

- Read [ARCHITECTURE.md](./ARCHITECTURE.md) for the patterns
- Read the AGENT.md file for any subagent you're customizing
- Read [routing/CHAINS.md](../routing/CHAINS.md) before changing chain structure
- Read [governance/EVOLUTION.md](../governance/EVOLUTION.md) before making major changes

If you're stuck, open an issue on the upstream repo (Kevin's MavenSix/DZNR) with the `adopter-question` label. Kevin will respond when he can.

## Welcome

You're forking a system that took a lot of design decisions to land at practitioner grade. The decisions are documented; the trade-offs are explicit; the architectural patterns are protected. Make it yours, ship real work with it, and let us know what you learn.

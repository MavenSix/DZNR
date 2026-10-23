---
name: cheetara
description: "Worldbuilding subagent. Owns the QKI (Quantum Kinetic Ink) cluster: engine, three generators (character, place, object), and the shared asset manifest contract, and the author-world engine for worlds an author wrote. Resolves the engine first: QKI only for a named QKI pack, an author world for everything else. Enforces the Prime Gate (QKI) and the Fidelity Gate (author worlds) ruthlessly. Coordinates MidJourney, Higgsfield, Weavy, and Blender MCP for serialized-world asset generation."
character: Cheetara
archetype: fast, precise, sensor-based warrior
version: 1.7.0
status: production
---

# Cheetara

**Archetype:** fast, precise, sensor-based warrior

## Quick info

- **Definition:** [AGENT.md](./AGENT.md)
- **Roster:** see `routing/SUBAGENT_ROSTERS.md`
- **Triggers:** see `routing/TRIGGERS.md`
- **Chains:** see `routing/CHAINS.md`

## To invoke

Use `@dznr:cheetara:cheetara` in Claude Code to invoke directly, or just describe what you need to DZNR. Tár will route automatically on worldbuilding-shaped requests.

## Domain

QKI (Quantum Kinetic Ink) worldbuilding, author-world worldbuilding (an author's novel rendered in the medium the author chose), and the style, world-pack, series-bible and motion-clip stages of DZNR's video, narrative and Pulse OS workflows.

She resolves the engine before anything else. A job that names a QKI pack runs QKI, unchanged. Work for an author (a Pulse OS job, or anything not naming a QKI pack) is an author world: `author-world-authority` drafts the pack from the manuscript, the author approves it, and the Fidelity Gate holds every render to the pack's medium and the author's canon, which `lore-engine` builds, checks and keeps. She never falls back to QKI for someone else's world.

On a Pulse OS job the author is in Pulse OS, so that is where they answer: canon questions are written to `lore/questions.json`, the drafted pack awaits `lore/pack-approval.json`, workflow checkpoints go through DZNR OS's checkpoint endpoint, and the job ends with the questions summarised in its final answer. She never asks mid-run, and never asks Kevin for the author.

Four QKI skills:

- `qki-style-authority` (the engine, read first on every asset)
- `qki-character-generator`
- `qki-place-generator`
- `qki-object-generator`

Plus the shared `qki-asset-pipeline/asset-manifest-schema.md` contract (the seam between generation and assembly), which records the engine and pack each asset was made under.

One author-world skill (workshop folder, added 2026-10-21):

- `author-world-authority` (the engine for an author's world, read first on every author-world asset; the three generators serve both engines)

One lore skill (workshop folder, added 2026-10-21):

- `lore-engine` (an author's canon in the project's `lore/` folder: a graphify lore graph, `canon.json`, a cited `world-bible.md`, a consistency check that asks the author numbered questions instead of guessing, and the author's `rulings.md`; runs before `author-world-authority` drafts a pack)

Five more, shared with Snape and Gibson, for the stages she owns beyond QKI:

- `aesthetic-system` (style frames)
- `immersive-experience-design` (series bible)
- `brand-from-scratch` and `ds-theming` (world packs)
- `seedance-director` (motion clips)

And twelve installed on 2026-10-15, shared with Gibson:

- `wan-video-prompts` (Wan 3.0 shot briefs for motion clips)
- the ten `threejs-*` skills (a world in the browser)
- `threeui-catalog` (ready ThreeUI components)

Five more on 2026-10-23, for the quality bar (Kevin: "the quality has to be legendary and I'm not there yet"):

- `legendary-standard` (the method: she owns the hero, lock, series, clips, canon micro-detail and finish steps)
- `quality-gate` (after the Fidelity Gate or the Prime Gate, never instead)
- `style-library` (style options offered to an author in the pack draft, never imposed)
- `prompt-architecture` (every prompt; series locks)
- `immersive-world-site` (a world's plates and canon for a Pulse OS world site)
- `midjourney-legendary` (v2.21.0: every Midjourney V8.2 prompt, Edit Model series, video beats; Kevin's srefs only where the engine or the author's pack calls for them)

## Status

Production v1.0.0. Shipped in v2.0.0 (ninth subagent, first cast expansion since Snake Eyes shipped in v1.11.0). See `CHANGELOG.md` for shipping history.

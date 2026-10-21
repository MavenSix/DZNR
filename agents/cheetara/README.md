---
name: cheetara
description: "Worldbuilding subagent. Owns the QKI (Quantum Kinetic Ink) cluster: engine, three generators (character, place, object), and the shared asset manifest contract, and the author-world engine for worlds an author wrote. Resolves the engine first: QKI only for a named QKI pack, an author world for everything else. Enforces the Prime Gate (QKI) and the Fidelity Gate (author worlds) ruthlessly. Coordinates MidJourney, Higgsfield, Weavy, and Blender MCP for serialized-world asset generation."
character: Cheetara
archetype: fast, precise, sensor-based warrior
version: 1.3.0
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

She resolves the engine before anything else. A job that names a QKI pack runs QKI, unchanged. Work for an author (a Pulse OS job, or anything not naming a QKI pack) is an author world: `author-world-authority` drafts the pack from the manuscript, the author approves it, and the Fidelity Gate holds every render to the pack's medium and the author's canon. She never falls back to QKI for someone else's world.

Four QKI skills:

- `qki-style-authority` (the engine, read first on every asset)
- `qki-character-generator`
- `qki-place-generator`
- `qki-object-generator`

Plus the shared `qki-asset-pipeline/asset-manifest-schema.md` contract (the seam between generation and assembly), which records the engine and pack each asset was made under.

One author-world skill (workshop folder, added 2026-10-21):

- `author-world-authority` (the engine for an author's world, read first on every author-world asset; the three generators serve both engines)

Five more, shared with Snape and Gibson, for the stages she owns beyond QKI:

- `aesthetic-system` (style frames)
- `immersive-experience-design` (series bible)
- `brand-from-scratch` and `ds-theming` (world packs)
- `seedance-director` (motion clips)

And twelve installed on 2026-10-15, shared with Gibson:

- `wan-video-prompts` (Wan 3.0 shot briefs for motion clips)
- the ten `threejs-*` skills (a world in the browser)
- `threeui-catalog` (ready ThreeUI components)

## Status

Production v1.0.0. Shipped in v2.0.0 (ninth subagent, first cast expansion since Snake Eyes shipped in v1.11.0). See `CHANGELOG.md` for shipping history.

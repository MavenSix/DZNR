---
name: cheetara
description: "Worldbuilding subagent. Owns the QKI (Quantum Kinetic Ink) cluster: engine, three generators (character, place, object), and the shared asset manifest contract. Enforces the Prime Gate ruthlessly. Coordinates MidJourney, Higgsfield, Weavy, and Blender MCP for serialized-world asset generation."
character: Cheetara
archetype: fast, precise, sensor-based warrior
version: 1.0.0
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

QKI (Quantum Kinetic Ink) worldbuilding. Four skills:

- `qki-style-authority` (the engine, read first on every asset)
- `qki-character-generator`
- `qki-place-generator`
- `qki-object-generator`

Plus the shared `qki-asset-pipeline/asset-manifest-schema.md` contract (the seam between generation and assembly).

## Status

Production v1.0.0. Shipped in v2.0.0 (ninth subagent, first cast expansion since Snake Eyes shipped in v1.11.0). See `CHANGELOG.md` for shipping history.

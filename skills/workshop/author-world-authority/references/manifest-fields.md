# Manifest Fields for Author Worlds

The asset manifest (`qki-asset-pipeline/asset-manifest-schema.md`) stays the one seam between generation
and assembly, for QKI worlds and author worlds alike. One project has one manifest. An asset record says
which engine and which pack it was made under, so the assembly half, the gates and the Pulse OS export can
tell them apart without guessing.

---

## Fields an Author-World Record Adds or Reads Differently

```yaml
asset:
  engine: qki | author-world     # absent means qki, so every existing QKI record keeps its meaning
  world_pack: pack-id            # the QKI pack or the author world pack that was active
  pack_version: int | null       # author worlds: the approved pack version the asset was made under
  faction: string | null         # author worlds: the pack's group name
  motion_state: ... | null       # QKI's seven states; null for an author world unless qki: true
  motion: string | null          # author worlds: the motion language used, for clips and live scenes
  layer: L1 | L2-4 | composite | final   # final = a finished render from a 3d-real or photographic pack

  canon_refs: [string]           # the passages the asset portrays, and any rulings it depends on
  gate: prime | fidelity | both  # which gate it passed; both for a qki: true author pack

  style:
    qki_version: string | null        # QKI records, and author packs with qki: true
    authority_version: string | null  # author-world records
    medium: string | null             # the pack's medium the asset was made in
    mj_srefs: [{code, weight}]        # if MidJourney: the pack's own srefs, never the QKI anchor unless qki: true
    mj_profile: string | null
    mj_sw: int | null
```

Everything else in the record (id, name, type, intent, source_tool, status, human_gate, paths, identity,
links, created, notes) is unchanged.

## Status Under an Author World

The lifecycle is the same. Two meanings shift:

- `approved` means the asset passed the Fidelity Gate (and the Prime Gate too, for `qki: true`).
- `awaiting_human` also covers an asset waiting on an open canon question; `notes` names the question.

## Node Records

Character, location and object nodes keep their shape and add `engine`, `pack_version` and `canon_refs`.
`palette_inherit: faction` reads as the group under an author world. `motion_signature` holds the pack's
motion language rather than the seven states, unless the pack opted into QKI.

## For the Pulse OS Export

`pulse-os-artifacts` s7 maps every record to a Pulse core entity. `canon_refs` is what makes the passage
citations its exit criteria ask for; `engine` and `world_pack` say which style each Asset was made in.

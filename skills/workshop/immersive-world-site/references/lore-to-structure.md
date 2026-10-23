# Lore to structure: the canon-to-site map

Reads `lore/canon.json` (shape in `lore-engine/references/canon-schema.md`), `lore/rulings.md` and
`lore/rulings.json`, `lore/questions.json`, and the approved `lore/world-pack.md`. Writes the site plan
as `site/plan.md` in the project folder, every element citing the canon entry it renders.

## Elements

| Site element | Reads | Rule |
|---|---|---|
| Thesis line | the author's text (a passage the author wrote) or the pack's logline | Quote the author or use a line the author approved; cite the passage |
| District or chapter | `place` entities, `event` timeline order | Districts for a geography-led book, chapters for an arc-led one; the author chooses when unclear |
| District map, minimap | `place` relations (adjacent, inside, visible from) | Geography from canon only; Blender MCP Layer 1 block when distances matter |
| Character dossier | `character` attributes with passages; the identity lock | Epithet and bio in the author's words or approved paraphrase; age at the reader's current point in the story |
| Portrait | the identity lock (Higgsfield Soul Character, `--oref`, reference elements) | Fidelity Gate on the canon look, then `quality-gate` |
| Relic | `object` attributes; the micro-detail sheet | Materials and markings from the text; an unknown marking is a canon question, not an invention |
| Faction badge and colour | `group`, the pack's group palette | Within the pack palette; never a new hue |
| HUD readouts | `rule` entities, world mechanics in the brief | A readout must state a rule the text gives ("the tide covers the ward twice a day") |
| Time labels | `event` dates, the timeline | "17 YEARS AGO" only when the canon fixes the interval |
| Ambient sound | the pack's sound field | Off by default; the pack's palette of sounds only |
| Keepsake | the pack and the thesis | A thing from the world (a sigil, a ticket, a map fragment), set in the type layer |
| Locked content | `questions.json` entries with `status` open or deferred; the reader's position from Pulse OS | Hold the element; show nothing invented; unlock when ruled or reached |

## Spoilers

When Pulse OS supplies the reader's position, an element whose canon first appears after that position is
locked, shown as a closed district or a sealed dossier with no detail. Without a position, show only what
the first chapters establish, and say so in the site plan.

## Order of approval

1. The author approves the pack (as today).
2. The site plan's spatial model and element list go to the author with the pack or at a checkpoint; on a
   Pulse OS job through Pulse OS (checkpoint endpoint or `pack-approval.json`), never mid-run.
3. Plates render; Fidelity Gate, then `quality-gate`.
4. Neo builds; `quality-gate` on the built site (F14 respect controls, budget).

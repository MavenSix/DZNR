# pack.md template

Copy into the job's folder (or the project's asset-manifest group) at Step 1 and fill as the steps run.
A field left empty at Step 12 is a gate failure for the step that owns it.

```markdown
# Pack: {PACK_NAME}

World: {DZNR own | author world: {PACK.name} v{pack_version}, approved {date} | QKI: {pack} | client: {brand}}
Taste source: {kevin-taste | author-world-authority pack | qki-style-authority | client brand system}

## 1. Thesis
{One sentence.}
- Palette rule it implies: {...}
- Framing rule it implies: {...}
- Copy rule it implies: {...}

## 2. Reference lock
- Style entries: {style-library/references/<style>.md, ...}
- Heritage anchor: {e.g. Braun 1968; a 1999 Sony that never shipped}
- Lock: {sref code + --sw | Flux style id | Higgsfield Soul Character id | reference element ids | hero plate path}

## 3. Palette
| Token | Name | Hex | Where it is allowed |
|---|---|---|---|
| ground | {name} | #{hex} | backgrounds |
| surface | {name} | #{hex} | cards, sets |
| ink | {name} | #{hex} | type |
| metal or secondary | {name} | #{hex} | materials |
| signal | {name} | #{hex} | {the one element that carries meaning} |
| alarm (UI only) | {name} | #{hex} | errors only |
Sampled from: {subject or plate}

## 4. Hero
- Approved: {path}, {tool and model}, {prompt id}
- Candidates generated: {n}; kept: 1

## 5. Series
| Frame | Variable changed | Path |
|---|---|---|

## 6. Type layer
- Display face: {suggestion, licence checked by Snape}
- Label face: {mono or neutral}
- Layout file: {Figma or Pencil link, or code path}

## 7. Staging
- {frame path}: {device or set, light}

## 8. Motion beat
- {clip path}, {tool: wan3 | seedance | kling | live}, {seconds}, brief: {path}

## 9. Micro-detail
| Text | Where it appears | Source |
|---|---|---|

## 10. Finish
- Upscaled with {tool} to {resolution} before motion: {yes}
- Grade, grain, lens: {values}

## 11. Curation
- Kept: {n} of {n}; reject reasons by failure mode: {AI sheen: n, loose palette: n, ...}

## 12. Gate
- Fidelity Gate / Prime Gate: {pass | n/a}
- quality-gate scorecard: {path}, result {SHIP | REWORK | KILL}
```

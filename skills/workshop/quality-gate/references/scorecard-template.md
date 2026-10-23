# Scorecard template

Write one per asset (or one per pack, with a row per asset). Keep it beside `pack.md`, or as the
`quality_gate` field of the asset's manifest record.

```markdown
# Quality gate: {asset or pack name}

Date: {YYYY-MM-DD}    Run by: {agent}    World: {DZNR own | author world {pack} v{n} | QKI {pack} | client {brand}}
Upstream gate: {Fidelity Gate pass, pack v{n} | Prime Gate pass | n/a}
Taste reference: {kevin-taste | author pack | qki-style-authority | client system}

## Failure checklist
| # | Failure | Result | Evidence |
|---|---|---|---|
| F1 | AI sheen | pass / FAIL | {what was seen, where} |
| F2 | Loose palette | | {hue count; hexes found} |
| F3 | No type layer | | |
| F4 | Model-made lettering | | |
| F5 | Illustration smoothed in motion | n/a unless a drawn plate moves | |
| F6 | Meaningless spectacle | | {the three-second reading} |
| F7 | No micro-detail | | |
| F8 | No staging | | |
| F9 | Generic composition | | |
| F10 | Default lighting | | |
| F11 | Identity drift | | |
| F12 | Depth gimmick | | |
| F13 | Outline strokes (DZNR chrome only) | n/a outside DZNR UI | |
| F14 | Respect controls (sites only) | | |

UI and sites: critique {summary}, polish {summary}, fixing-accessibility {summary}.

## Scores
| Dimension | Score | Evidence (one sentence) |
|---|---|---|
| Concept | | |
| Craft | | |
| Finish | | |
| Originality | | |
| Legibility of meaning | | |
| Series coherence | | |
| **Total** | /30 | |

## Result
{SHIP | LEGENDARY | REWORK | KILL}
Next action: {the named fixes, who applies them, or "ship"}
Rework count on this asset: {n}
```

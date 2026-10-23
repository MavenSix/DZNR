# Bento Grid

**In one line:** one fixed grid of tiles where each tile holds exactly one idea, so the skeleton stays constant while art direction (type, palette, material, backdrop) carries the brand.

**Family:** Kevin's list.
**Exemplified by:** @pxdx.baddies (the same three-box bento restyled in seven brand worlds, each pulling card colours from its backdrop; and the BUSHI game loadout), @atsmatrix (a strict five-column HUD strip of ledger bars, radar, heatmap, sparkline and a spend gauge), hyliox.io (the included-features cards with lime hairline illustrations), @jtansill (the dark agent-monitor left column).

## Use it when / not when

- **Use when:** a product has several distinct facts to show at once (features, stats, a loadout, a dashboard summary), a style must be swapped across brands on one skeleton, or a DZNR OS view needs a glanceable overview.
- **Not when:** the content is a single story that needs sequence (use chapters), tiles would be filled with filler to complete the grid, or every tile shouts. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** 2 to 6 tiles; one hero tile at 2x the area of any other; spans on a 12-column grid (8 plus 4, 4 plus 4 plus 4, 6 plus 6); 16px or 24px gaps, equal everywhere; one idea and one number or image per tile; one CTA for the whole grid.
- **Palette (neutrals plus one signal, sampled from the backdrop or hero image):**

| Role | Name | Hex |
|---|---|---|
| Ground | Greige | #C9B8A0 |
| Tile | Off-white | #EDEDEB |
| Tile dark | Charcoal | #2B2B2D |
| Ink | Graphite | #1E1E1F |
| Secondary | Stone | #8A8174 |
| Signal | Sun disc | #E39B6B (sample from the hero image) |

- **Materials:** depends on the world chosen; tiles are either solid sampled fills or 20 percent frosted blur over a backdrop; imagery inside tiles is cropped to the tile, never letterboxed.
- **Light:** if tiles contain renders, one light direction across every tile so the grid reads as one picture.
- **Type pairing (suggestions):** one display face with personality per world (an extended wide like Unbounded, a condensed like Barlow Condensed, a blackletter, a thin serif like Editorial New) plus one neutral text face (Inter Display, Satoshi) or a mono for numbers.
- **Motion:** one beat: tiles stagger in 60ms apart on first view, or one hero tile loops a 3 to 5 second object motion. Hover lifts 4px.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Identical tiles in a uniform 3x3 | One hero tile at double area; vary spans |
| Tiles filled with lorem or icons to complete the grid | Remove the tile; fewer tiles is fine |
| Each tile a different palette | Sample all tile colours from one backdrop or hero |
| Two ideas in one tile | Split or cut |
| Uneven gaps and radii | One gap, one radius, set as tokens |
| Every tile animated | One beat for the grid |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Interface design shot of a bento grid of {TILE_COUNT} rounded tiles on a {GROUND_COLOUR} field, one large hero tile containing {HERO_IMAGE}, smaller tiles holding {TILE_CONTENTS: one idea each}, all tile colours sampled from the hero image, {DISPLAY_TYPE_STYLE} for one huge number, 24px radii, even gaps, soft shadows, one {SIGNAL_COLOUR} accent, flat front-on view, crisp --ar 16:10 --style raw --s 100 --v 7 --no clutter, gradients, emoji --sref {SREF_CODE} --sw {100-200}
```

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a front-on interface image: a grid of {TILE_COUNT} rounded tiles with equal gaps on a {GROUND_COLOUR} background. The biggest tile shows {HERO_IMAGE}. Each other tile holds one thing only: {TILE_CONTENTS}. All tile colours come from the hero image. One accent colour, {SIGNAL_COLOUR} ({SIGNAL_HEX}), appears once. Leave tile text areas blank: no writing.
```

Series line: attach the approved grid and say "Same grid, same spans, same gaps and radii. Change only {ONE_VARIABLE: the world (backdrop, palette, display face) | the hero tile image}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 6-second, 16:10 image-to-video clip from the attached still, flat interface motion. Preserve the grid, every tile's position, colour and contents exactly; no tile moves out of its cell. At 0-2 seconds the camera holds front-on. At 2-4 seconds only the hero tile animates: {HERO_LOOP, e.g. the bird beats its wings twice}. At 4-6 seconds the hero settles and one number in a small tile counts up to {VALUE}. Sound: a soft ambient pad and one quiet tick on the final number. No camera move, no added text.
```

### UI or web section (structured brief)

```text
Build statement: a feature bento section, {TILE_COUNT} tiles, {WORLD_NAME} art direction, {STACK}.
Tokens: Ground "{GROUND_NAME}" {GROUND_HEX}, Tile "{TILE_NAME}" {TILE_HEX}, Tile dark "{DARK_NAME}" {DARK_HEX}, Ink {INK_HEX}, Signal "{SIGNAL_NAME}" {SIGNAL_HEX}, radius 24px, gap 16px, tiles separated by fill plus a soft two-layer shadow (0 1px 2px rgba(0,0,0,0.06), 0 8px 24px rgba(0,0,0,0.08)), no outline strokes.
Type: display {DISPLAY_FACE} at clamp(56px, 9vw, 160px) for the one hero number; tile titles {TEXT_FACE} 600 20px; labels {MONO_FACE} 11px uppercase tracking 0.12em.
Layout: max width 1280px, 12 columns; hero tile spans 8 columns by 2 rows; tiles 2 to {N} span 4 columns by 1 row; mobile: one column, hero first, gap 16px.
Copy: hero "{HERO_NUMBER} {HERO_UNIT}"; tiles "{TITLE_1}: {ONE_LINE_1}", "{TITLE_2}: {ONE_LINE_2}"; one CTA "{CTA}".
Device (one): tiles stagger in on first view, 60ms apart, translateY(16px) to 0 and opacity, 500ms cubic-bezier(.32,.72,0,1).
Accessibility: grid order equals reading order in the DOM; AA contrast per tile; reduced motion shows tiles at rest.
Performance: tile images AVIF sized to the span, lazy below the fold, CLS under 0.05 with reserved aspect ratios.
```

### 3D / Three.js scene note

A bento rarely needs WebGL. If one hero tile carries a live object, render a single small canvas inside that tile only (`threejs-fundamentals`, pause when off screen with `threejs-production-hardening`) and keep other tiles as HTML. For a HUD-style strip (the @atsmatrix pattern) check `threeui-catalog` for gauge and chart components first.

## Gate notes

`quality-gate` checks hardest on: one idea per tile, one hero tile, tile colours sampled from one source, consistent gaps and radii, one motion beat. Point to `high-end-visual-design` for the "Asymmetrical Bento" layout archetype and its mobile collapse rules; this entry adds the world-swapping method (fixed skeleton, swappable art direction).

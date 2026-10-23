# Glassmorphism

**In one line:** frosted, refractive panels floating over a rich backdrop, where the glass shows depth by what it blurs and bends, never by a glow.

**Family:** Kevin's list.
**Exemplified by:** @pxdx.baddies (the SAFE-CORE slide: frosted cards over a quilted grey satin pillow with gold studs, a giant "57%"), @danielsnows (the translucent glass brain with floating glass stat cards), hyliox.io (a chrome-and-glass asterisk with thin-film iridescent fringes that re-forms on scroll), and Kevin's visionOS-style spatial panels saved to his Interface board.

## Use it when / not when

- **Use when:** there is a backdrop worth seeing through (a photograph, a 3D render, a material set), data must float over a world without hiding it (a stat card over a hero object), a spatial or headset interface is being imagined, or a product needs a "lens" metaphor (security, vision, clarity).
- **Not when:** the backdrop is flat or empty (glass over nothing is a grey box), text density is high (long reading on blur fails contrast), the target is low-end mobile (blur repaints on scroll), or the brief wants grit and wear. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** one hero backdrop or object fills the frame; two or three glass cards at the edges overlap it by 10 to 20 percent so the blur has something to bend; cards never stack more than two deep; one CTA.
- **Palette (neutrals plus one signal, sampled from the backdrop):**

| Role | Name | Hex |
|---|---|---|
| Ground | Obsidian | #0A0A0A |
| Glass fill | Frost 4 | rgba(255,255,255,0.04) |
| Glass edge | Hairline 10 | rgba(255,255,255,0.10) |
| Text | Warm white | #FAFAFA |
| Secondary text | Ash 64 | rgba(250,250,250,0.64) |
| Signal | Sampled accent | #D4FF4F (acid lime, or sample one hue from the backdrop) |

- **Materials:** frosted acrylic, milky polycarbonate with subsurface glow, thin-film iridescence only on edges (magenta and cyan fringes under 8 percent), quilted satin or brushed metal under the glass so blur reveals texture.
- **Light:** one soft area light top-left; the backdrop carries the colour; highlights live on the glass edge as a 1px inner line, not as bloom.
- **Type pairing (suggestions):** Geist or Satoshi for UI; Instrument Serif italic for one emphasis word; Geist Mono or JetBrains Mono for numerals on cards.
- **Motion:** one beat: a card tilts 3 degrees toward the cursor, or the backdrop drifts 2 percent under still glass so the refraction moves. Never animate the blur radius.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Glass over a flat gradient | Put a photograph, render or textured material behind every glass card |
| Purple and blue neon orbs as the backdrop | Sample the backdrop from the subject; one accent hex only |
| Low contrast text on blur | Raise fill to 12 to 20 percent or add a 60 percent scrim behind text; test AA |
| Rainbow iridescence everywhere | Iridescence on one edge or one hero object only |
| Blur on scrolling containers | Blur only fixed or sticky layers (high-end-visual-design guardrails) |
| Glow halos around cards | A 1px inner highlight and a soft tinted shadow instead |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
{HERO_OBJECT_OR_BACKDROP} behind two frosted acrylic panels, the panels blur and slightly refract the {BACKDROP_TEXTURE} behind them, 1px bright inner edge on each panel, faint thin-film iridescent fringe on one edge only, {GROUND_COLOUR} field, one {SIGNAL_COLOUR} accent, soft area light top-left, no glow, no neon, studio product photograph, 85mm, f/5.6 --ar {16:9 | 4:5} --raw --s 100 --v 8.2 --no bloom, lens flare, text --sref {SREF_CODE} --sw {100-200}
```

For Midjourney V8.2, the full set for this style (hero still, series variant, Edit Model instruction for the series, video beat and a filled example) is in `midjourney-legendary` (`references/library-styles.md`, Glassmorphism), with the parameter recipes and Kevin's sref library.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make an image of {HERO_OBJECT_OR_BACKDROP}. In front of it float two panels of frosted acrylic. Through the panels the {BACKDROP_TEXTURE} is visibly blurred and slightly bent. Each panel has a thin bright edge. Only one edge has a faint rainbow sheen. The background is {GROUND_COLOUR}. One thing is coloured {SIGNAL_COLOUR} ({SIGNAL_HEX}). One soft light from the upper left. No glowing halos, no neon. Leave the panels empty: no writing.
```

Series line: attach the approved frame and say "Same glass, same light, same backdrop texture. Change only {ONE_VARIABLE: panel position | backdrop crop | signal object}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 6-second, 16:9 image-to-video clip from the attached still, photographic studio film. Preserve the panels, their edges, the backdrop texture and the light exactly. At 0-3 seconds the camera makes one slow lateral move of 3 percent to the right, so the refraction through the glass shifts across the backdrop. At 3-5 seconds the front panel tilts 3 degrees toward camera and the inner edge catches the light. At 5-6 seconds hold. Sound: low room tone and one soft glass tick when the panel settles. No glow, no particles, no added text.
```

### UI or web section (structured brief)

```text
Build statement: one hero section with floating glass data cards over a full-bleed {BACKDROP}, {STACK}.
Tokens: Background "Obsidian" #0A0A0A, Glass "Frost" rgba(255,255,255,0.06), Edge "Hairline" inset 0 1px 0 rgba(255,255,255,0.12), Text "Warm white" #FAFAFA, Secondary rgba(250,250,250,0.64), Signal "{SIGNAL_NAME}" {SIGNAL_HEX}, radius 24px, glass recipe backdrop-filter blur(24px) saturate(140%).
Type: display Geist 600 at clamp(48px, 7vw, 120px), tracking -0.04em, one word in Instrument Serif italic; numerals Geist Mono 14px.
Layout: max width 1280px, 12 columns, 24px gap; cards span 4 columns, offset to overlap the hero object by 15 percent.
Copy: headline "{HEADLINE}"; card 1 "{METRIC} / {LABEL}"; card 2 "{METRIC} / {LABEL}"; CTA "{CTA}".
Device (one): cards tilt up to 3 degrees with the pointer (transform only, spring stiffness 120, damping 20).
Accessibility: every text pair AA against the worst-case backdrop pixel under it; scrim if not; 2px focus ring in the signal; prefers-reduced-motion and prefers-reduced-transparency swap glass for a solid #161616 fill.
Performance: blur only on the fixed card layer, never on scrolling content; backdrop AVIF under 250KB; LCP under 2.5s; CLS under 0.05.
```

### 3D / Three.js scene note

Glass is MeshPhysicalMaterial with transmission 1, thickness 0.5 to 1.5, roughness 0.15 to 0.3, ior 1.45, and iridescence 0.3 on the hero only (`threejs-materials`). It needs an environment map to refract (`threejs-lighting`, a studio HDRI) and something textured behind it. A morph on scroll (the hyliox asterisk pattern) lives in `threejs-animation`; keep transmission objects to one or two for frame budget and test with `threejs-production-hardening`. For the HTML cards over the scene, check `threeui-catalog` first.

## Gate notes

`quality-gate` checks hardest on: a real backdrop behind every glass element, contrast measured on the backdrop, one accent hue, no neon orb gradient. Point to `design-taste-frontend` for the "Liquid Glass" refraction recipe (1px inner border plus inner shadow) and to `high-end-visual-design` for the "Ethereal Glass" archetype and its blur performance guardrails; this entry adds what the glass must sit over.

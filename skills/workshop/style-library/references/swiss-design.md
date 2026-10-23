# Swiss Design

**In one line:** an objective grid, one grotesk in few weights, flush-left ragged-right text, and geometric masks, so order itself is the beauty and the content is the only decoration.

**Family:** Kevin's list.
**Exemplified by:** An Improbable Future's studio site (Helvetica Neue bold, one weight, about three sizes, black on white, a 44px left margin; the objects carry all the colour), @vnarshia (the TP-7 concept: light grey, one record red, circle and quarter-arc masks, "worth recording." in sentence case with a full stop), @designchapel (the Wipeout tribute: a persistent centred logotype and tracked-out caps credits over every shot, in the Designers Republic lineage).

## Use it when / not when

- **Use when:** information must be clear and the brand values precision, the imagery is strong and needs a frame that does not compete, a design system needs a rational base, or a poster or credit system must repeat across many frames.
- **Not when:** the brief wants warmth, softness or ornament, the copy is long marketing prose, or the grid would be imposed on content that has no structure. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** a visible or implied modular grid (12 columns, or 6 for posters); flush-left ragged-right; asymmetric balance with large empty fields; circles and quarter-circles as masks; numbering as structure (01, 02); one alignment axis per page.
- **Palette (neutrals plus one signal):**

| Role | Name | Hex |
|---|---|---|
| Paper | White | #FFFFFF |
| Paper (soft) | TE grey | #F2F2F2 |
| Mid grey | Concrete | #CFCFCF |
| Ink | Black | #000000 |
| Signal | Swiss red | #E8322A |
| Signal (alt) | Burnt orange | #C4562E |

- **Materials:** none in the layout; flat colour, no shadow, no texture. Imagery supplies material.
- **Light:** flat. The photography inside may be product-studio or archive daylight.
- **Type pairing (suggestions):** Helvetica Neue, Neue Haas Grotesk or Akzidenz-Grotesk alone, in two weights; optionally a mono (Söhne Mono) for data. A named Helvetica-class choice here is deliberate: `high-end-visual-design` and `design-taste-frontend` ban Helvetica and Inter as unconsidered defaults, and that ban does not apply when Swiss is the chosen style.
- **Motion:** one beat: a circle clip-path mask grows from a corner (600ms cubic-bezier(.7,0,.2,1)), or a repeated tagline field scrolls behind the product. Nothing bounces.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Centred everything | Flush-left on one axis; centre only a persistent logotype |
| Four typefaces | One grotesk, two weights |
| Drop shadows and gradients | Flat fills only |
| Grid ignored by one element | Snap every element; break the grid once, on purpose, with the hero |
| Red used for decoration | Red only on the one action or the one alert |
| Tiny type everywhere for "refinement" | Three sizes with real contrast: statement, text, caption |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Swiss International Style poster photograph composition: {HERO_OBJECT} photographed on {GROUND_COLOUR} seamless, cropped by a perfect circle mask at the top right, large empty white field occupying the left half for typography, flat even light, no shadow, one {SIGNAL_COLOUR} element, strict geometric balance --ar 2:3 --raw --s 50 --v 8.2 --no gradient, glow, texture, text --sref {SREF_CODE} --sw {100-200}
```

For Midjourney V8.2, the full set for this style (hero still, series variant, Edit Model instruction for the series, video beat and a filled example) is in `midjourney-legendary` (`references/library-styles.md`, Swiss Design), with the parameter recipes and Kevin's sref library.

Set all type by hand on the grid afterwards.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a poster image: {HERO_OBJECT} on a plain {GROUND_COLOUR} background, seen through a perfect circle cut-out in the upper right. The left half is empty white space, kept for type. Flat even light, no shadows, no gradients. Only one element is coloured {SIGNAL_COLOUR} ({SIGNAL_HEX}). Do not add any writing.
```

Series line: attach the approved poster and say "Same grid, same mask geometry, same ground and light. Change only {ONE_VARIABLE: the object | the mask shape (circle, quarter-arc, half-circle) | the signal}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 6-second, 16:9 image-to-video clip from the attached still, flat graphic motion over a photographic object. Preserve the object, the ground colour and the empty type field exactly. The camera is locked. At 0-2 seconds only a small quarter-circle of the object is visible through the mask. At 2-4 seconds the circle mask grows from the corner to reveal the whole object, eased, no overshoot. At 4-6 seconds hold. Sound: silence, then one dry click as the mask completes. No added text, no camera move.
```

### UI or web section (structured brief)

```text
Build statement: one Swiss product or statement section, {STACK}.
Tokens: Paper "White" #FFFFFF or "TE grey" #F2F2F2, Ink "Black" #000000, Secondary "Concrete" #6B6B6B (AA on paper), Signal "{SIGNAL_NAME}" {SIGNAL_HEX} on one element only, radius 0, no shadows.
Type: Neue Haas Grotesk Display 700 at clamp(48px, 8vw, 140px), leading 0.95, tracking -0.03em, sentence case with a full stop; text 500 at 18px/1.45, max 56ch; captions 400 11px; three sizes total.
Layout: max width 1440px, 12 columns, 24px gap, 44px left margin on mobile; statement spans columns 1 to 9, flush left; object image spans 7 to 12 behind a circle mask.
Copy: statement "{STATEMENT, e.g. 'worth recording.'}"; caption "{OBJECT_NAME} / {SPEC}"; nav of five words at 11px.
Device (one): circle clip-path reveal from the bottom-right corner, 600ms cubic-bezier(.7,0,.2,1), triggered once in view.
Accessibility: the reveal never hides text; reduced motion shows the mask fully open; AA contrast; focus ring 2px black with 2px offset.
Performance: one font family, two weights, subset; no JS needed beyond an IntersectionObserver; LCP under 2.0s, CLS under 0.05.
```

### 3D / Three.js scene note

Swiss pages seldom need 3D. When an object must turn, use an orthographic camera (no perspective distortion), flat lighting with no visible shadow, and a single 90 degree rotation on scroll (`threejs-fundamentals`, `threejs-animation`). Keep the grid and type in HTML.

## Gate notes

`quality-gate` checks hardest on: one typeface, three sizes, one alignment axis, every element on grid, red used once, no shadow. Point to `industrial-brutalist-ui` (its Swiss Industrial Print mode) for heavier, data-dense variants and to `typeset` for the scale.

# Maximalism

**In one line:** abundance with a spine: big type, layered objects, saturated colour and texture at full volume, all still serving one governing idea and one legible point.

**Family:** Kevin's list.
**Exemplified by:** @danielsnows ("GREEN NOT BORING": a stacked sandwich on teal with distressed condensed type; "Strawlicious": a milkshake splash over a giant cream serif), @bywaviboy (the Hewlett-style animated short: acid green, brick orange, mustard on near-black, kinetic words slammed on the beat), the NEON ORIAN hero on neon-oiran.aura.build (a biomechanical portal, a reactor core and a huge Didone title).

## Use it when / not when

- **Use when:** the brand is loud by nature (food, music, fashion drops, games), the audience must be stopped mid-scroll, a launch needs spectacle, or a story world is itself maximal.
- **Not when:** the user must read, compare or decide carefully, the brand trades on calm or trust (finance, health), or there is no governing idea to hold the abundance together. Spectacle without a readable point collects "AI slop" comments (a top comment on @atsmatrix's reel). On an author world it is an option to offer, never a default; Kevin's own taste leans to restraint in the chrome, so for DZNR's work keep maximalism inside the object or the hero.

## Signature cues

- **Composition:** a hero object overlapping a giant display word; three depth layers (type behind, object middle, particles or crumbs in front); type bleeding off the edges; diagonal energy; but one focal point and one CTA.
- **Palette (saturated, still limited to four, sampled from the subject):**

| Role | Name | Hex |
|---|---|---|
| Ground | Deep teal | #0F5C5A |
| Primary | Acid green | #7BC043 |
| Secondary | Brick orange | #D9532B |
| Tertiary | Mustard | #E0B13A |
| Ink | Near-black | #111111 |
| Paper | Cream | #F4E6CF |

- **Materials:** food and liquid at macro (splash, drip, crumb), ink and halftone, print grain, distressed type, stickers and decals.
- **Light:** hard and graphic: a strong key with defined shadows, or flat cel colour; never washed-out soft light.
- **Type pairing (suggestions):** a distressed condensed (Druk Condensed, Anton with texture) or a fat cream serif (Recoleta, Cooper Black revival) or a Didone (Bodoni Moda) at 200 to 300px, with one neutral sans (Gabarito, Satoshi) for UI.
- **Motion:** one hard beat: words slam in on the beat with hard cuts, or the object loops a 3 to 5 second splash. Animate on twos for illustration (12fps) to keep the grit.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Everything loud, nothing read | Name the one thing read first; scale it 2x everything else |
| Colours from everywhere | Four hues, all sampled from the subject |
| Spectacle with no point | One governing idea, stated in the headline |
| Texture smoothed away in motion | Keep linework and grain; animate on twos; upscale before animating |
| Unreadable type over busy imagery | Type behind the object, or a solid band behind text |
| Five CTAs | One |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
{HERO_OBJECT} exploding into frame at a diagonal, {MACRO_DETAIL: splash, crumbs, flying ingredients} frozen mid-air, saturated {GROUND_COLOUR} background, a huge {DISPLAY_STYLE} word shape behind the object partly hidden by it, hard key light with crisp shadows, print grain, palette of {HEX_1}, {HEX_2}, {HEX_3} only, high-end advertising photograph, 50mm --ar 4:5 --raw --s 250 --v 8.2 --no extra colours, watermark --sref {SREF_CODE} --sw {150-300}
```

For Midjourney V8.2, the full set for this style (hero still, series variant, Edit Model instruction for the series, video beat and a filled example) is in `midjourney-legendary` (`references/library-styles.md`, Maximalism), with the parameter recipes and Kevin's sref library.

Leave the word as a blank shape or remove it, and set the real display word by hand; models garble large type.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a bold advertising image of {HERO_OBJECT} bursting into frame at an angle, with {MACRO_DETAIL} frozen in the air around it. Background: saturated {GROUND_COLOUR}. Use only these colours: {HEX_1}, {HEX_2}, {HEX_3}. Hard light with crisp shadows and a little print grain. Leave a big clear area behind the object where a giant word will go. No writing.
```

Series line: attach the approved frame and say "Same palette, same light, same angle of energy, same grain. Change only {ONE_VARIABLE: the product flavour | the flying detail}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 5-second, 9:16 image-to-video clip from the attached still, high-speed advertising film. Preserve the object, the palette, the grain and the empty word area exactly. At 0-1 second hold the frozen splash. At 1-3 seconds time resumes: {MACRO_DETAIL} arcs past camera, the camera makes one fast push-in of 10 percent. At 3-5 seconds everything settles and the object rests in the centre. Sound: a liquid whoosh, a bass hit at 1 second, then silence for the last half second. No added text, no colour drift.
```

For illustration: "2D hand-drawn, animate on twos at 12fps, preserve the ink linework and flat colour, no smoothing."

### UI or web section (structured brief)

```text
Build statement: one launch hero with a type-behind-object lockup, {STACK}.
Tokens: Ground "{GROUND_NAME}" {GROUND_HEX}, Primary "{P_NAME}" {P_HEX}, Secondary "{S_NAME}" {S_HEX}, Paper "Cream" #F4E6CF, Ink "Near-black" #111111, Signal is the CTA colour {CTA_HEX}; four hues maximum.
Type: display {DISPLAY_FACE} uppercase at clamp(120px, 24vw, 360px), leading 0.8, bleeding 5 percent off both edges; UI {TEXT_FACE} 16px.
Layout: full-bleed; three layers: display word (z 1), hero object cut-out PNG or video (z 2), foreground particles (z 3); nav is one row of four links at 14px; one CTA bottom centre.
Copy: display "{DISPLAY_WORD}"; sub "{ONE_LINE_POINT}"; CTA "{CTA}".
Device (one): the object loops a 4-second motion (WebM with alpha, poster frame first).
Accessibility: the display word is real text; sub and CTA sit on a solid band at AA; the loop pauses on reduced motion and has a pause control.
Performance: hero loop under 1.5MB, lazy particles, LCP under 2.5s (poster as LCP), CLS under 0.05.
```

### 3D / Three.js scene note

Keep spectacle to one system: an instanced particle burst (`threejs-geometry`, InstancedMesh), toon or flat shading for illustrated worlds (`threejs-shaders`, `threejs-materials`), bloom only if the world has emitted light (`threejs-postprocessing`). Cap particles for mobile and test with `threejs-production-hardening`.

## Gate notes

`quality-gate` checks hardest on: a stated governing idea, one focal point read first, hue count at four or fewer, legibility of the point, texture held in motion. Point to `bolder` for confident layout moves and `overdrive` used sparingly; `quieter` is the counterweight when a draft has lost its spine.

# Minimalism

**In one line:** one object, one line, one action, in a field of empty space, where every remaining element is there because removing it would break the meaning.

**Family:** Kevin's list.
**Exemplified by:** @juliendesigncraft (the notch utility film: a MacBook flush in a terrazzo wall under raking sun, two short centred lines, one interaction per shot), @jakymakey (the Replit output: black stage, one white device that explodes into parts, "The eye, assembled.", corner mono meta), @skvortsov.design (warm grey worlds with a single amber light; white plastic with safety orange).

## Use it when / not when

- **Use when:** the product or idea is strong enough to stand alone, a feature needs to be shown one interaction at a time, quiet states in DZNR OS (empty, done, waiting), or a presentation film must feel premium.
- **Not when:** the content is genuinely dense and must be compared at once (use a bento or a table), the idea is not yet sharp (minimalism exposes a weak idea), or the brief asks for energy and abundance. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** one subject occupying 15 to 35 percent of the frame; 60 percent or more negative space; one headline of up to six words; one CTA; corner meta labels as the only secondary text.
- **Palette (neutrals plus one signal):**

| Role | Name | Hex |
|---|---|---|
| Ground (light) | Warm grey | #D9D9D7 |
| Ground (dark) | Stage black | #000000 |
| Surface | Graphite glass | #2A2C31 |
| Text | White | #FFFFFF |
| Secondary | Mid grey | #8E8E8C |
| Signal | Amber light | #F2B65A |

- **Materials:** terrazzo, pale timber, anodised aluminium, matte glass; one material per scene.
- **Light:** raking natural light with slow window shadows, or a single soft key on black; light is the decoration.
- **Type pairing (suggestions):** SF Pro or Inter Display in regular and light (line one regular, line two light, as the notch film does); a mono (Geist Mono) for corner meta at 11px.
- **Motion:** one beat per shot: a notch morphs on a spring (response 0.35, damping 0.8), a part separates, a light moves across the wall. 2 to 3 second holds. No music hype.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Empty but generic (white page, grey text, nothing to look at) | One subject of real craft, lit with intent |
| Several CTAs "just in case" | One action |
| Thin grey text at low contrast | Secondary text AA at minimum |
| Minimalism with no idea | Write the one sentence the frame says; cut until only that remains |
| Many small animations | One beat per shot |
| Stock-looking hero | Stage it: a wall, a light, a material |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
{SUBJECT} set into {SETTING: a warm terrazzo wall | a black stage}, {MATERIAL}, small in frame with vast empty space around it, {LIGHT: raking late-afternoon sunlight with soft window shadows | one soft key from above}, one {SIGNAL_COLOUR} light source, architectural photography, 35mm, f/8, calm, restrained --ar 16:9 --raw --s 50 --v 8.2 --no clutter, props, text, glow --sref {SREF_CODE} --sw {100-200}
```

For Midjourney V8.2, the full set for this style (hero still, series variant, Edit Model instruction for the series, video beat and a filled example) is in `midjourney-legendary` (`references/library-styles.md`, Minimalism), with the parameter recipes and Kevin's sref library.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a calm photograph of {SUBJECT} in {SETTING}. It is small in the frame, with lots of empty space around it. The only decoration is the light: {LIGHT}. Use one material for the setting: {MATERIAL}. One small {SIGNAL_COLOUR} ({SIGNAL_HEX}) light or detail. Nothing else in the frame. No writing.
```

Series line: attach the approved frame and say "Same setting, same light direction and time of day, same lens and framing. Change only {ONE_VARIABLE: the state on screen | the subject's position by one third}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 6-second, 16:9 image-to-video clip from the attached still, photographic product film at 24fps. Preserve the subject, the wall, the material and the light exactly. The camera is locked off. At 0-2 seconds the window shadow drifts slowly across the wall. At 2-4 seconds {ONE_INTERACTION, e.g. the notch expands into a dark capsule} on a soft spring. At 4-6 seconds hold. Sound: quiet room tone and one soft UI tick. No music, no added text, no camera move.
```

### UI or web section (structured brief)

```text
Build statement: one hero section with a single object and a single line, {STACK}.
Tokens: Ground "Stage" #000000 (or "Warm grey" #D9D9D7), Text "White" #FFFFFF, Secondary "Mid grey" #9A9A98 (AA on black), Signal "{SIGNAL_NAME}" {SIGNAL_HEX} on the CTA only, no borders, no shadows except under the object.
Type: headline Inter Display 500 at clamp(48px, 9vw, 128px), tracking -0.04em; second line 300 weight; corner meta Geist Mono 11px uppercase tracking 0.14em.
Layout: max width 1280px; object centred at 40 percent viewport height; headline below at 12 columns; meta pinned to the four corners at 24px inset.
Copy: headline "{HEADLINE, up to six words}"; meta "OBJECT / {NN}", "{STUDY_LINE}", "SCROLL TO BEGIN"; CTA "{CTA}".
Device (one): {ONE_DEVICE, e.g. a scroll-scrubbed separation of the object into parts along their axes}.
Accessibility: reduced motion shows the final state still; AA contrast; one focusable CTA with a 2px signal focus ring.
Performance: hero render AVIF under 200KB or one WebGL object under 1.5MB; LCP under 2.5s; CLS under 0.05; 60fps on scrub.
```

### 3D / Three.js scene note

One object, one light, black or warm-grey ground, a shadow catcher, nothing else (`threejs-lighting`, `threejs-materials`). The one beat is scroll-scrubbed (`threejs-animation`, `threejs-interaction`): separation along assembly axes or a slow 30 degree turn. Harden with `threejs-production-hardening` and ship a still fallback.

## Gate notes

`quality-gate` checks hardest on: one subject, one line, one action, one beat, and a subject of enough craft to carry empty space. Point to `minimalist-ui` for the warm-monochrome document layout rules and `quieter` when a draft is shouting.

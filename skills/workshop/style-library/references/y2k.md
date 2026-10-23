# Y2K Aesthetic

**In one line:** the turn-of-the-millennium optimism of translucent plastic, frosted ice-blue shells, chrome and visible circuitry; at DZNR it means translucent tech, sober, not bubble kitsch.

**Family:** Kevin's list.
**Exemplified by:** @an_improbable_future (Sony handhelds and controllers in clear smoke plastic showing PCBs, a clear-acrylic Walkman-style player, Sony x Nike translucent controllers in frosted ice-blue with orange buttons, all on seamless white or in real places). Lineage: late-1990s translucent consumer electronics, iMac G3, Game Boy Color clear shells.

**Kevin's taste:** his taste read is retro-futurism without kitsch, and no Y2K bubbles. For DZNR's own work use the sober variant: Y2K as translucent tech, photographed like a product (see also `instrument-grade-product.md`). On an author world, offer the full bubble-and-chrome variant only if the author's pack wants it, as an option, never imposed.

## Use it when / not when

- **Use when:** a consumer device or wearable should feel playful but engineered, a story world is set around 1998 to 2003, a music or fashion drop wants nostalgia with finish, a game prop needs "lost hardware" believability.
- **Not when:** the brief is serious finance or health, the audience reads nostalgia as cheap, or the request is really for gradients and bubble fonts on a web page (that is the kitsch variant; push back for DZNR's work).

## Signature cues

- **Composition:** one object, three-quarter or top-down flat-lay on seamless white or pale ice; the translucent shell lit so internals read; pairs of still plus motion as @an_improbable_future posts them.
- **Palette (sober variant: clear plastic neutrals plus one signal):**

| Role | Name | Hex |
|---|---|---|
| Ground | Seamless white | #F4F5F6 |
| Shell | Frosted ice | #CFE3EC |
| Shell dark | Smoke | #6E747A |
| Internal | PCB green | #2F6B4F |
| Metal | Chrome | #C9CED3 |
| Signal | Button orange | #FF6A2B |

  Kitsch variant (author worlds that ask for it): bubblegum pink #FF8FD1, aqua #4FE3E8, chrome gradients.

- **Materials:** translucent polycarbonate with visible screws, ribbon cables and PCBs; frosted silicone grips; brushed chrome trim; LED status dots; printed micro-legends; a scuff or sun-fade where wear is wanted.
- **Light:** soft studio key with a backlight through the shell so it glows from inside (a light table effect), soft contact shadow; or flat overcast daylight in place.
- **Type pairing (suggestions):** a wide techno grotesk (Eurostile Extended, Microgramma, or Syncopate) for product marks; a clean mono (Space Mono, JetBrains Mono) for legends; never bubble fonts in the sober variant.
- **Motion:** a slow turntable rotation of 30 degrees showing internals, an LED blinking on, a hinged lid opening on a spring.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Bubble fonts, chrome gradients and sparkles on everything | Sober variant: the object carries the era; type and page stay quiet |
| Translucent shell with nothing inside | Name the internals: PCB, ribbon cable, screws, battery cell |
| Five candy colours | One shell tint plus one signal button colour |
| Pristine render, no story | One wear cue: a scuffed corner, a sun-faded label, a peeling sticker |
| Glow and lens flare to sell "futuristic" | Backlight through the shell instead; no flare |
| Generic "Y2K device" | Anchor it: "a 2001 handheld that never shipped", with a real-feeling model code |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the subject's canon; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Product catalogue photograph of {OBJECT}, a {YEAR} consumer device that never shipped, translucent {SHELL_COLOUR} polycarbonate shell showing the green PCB, ribbon cable and screws inside, frosted silicone grips, brushed chrome trim, one {SIGNAL_COLOUR} button, tiny printed legends, {WEAR_CUE}, three-quarter view on seamless white, soft key light and a backlight glowing through the shell, soft contact shadow, medium format, 80mm, f/11, fine grain --ar {4:5 | 1:1} --style raw --s 50 --no bubbles, sparkles, chrome gradient text, neon --sref {SREF_CODE} --sw {100-250}
```

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a product photo of {OBJECT}, as if made in {YEAR}. The case is clear {SHELL_COLOUR} plastic, so you can see the green circuit board, a ribbon cable and the screws inside. It has frosted rubbery grips and a thin chrome trim. Only one button is coloured: {SIGNAL_COLOUR} ({SIGNAL_HEX}). It has been used: {WEAR_CUE}. Put it on a plain white studio background. Light it from the front with a soft light, and from behind so the case glows a little. Soft shadow underneath. Everything sharp. No sparkles, no writing except tiny printed labels on the device.
```

For a series: attach the approved hero and say "Same shell material, same internals, same light. Change only {ONE_VARIABLE: the shell tint | the object type | the angle}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 6-second, {1:1 | 4:5} image-to-video clip from the attached still, photographic product film. Preserve the object, the translucent shell, every internal part, the legends and the white studio exactly. At 0-3 seconds the object turns 30 degrees on an unseen turntable, the backlight moving through the shell so the circuit board catches light. At 3-5 seconds a small status LED blinks on. At 5-6 seconds hold. The camera stays locked off. Sound: a quiet servo hum during the turn, one soft electronic chirp as the LED lights, room tone. No sparkles, no lens flare, no added text.
```

### UI or web section (structured brief)

```text
Build statement: one product drop section for {PRODUCT}, sober translucent-tech style, {STACK}.
Tokens: Ground "Seamless" #F4F5F6, Surface "Ice" #CFE3EC at 60 percent with backdrop-blur 16px (fixed header only), Ink #1C1F22, Secondary rgba(28,31,34,0.62), Metal "Chrome" #C9CED3, Signal "{SIGNAL_NAME}" {SIGNAL_HEX} (the buy button only), radius 20px, cards separated by fill and a soft two-layer shadow, no outline strokes.
Type: product mark Syncopate 700 at clamp(40px, 7vw, 112px), tracking 0.06em, uppercase; body Inter Tight 16px / 1.6; legends Space Mono 11px uppercase.
Layout: max width 1200px, 12 columns, 24px gap; product image spans columns 2 to 8, specs columns 9 to 12, section padding clamp(96px, 12vw, 160px).
Copy: mark "{PRODUCT_NAME}"; model line "{MODEL_CODE} / {YEAR}"; three spec rows "{SPEC}: {VALUE}"; CTA "{CTA_LABEL}".
Device (one): a 6-frame image sequence turns the object 30 degrees as the section scrolls through.
Accessibility: AA contrast on every pair, 2px focus ring in the signal colour, prefers-reduced-motion shows frame 1.
Performance: sequence frames AVIF at 1200px, total under 900KB, preload frame 1 only, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

MeshPhysicalMaterial for the shell with transmission 0.85, thickness 2, roughness 0.25 and an ice-blue attenuationColor; the PCB and parts as opaque meshes inside; an HDRI studio plus a rect area light behind for the glow-through (`threejs-materials`, `threejs-lighting`). Model in Blender MCP or start from Meshy or Tripo and rebuild the internals. A 30-degree scroll-scrubbed turn (`threejs-animation`, `threejs-interaction`); `threejs-production-hardening` because transmission is expensive: cap DPR at 1.5 on mobile.

## Gate notes

`quality-gate` checks this style hardest on: sober variant for DZNR work (no bubbles), visible internals, one signal colour, wear present, legends set by hand. See `instrument-grade-product.md` for the object discipline and `kevin-taste` for why kitsch fails his bar.

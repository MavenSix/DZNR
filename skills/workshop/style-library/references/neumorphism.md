# Neumorphism

**In one line:** controls moulded from the same soft surface they sit on, raised or pressed by paired light and shadow, used sparingly as tactile hardware rather than as a whole interface.

**Family:** Kevin's list.
**Exemplified by:** @pxdx.baddies (the BUSHI loadout: off-white cards with large radii, soft shadows, a black filled PLAY pill beside an outlined CHANGE, soft controls on a greige world). Lineage: Braun and Teenage Engineering moulded controls Kevin saves on his Tech and Sound boards.

## Use it when / not when

- **Use when:** a few physical-feeling controls are the point (a dial, a toggle, a transport bar, a pad grid), the surface is light and calm, and the product wants to feel like hardware.
- **Not when:** text and data dominate, the interface must pass contrast for every state, users rely on high contrast or forced colours, or the whole screen would become soft grey bumps. In DZNR OS product chrome, decision 218 rules: cards and pills separate by fill plus a soft two-layer shadow, with no outline strokes, and edges return only under Increase Contrast or forced colours. On an author world it is an option to offer, never a default.

## Signature cues

- **Composition:** a calm surface with three to seven moulded controls, each with one job; generous 32px or more around each; a single dark filled primary to anchor the eye.
- **Palette (neutrals plus one signal):**

| Role | Name | Hex |
|---|---|---|
| Surface | Bone | #EDEDEB |
| Highlight | Paper light | #FFFFFF |
| Shadow | Greige shade | #C9C4BC |
| Ink | Charcoal | #2B2B2D |
| Secondary ink | Stone | #8A8174 |
| Signal | Sun peach | #E8A27C (or one hue sampled from the subject) |

- **Materials:** matte injection-moulded ABS, soft-touch silicone, bead-blast aluminium knobs, felt.
- **Light:** one light source top-left at 135 degrees for every control, never mixed; raised = light shadow top-left plus dark shadow bottom-right; pressed = the same pair inset.
- **Type pairing (suggestions):** Satoshi or General Sans for UI; an extended display (Unbounded or Druk Wide) for one name or number, as BUSHI does; JetBrains Mono for values.
- **Motion:** one beat: a press sinks the control 1px with the shadow pair flipping to inset in 120ms; a dial rotates with detents.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Whole interface built of soft bumps | Mould only the controls; content sits flat on fill |
| Pressed and unpressed states indistinguishable | Pair the inset shadow with a fill change and a label or icon change |
| Text at 2:1 contrast on grey | Ink #2B2B2D on #EDEDEB (about 12:1); never grey on grey for text |
| Outline strokes added to rescue edges | Fill plus soft two-layer shadow (decision 218); edges only under Increase Contrast |
| Several light directions | One 135 degree light for every control |
| No primary | One dark filled pill as the anchor |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Top-down product photograph of {DEVICE_OR_PANEL}, a single moulded {SURFACE_COLOUR} matte ABS surface with {CONTROLS: each control and what it sets} raised from the same material, one control pressed in, soft light from the upper left, soft paired shadows, one {SIGNAL_COLOUR} {SIGNAL_PART}, printed legends in tiny grey sans, studio, 100mm, f/8 --ar 4:5 --style raw --s 50 --v 7 --no glossy, chrome, neon, text --sref {SREF_CODE} --sw {100-200}
```

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a top-down photograph of {DEVICE_OR_PANEL}. The whole top is one piece of soft matte {SURFACE_COLOUR} plastic. The controls are moulded out of that same surface: {CONTROLS}. One of them is pressed in. One light comes from the upper left, so each control has a soft light edge on that side and a soft shadow on the other. Only the {SIGNAL_PART} is coloured {SIGNAL_COLOUR} ({SIGNAL_HEX}). Do not add writing.
```

Series line: attach the approved frame and say "Same surface, same light angle, same lens. Change only {ONE_VARIABLE: which control is pressed | colourway | one control added}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create a 5-second, 1:1 image-to-video clip from the attached still, photographic product film. Preserve the surface, the controls, the light angle and the shadows exactly. The camera is locked off overhead. At 0-2 seconds hold. At 2-3 seconds a fingertip enters from frame right and presses the {CONTROL}; it sinks and its shadow turns inward. At 3-5 seconds the finger leaves and the {SIGNAL_PART} lights {SIGNAL_COLOUR}. Sound: a soft rubber press and a quiet click. No glow, no added text.
```

### UI or web section (structured brief)

```text
Build statement: one control panel section (a player, a mixer, a settings strip), soft moulded style, {STACK}.
Tokens: Surface "Bone" #EDEDEB, Raised shadow "-6px -6px 14px #FFFFFF, 6px 6px 14px #C9C4BC", Pressed "inset 4px 4px 10px #C9C4BC, inset -4px -4px 10px #FFFFFF", Ink "Charcoal" #2B2B2D, Secondary #6E675E (AA on Bone), Signal "{SIGNAL_NAME}" {SIGNAL_HEX}, radius 24px for cards, 999px for pills, no outline strokes.
Type: name in Unbounded 800 at clamp(32px, 5vw, 72px); UI in Satoshi 500 15px; values JetBrains Mono 13px.
Layout: max width 960px, 8 columns, 32px gap, panel padding 40px.
Copy: title "{TITLE}"; controls "{LABEL_1}", "{LABEL_2}", "{LABEL_3}"; primary "{PRIMARY_LABEL}" as the one dark filled pill.
Device (one): press feedback: shadow pair flips to inset and translateY(1px) in 120ms ease-out.
Accessibility: state never by shadow alone (aria-pressed plus a fill change); text AA; under prefers-contrast: more and forced-colors, a 1px edge returns; focus ring 2px in the signal with 2px offset.
Performance: shadows on static elements only; no box-shadow animation on scroll; CLS under 0.05.
```

### 3D / Three.js scene note

Mould the panel as one mesh with bevelled, filleted controls (Blender MCP, or `threejs-geometry` for simple extrusions); one directional key at 135 degrees plus a soft hemisphere fill (`threejs-lighting`); matte roughness 0.7 (`threejs-materials`). A press is a 1mm translate with a click sound (`threejs-interaction`). Check `threeui-catalog` for ready knob and toggle components before modelling.

## Gate notes

`quality-gate` checks hardest on: text contrast, distinguishable states without shadow, one light direction, and no outline strokes in DZNR OS chrome. Point to `fixing-accessibility` for the contrast and state audit and to `minimalist-ui` for the surrounding flat layout.

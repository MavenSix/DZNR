# Editorial Design

**In one line:** a page or frame laid out like a magazine spread: one governing idea, a characterful display face paired with a quiet text or mono face, imagery cropped with intent, and copy written in a voice.

**Family:** Kevin's list.
**Exemplified by:** @ovyonlabs (ASEMIC: "The body as terrain.", a high-contrast serif wordmark with mono spec text on circular paths), Kasane on aura.build by Aksonvady Phomhome (condensed caps with an italic serif second line, in-world copy), @danielsnows (FedEx concept with Unbounded headlines bleeding off the edge; Strawlicious with a giant cream serif behind the glass), @pxdx.baddies (KIRO: cream cards, a thin serif "HELLO", an arch-masked portrait).

## Use it when / not when

- **Use when:** the work has something to say (a thesis, a story, a campaign line), imagery is strong enough to crop hard, a brand needs a point of view, or a Pulse OS world needs chapter openers and dossiers.
- **Not when:** the interface is a dense tool for repeated tasks, the copy is not yet written (editorial with lorem fails), or the brand has no voice to give the headlines. On an author world it is an option to offer, never a default; the author's text is the copy.

## Signature cues

- **Composition:** a type-led spread: a display word at 200 to 300px set behind or beside one hero image, the image overlapping the letters; asymmetric grid with a wide margin column for captions; pull quotes with a 2px rule; numbered sections (01, 02).
- **Palette (neutrals plus one signal, from the image):**

| Role | Name | Hex |
|---|---|---|
| Paper | Bone paper | #F3EFE7 |
| Ink | Press black | #141414 |
| Secondary | Graphite 60 | rgba(20,20,20,0.60) |
| Night ground | Moss black | #121612 |
| Rule | Vermilion | #D2402B |
| Signal | Dusty mauve | #D8A9B7 (sample one hue from the hero image) |

- **Materials:** uncoated paper grain at 3 percent, photographic grain, fabric macro, real-world texture in the imagery; the page itself stays flat.
- **Light:** the photography's own; the layout adds none. Prefer natural or campaign light with a warm-cool split (sunset orange against snow blue in ASEMIC).
- **Type pairing (suggestions):** condensed display (Barlow Condensed, PP Neue Machina Condensed) with an italic text serif (Instrument Serif, Newsreader); or a high-contrast serif wordmark (Editorial New, Canela) with a mono (Söhne Mono, JetBrains Mono) for captions and specs; or a wide geometric (Unbounded) with a neutral UI face (Gabarito).
- **Motion:** one beat: the display word marquees slowly or bleeds in from the edge; or a pull quote resolves from blur to sharp. Hold everything else.

## Anti-patterns (each with its fix)

| Anti-pattern | Fix |
|---|---|
| Marketing filler copy ("Elevate your experience") | Write the real line in the brief; in-world or on-thesis |
| Two display faces fighting | One display, one text or mono |
| Image centred and uncropped | Crop past the edge; let the image break the type |
| Everything the same size | One size at 200px or more, captions at 11 to 13px, nothing between without reason |
| Italic serif on every word | One emphasis word per headline |
| Spread with no thesis | State the governing idea first; every crop and caption serves it |

## Templates

Slots are in braces. On an author world, every slot comes from the approved author world pack and the author's text; on DZNR's own work, from `kevin-taste`.

### Still: Midjourney

```text
Campaign photograph for {SUBJECT}, {THESIS_IMAGE: e.g. a faceless figure in a dusty-pink technical suit standing on a snowy ridge}, {LIGHT: blue hour with a burning orange horizon}, {COMPOSITION: subject in the lower third, large empty sky above for a headline}, muted palette with one {SIGNAL_COLOUR} element, medium format, natural light, crisp fabric texture, fine grain --ar 4:5 --raw --s 75 --v 8.2 --no text, logo --sref {SREF_CODE} --sw {100-250}
```

For Midjourney V8.2, the full set for this style (hero still, series variant, Edit Model instruction for the series, video beat and a filled example) is in `midjourney-legendary` (`references/library-styles.md`, Editorial Design), with the parameter recipes and Kevin's sref library.

Set the headline, wordmark and captions by hand afterwards (the type layer); never ask the model for them.

### Still: natural language (Nano Banana, Higgsfield)

```text
Make a campaign photograph of {SUBJECT}. The idea is "{THESIS}". Show {THESIS_IMAGE}. Light: {LIGHT}. Put the subject in the lower third and leave the top half as open sky or plain ground for a headline. Keep colours muted, with one element in {SIGNAL_COLOUR} ({SIGNAL_HEX}). Real texture, fine grain. No writing anywhere.
```

Series line: attach the approved frame and say "Same subject styling, same light, same lens and grain, same empty headline space. Change only {ONE_VARIABLE: location | pose | colourway}."

### Video beat (Wan via Runway, Seedance, Kling)

```text
Create an 8-second, 4:5 image-to-video clip from the attached still, photographic campaign film. Preserve the subject, wardrobe, light, grain and the empty headline area exactly. At 0-3 seconds wind moves the fabric and the subject is still. At 3-6 seconds the camera makes one slow push-in of 5 percent. At 6-8 seconds the subject turns their head a quarter away from camera and holds. Sound: wind across snow, fabric movement, one low tone at the turn. No added text, no colour shift.
```

### UI or web section (structured brief)

```text
Build statement: one editorial chapter section for {SUBJECT}, {STACK}.
Tokens: Paper "Bone" #F3EFE7, Ink "Press" #141414, Secondary rgba(20,20,20,0.60), Rule "{RULE_NAME}" {RULE_HEX} 2px, Signal "{SIGNAL_NAME}" {SIGNAL_HEX}, paper grain 3 percent on a fixed pointer-events-none layer.
Type: display {DISPLAY_FACE} uppercase at clamp(96px, 18vw, 300px), leading 0.85, tracking -0.02em; second line {SERIF_ITALIC} at clamp(32px, 4vw, 64px); captions {MONO_FACE} 11px uppercase tracking 0.14em; body {TEXT_FACE} 18px/1.6, max 62ch.
Layout: max width 1440px, 12 columns, 24px gap; display word spans 12 columns behind the image; image spans columns 4 to 11 and overlaps the word by 30 percent; caption column 1 to 3.
Copy: section number "{NN}"; display "{DISPLAY_WORD}"; italic line "{ITALIC_LINE}"; caption "{CAPTION}"; pull quote "{QUOTE}" with the rule.
Device (one): the display word marquees at 20px per second, pausing on hover and stopping under reduced motion.
Accessibility: the display word is real text (not an image) with aria-hidden on the duplicate marquee copy; AA on body; focus ring 2px Ink.
Performance: fonts subset and preloaded (two families, four styles maximum), font-display swap, hero AVIF under 250KB, LCP under 2.5s, CLS under 0.05.
```

### 3D / Three.js scene note

Editorial rarely wants a live scene; when it does, the 3D object sits in front of a DOM display word (the type-behind-object lockup) with a transparent canvas, one object, one slow rotation (`threejs-fundamentals`, `threejs-animation`). Keep the type in HTML for accessibility; use `threejs-postprocessing` only for grain matching the photography.

## Gate notes

`quality-gate` checks hardest on: a stated thesis, real copy with a voice, one display face plus one quiet face, a type layer set by hand, a crop that means something. Point to `typeset` for the pairing and hierarchy and to `high-end-visual-design` "Editorial Luxury" for paper tones and grain.

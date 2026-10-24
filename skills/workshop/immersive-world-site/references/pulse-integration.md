# How Pulse gets legendary

Kevin, 2026-10-23: "have Pulse access these legendary styles, prompts, and libraries so it can create
amazing experiences for authors." Pulse OS reaches all of it through the DZNR OS API (`api-v1.md` in the
DZNR OS repo). Nothing here needs Pulse to hold DZNR's skills: DZNR OS serves them.

## What Pulse calls

| Need | Call | What comes back |
|---|---|---|
| The author's style options | `GET /style-library` | every style an author may choose: id, name, family, one line, when to use and avoid it, palette, type pairing, motion, anti-patterns, exemplars |
| One style, with its prompts | `GET /style-library/:id` | the whole entry and its prompt templates by kind (`still_midjourney`, `still_natural`, `video`, `web`, `threejs`), each with its slot names, filled from the author's pack |
| Make something in the author's chosen style | `POST /jobs` with `style` (one id) or `styles` (a base and up to two accents) | a job; the choice goes to the agent or every stage, and is recorded in the author world pack |
| The full path, manuscript to experience | `POST /jobs` with `workflow: "pulse-os-artifacts"` | the lore pass, World Bible, pack (with the style offer), characters, places, scenes, assets, the knowledge base export and the walkthrough, each stage per `legendary-standard` |
| What waits for the author | `GET /projects/:project/questions` | open canon questions (with passages and a proposed answer), whether the world pack waits for a decision, and runs waiting at a checkpoint |
| The author's answers | `POST /projects/:project/answers` | recorded as rulings; rulings win over the text from then on |
| The author's pack decision | `POST /projects/:project/pack` | approve, or revise with a note (a new pack version) |
| The author's checkpoint answer | `POST /jobs/:id/checkpoint` | continue, revise or stop |
| Progress and outputs | `GET /jobs/:id` | status, `waiting`, `author_attention`, `styles`, `confidential`, outputs |

The lore pass (`lore-engine`) writes `lore/questions.json` and the pack `lore/world-pack.md`; the answer
endpoints write `lore/rulings.json`, `lore/rulings.md` and `lore/pack-approval.json` beside them, where
the next job reads them. No job asks mid-run: each ends with what waits for the author.

## What Pulse never gets (Kevin's private instruments)

- His Midjourney sref codes and his profile (`--p` / `--profile`). The style-library answers strip them
  from every field; a template's `--sref {SREF_CODE}` stays as a slot an author may fill with their own.
- His trained styles and LoRAs (`GET /styles` is Kevin's and is not for authors).
- `kevin-taste` and anything from the QKI skills.
- Spend approvals: a checkpoint that is about money, a job over its key's limits, or a tool's permission
  card is Kevin's, answered in DZNR OS (`409 not_at_checkpoint` if Pulse tries).

## What DZNR OS guarantees, and only this

Say these to an author in plain words, and nothing stronger (`legendary-standard/references/author-trust.md`, T4):

- Every job is confidential unless Pulse sends `"confidential": false`.
- A confidential job uses no aggregator (no RunningHub, no Higgsfield driver).
- The author's files go to the project's folder (`inputs/<job id>/`) and are inputs only: never listed
  among outputs or served back.

## What Pulse's own interface must do

The agents can hold every rule and still lose the author in the interface. Pulse's UI must:

1. **Show the passage.** Every asset, scene and district shown with the quoted passage it came from and
   its chapter, beside it, not behind a click.
2. **Let the author choose by seeing.** Offer the two or three styles as their option stills (s2), each
   with its one line; the author's pick goes back as `style`/`styles` or a pack decision. Offer the quieter
   text-led treatment as an equal option.
3. **Never show a half-finished or generic frame.** Show only what came back at SHIP; while a job runs,
   show the author's own words and real progress, not a draft, a placeholder or a stock image.
4. **Open on their world.** The first thing an author sees of DZNR's work is a plate of their world with
   their sentence, not a menu.
5. **Ask in their language.** Canon questions shown with the passages and the proposed answer, so
   answering is a choice, not homework; faces wait until the author settles them.
6. **Say how it was made.** A plain provenance note per asset (tools by name, made for this book, the
   three guarantees above).
7. **Let them remove anything,** and send the removal back as a revise or a ruling so it never returns.

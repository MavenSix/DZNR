# Running graphify for the Lore Engine

graphify is installed on both machines as a workshop skill (`~/.claude/skills/graphify/SKILL.md`, with
its `references/`) and as the `graphify` CLI from the `graphifyy` package. This file says which of its
commands the lore engine uses, with which options, and what graphify's real behaviour means for the
design. Everything here is as graphify's own SKILL.md and CLI help document it (graphify 0.9.63); nothing
is a flag graphify does not have.

---

## Where to run it

graphify writes `graphify-out/` in the **current working directory**, not beside the path it scans. Run
every command from the project's `lore/` folder with `corpus` as the path, so the graph lands at
`lore/graphify-out/` and never inside the corpus:

```
cd <project>/lore
```

The scan root is then `corpus`, and every node's `source_file` is relative to it
(`chapters/ch-003.md`). The engine prefixes `corpus/` when it writes a citation.

---

## The commands

| When | Command | What it does |
|---|---|---|
| First run on a project | `/graphify corpus --mode deep` | The full pipeline: detect, semantic extraction of every unit, build, cluster, label communities, `GRAPH_REPORT.md`, `graph.json`, `graph.html`, manifest for later updates |
| Every later run | `/graphify corpus --update --mode deep` | `detect_incremental` against the saved manifest; re-extracts only new or changed units, prunes deleted ones, merges into the existing `graph.json` |
| A subject's neighbourhood (canon pass) | `graphify explain "Ada Pruitt" --graph graphify-out/graph.json` | The node, its source file and every connection with its confidence tag. Free: no model call |
| How two subjects connect | `graphify path "Ada Pruitt" "Saltmarsh Light" --graph graphify-out/graph.json` | Shortest path, each hop with relation and confidence. Free |
| A broad lead | `graphify query "lighthouse keeper uncle" --graph graphify-out/graph.json` | BFS over the graph from matching labels (`--dfs` to follow one chain, `--budget N` to cap it). Free. Expand the words against the graph's own vocabulary first, as graphify's `references/query.md` requires |

`/graphify ...` is the graphify skill's pipeline, run by the host agent as its SKILL.md describes (Steps 1
to 9). `graphify explain`, `path` and `query` are the CLI and read `graph.json` only.

### Inside a DZNR OS run (the path that needs no approval)

A DZNR OS run, a Pulse OS job above all, has nobody to approve shell commands one by one, so graphify's
`/graphify` flow (its Python helper calls) cannot run there. DZNR OS allows exactly these graphify
commands, from the project folder (the run's working directory), with every path inside it (decision 236):

1. **Extract yourself.** Read the corpus and write the semantic extraction as graphify's extraction spec
   (`~/.claude/skills/graphify/references/extraction-spec.md`) describes, then write
   `lore/graphify-out/graph.json` in its node-link format (`nodes`, `links`, `file_type`, `relation`,
   `confidence`). With subagents, give each one a slice of the corpus, as graphify's Part B does. The
   manuscript is read by the session's own model only.
2. **Cluster and report with graphify, locally:**

   ```
   graphify cluster-only lore --no-label
   ```

   It reads `lore/graphify-out/graph.json`, runs community detection, and writes `GRAPH_REPORT.md` and
   `graph.html` beside it. `--no-label` is required: naming communities calls an outside model, and DZNR
   OS refuses `cluster-only` without it and any `--backend`. Name the communities yourself in the canon
   pass if they are worth naming.
3. **Look things up:** `graphify explain "X" --graph lore/graphify-out/graph.json`, and `path`, `query`
   and `diagnose multigraph` the same way.

Nothing else is allowed without a card: not `graphify extract`, `update`, `add`, `clone`, `watch` or
`install`, and no shell operators around the command. A later run re-extracts the changed corpus units
itself, merges them into graph.json, and runs `cluster-only` again.

### Options, and why

- **`--mode deep`** on every build and every update. graphify's extraction prompt tells deep mode to be
  aggressive with INFERRED edges and to mark uncertain ones AMBIGUOUS instead of omitting them. Prose
  states few relations outright, so the shallow default misses most of what a continuity check needs, and
  the AMBIGUOUS edges are an input to check (d). graphify's Step 3 reads `--mode deep` from each
  invocation, so it must be passed again with `--update`; an update without it extracts the new chapter
  shallow.
- **No `--directed`.** graphify's fixed relation vocabulary carries no fiction direction worth keeping, and
  the engine names relations itself from the passages. Whatever the first build used, every update must
  use the same: graphify's update docs warn that a mismatch rebuilds the graph the other way and collapses
  edges.
- **No export flags** (`--wiki`, `--obsidian`, `--neo4j`, `--svg`, `--graphml`, `--mcp`). The engine's
  outputs are canon.json and the bible. `graph.html` is made by default and is useful to Kevin for a look;
  it costs nothing.

### Steps the engine skips or overrides in graphify's own flow

- **Step 9's "offer to explore"** and **`save-result`**. graphify saves query answers into
  `graphify-out/memory/` so a later update extracts them as graph nodes. A question and answer about the
  canon is not canon, and must never enter the lore graph. The engine does not run `save-result` on it.
- **Step 2's corpus warning** (over 2,000,000 words or 500 files, where graphify asks which subfolder to
  run on and waits). A novel-scale corpus sits far under it: a few hundred units and a few hundred thousand
  words. A project that crosses it is voiced as a gap to Kevin. It is never narrowed to one subfolder
  silently, since a partial build of a smaller graph would also hit graphify's shrink guard (below).

### Without subagents

graphify's semantic extraction needs an LLM. In a Claude Code session the host agent dispatches
`general-purpose` subagents in parallel (graphify's Part B; never `Explore`, which cannot write chunk
files), or uses Gemini when `GEMINI_API_KEY` or `GOOGLE_API_KEY` is set. graphify reads no other key in
this flow. A host that cannot dispatch subagents can use the headless command instead, which its CLI help
lists as incremental through the same manifest unless `--force` is given:

```
graphify extract corpus --mode deep --out .
```

`--out .` makes it write `./graphify-out/` (the default would be `corpus/graphify-out/`, inside the
corpus). It takes a backend (`--backend gemini|kimi|claude|openai|deepseek|ollama`, default whichever key
is set) and that backend's spend. Either way, semantic extraction is model spend: deep mode costs more than
the default, and `graphify-out/cost.json` records every run's tokens, which the engine reports.

### Who reads the manuscript

A manuscript is unpublished intellectual property (`pulse-os-artifacts` is `confidential_default: true`),
and semantic extraction sends it to whichever model reads it. DZNR's backend policy is in
`routing/mcps/graphify.md` (Kevin's call, 2026-09-16): Claude by default, through the session already
signed in, with Ollama as a local fallback that does not yet produce a usable graph. So:

- Before a run, check that `GEMINI_API_KEY` and `GOOGLE_API_KEY` are unset for it. graphify's skill flow
  switches to Gemini whenever either is set, which would send the author's text to a second vendor without
  anyone choosing that.
- Name the backend that read the corpus in the run report, as the graphify spec requires ("a fallback is
  never silent").
- `dznr-os graph build <path> --docs` is DZNR's wrapper for the headless path with that policy built in.
  Its spec does not say it passes `--mode deep` or `--out`, so the lore engine uses graphify's own
  `/graphify` flow until that is confirmed.

---

## Node types: graphify cannot be told them

graphify has no option for node types, and its extraction prompt (`references/extraction-spec.md`) is
passed to every subagent verbatim. It fixes:

- `file_type` on every node to one of six values: `code`, `document`, `paper`, `image`, `rationale`,
  `concept`. graphify's build coerces anything else to `concept`.
- `relation` on every edge to a fixed list: `calls`, `implements`, `references`, `cites`,
  `conceptually_related_to`, `shares_data_with`, `semantically_similar_to`, `rationale_for`.
- `confidence` to `EXTRACTED`, `INFERRED` or `AMBIGUOUS`, with a score.

The engine does not edit graphify's prompt. graphify stamps its semantic cache with the prompt file that
produced each entry, so a private copy would fork the cache and drift from graphify's upgrades, and its
build would still coerce the types away. Instead the engine types nodes in a **post-pass** after every
build or update:

1. Read `graphify-out/graph.json` (NetworkX node-link format: `nodes` and `links`).
2. For each node not already typed in canon.json's `graph_nodes` map (that is, every node from a new or
   changed unit), read the passages in its `source_file` where its label appears, and assign one type:

   | Type | The passages show |
   |---|---|
   | character | a person or person-like being who acts, speaks, is spoken of |
   | place | somewhere: a town, a room, a road, a coast, a planet |
   | group | a named collective: a family, a faction, a crew, an institution, a class |
   | object | a thing that can be held, owned, used, lost or made |
   | rule | a stated law of how the world works: a mechanic, a limit, a cost |
   | event | something that happens at a time, stated or implied |
   | other | themes, motifs, moods and abstractions: kept for Sherlock's motifs, never a canon entity |

3. Write the type and the canon entity the node belongs to into canon.json's `graph_nodes` map. graphify
   rewrites `graph.json` on every build and update, so types never live there.

Relations get the same treatment: a graph edge says two things are connected and how sure graphify is;
the canon pass reads the passages and names the relation (`lives_in`, `member_of`, `parent_of`,
`present_at`, the list in `canon-schema.md`).

---

## What graphify's real behaviour means for the design

- **One entity, many nodes.** graphify builds a node ID from the file path plus the entity
  (`chapters_ch_001_ada_pruitt`), so the same character in two chapters is two nodes. The first build
  (graphify's Step 4, `build_from_json`) keeps them apart. An update (`build_merge`) runs graphify's
  label-similarity deduplication, which may merge same-label nodes across files, and could merge two
  distinct characters with near names. So graph node identity is neither stable between the first build
  and later updates nor the canon's identity. The engine resolves entities itself, by name, title and
  stated alias with passages behind each link, and never trusts a graphify merge as an alias ruling.
- **Citations are the engine's, not graphify's.** graphify's prompt leaves `source_location` null unless
  the extractor sets one, and for prose it usually does not. The graph says which unit mentions a subject;
  the engine finds the paragraph, quotes it and numbers it.
- **Only four frontmatter fields reach the graph.** graphify copies `source_url`, `captured_at`, `author`
  and `contributor` onto every node from a file. `source`, `locator`, `order`, `kind`, `pov` and
  `speaker` are for the engine, which reads them from the corpus file and `sources.json`. That is why the
  corpus frontmatter repeats the date as `captured_at` and carries `author`.
- **Re-extraction is per file, not per passage.** A one-word fix in a chapter re-extracts the whole
  chapter. Units stay at chapter or scene size, and the normaliser writes a file only when its body
  changed.
- **The cache hashes the body.** For Markdown, graphify hashes only the body below the frontmatter, so
  adding a POV or a date later does not re-extract anything.
- **Shrink guard.** graphify refuses to overwrite `graph.json` with a smaller graph on a full build. Unit
  deletions go through `--update`, which prunes them; a full rebuild that is meant to shrink needs
  graphify's own `--force` handling, and is Kevin's call.
- **A graphify upgrade can re-extract everything.** Cache entries are tied to the extraction prompt, so an
  upgrade that changes it re-extracts the whole corpus on the next run. Report the cost before running.
- **Chunks of 20 to 25 units.** graphify groups files from the same folder into one subagent's chunk, which
  is one more reason chapters live together in `corpus/chapters/` and sessions in `corpus/sessions/`.
- **Semantic similarity is within a chunk.** graphify adds `semantically_similar_to` edges only between
  concepts one subagent saw together. Alias candidates across distant chapters come from the engine's own
  check (e), with graphify's edges as one signal among several.

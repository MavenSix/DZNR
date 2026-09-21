---
mcp-name: graphify
status: ACTIVE (code path, and docs via Claude) / LIMITED (docs via Ollama)
primary-owner: neo
secondary-owners: sherlock, tar
proposal-doc: n/a (evaluated and installed 2026-09-16)
activated-date: 2026-09-16
---

# Graphify

**Not strictly an MCP.** It ships an MCP server (`graphify-mcp`, or `extract --mcp`), but it is
installed here as a **skill plus CLI** — `~/.claude/skills/graphify/SKILL.md` and
`~/.local/bin/graphify`. The MCP was deliberately not registered: the CLI is already reachable
from any session through the shell, so a resident MCP server would add tool weight to every
session's context without adding a capability. Register it later if a subagent needs structured
tool calls rather than shell output.

Source: `Graphify-Labs/graphify` (the `safishamsi/graphify` URL redirects there — the project was
transferred to the org). Apache-2.0. PyPI package is `graphifyy` with two y's, which the README
explains: the `graphify` name is still being reclaimed on PyPI. Verified before installing,
because a doubled letter in a package name is also the shape of a typo-squat.

## What this MCP does

Turns a corpus into a queryable knowledge graph. Code is parsed locally with tree-sitter across
~40 languages into nodes (functions, classes, types, files) and edges (`calls`, `imports`,
`re_exports`, `references`, `extends`, `contains`). Communities are found with Leiden. The graph
is then queried offline: shortest path between two symbols, reverse traversal for blast radius,
most-connected nodes, plain-language explanation of a node and its neighbours.

Docs, PDFs, papers and images go through a different path that needs an LLM — see the split
below, which is the whole reason this file has two statuses.

## Why DZNR uses it

**The defect DZNR keeps shipping is a thing that is plumbed and read by nothing.** Six of nine
defects found in one day were that shape; so was the router built in one session and reached by
nothing in the other (`16a1c7a`), and so was the `verify-build` staleness guard that ran after
the build it was checking. Every one of those is a graph question — *what has no inbound edge* —
and none of them is a grep question.

It fills three gaps nothing else covers:

1. **Blast radius before a change.** `graphify affected "recordArtifact"` returns every caller,
   importer and re-exporter across all eleven packages with `file:line`, transitively. `grep`
   gives direct mentions; this follows `re_exports` through the barrel files, which is exactly
   where a cross-package break hides.
2. **Architectural hubs.** `god-nodes` on `dznr-os` puts `ModelInput` at 81 edges, then
   `buildProgram()` at 43 and `ModelDriver` at 41. That is a ranked list of what must not break,
   derived rather than remembered.
3. **Orphan detection.** Callables with no inbound `calls`/`references`/`re_exports` edge. See
   the accuracy note below — it is a lead generator, not an oracle.

## Triggers

Direct invocation:

- "graphify"
- "/graphify"
- "knowledge graph"

Capability-based:

- "what calls this" / "what breaks if I change this" / "blast radius"
- "what depends on" / "what is affected by"
- "dead code" / "what is unused" / "nothing calls"
- "how is this wired" / "trace this through the codebase"
- "architecture map" / "what are the hubs"

## Workflow

Code, which is the ACTIVE path and needs no key:

1. `graphify extract <path> --code-only --out <dir>` — local AST only, no API call, no cost.
   On `dznr-os` (271 files): 2135 nodes, 5488 edges, 81 communities in **7.7 seconds**.
2. Query the resulting `graph.json` offline: `affected`, `god-nodes`, `path`, `explain`,
   `query`, `tree`.
3. `graphify global add <graph.json> --as <tag>` merges a project into
   `~/.graphify/global-graph.json` for cross-repo questions. `dznr-os` is registered there.
4. `graphify update <path>` re-extracts changed files only — also explicitly no LLM.

Always pass `--out` to a scratch directory when graphing a git repo, or `graphify-out/` lands in
the working tree and shows up in `git status`.

## The backend: Claude by default, Ollama as the fallback

Kevin's call, 2026-09-16. Implemented in `dznr-os graph` (`packages/cli/src/graph.ts`), not as a
shell alias, because backend choice is a policy and everything else graphify does is a command.

    dznr-os graph backend              which model would read the corpus, and why
    dznr-os graph build <path>         code only — local AST, no model, no cost
    dznr-os graph build <path> --docs  reads prose; this is the part that needs a model

**Claude**, through graphify's `claude-cli` backend, shells out to the Claude Code CLI with
`-p --output-format json` and authenticates through the session already signed in. No API key
held anywhere, no second vendor, no separate bill: a real run over `brands/` reported
`96,108 in / 35,757 out, est. cost (~claude-cli): $0.0000`. Graphify's own `detect_backend()`
will never choose it — `claude-cli` is explicitly excluded from the auto-detect list.

**Ollama** is the fallback because the corpus stays on the machine.

Three rules the wrapper holds:

1. **The free path stays free.** `--code-only` consults no backend at all.
2. **A fallback is never silent.** The backend is printed before the run and written to
   `graphify-out/.dznr-backend.json` after it. Graphify records `built_at_commit` but nothing
   about who READ the corpus, and a graph built by Claude and one built by an 8B local model are
   different artifacts.
3. **A reachable server is not a working backend.** Ollama answered on `:11434` with zero models
   pulled. "Not running" and "running but empty" are different sentences with different fixes,
   and the probe asks about the MODEL.

## Where the Ollama fallback actually stands

Wired correctly, selects correctly, refuses informatively — and **it does not currently produce
a usable graph.** Tested, not assumed:

| Step | Result |
|---|---|
| `OLLAMA_API_KEY` required | Ollama ignores auth; its client refuses to construct without a key. Wrapper supplies a placeholder per run. |
| `openai` package missing | `uv tool install "graphifyy[ollama,sql]"` — the `sql` extra also fixed 15 drizzle migrations that had been contributing nothing. |
| Default model wrong | Graphify defaults to `qwen2.5-coder:7b`; the LLM path never sees code. Wrapper defaults to `qwen3:8b`. |
| `qwen3:8b` | Returned prose: *"I'm ready to assist with your Test World pack configuration. Could you clarify what you need help with?"* Three times. |
| `qwen3:14b` | Returned a **design-system audit**, answering the `rule-hairline` question the brand pack itself poses. The corpus out-prompted the instruction. |
| Custom provider forcing JSON | Valid JSON, nothing hollow — but the model **invented the source filename** (`dznr/design-system.md` for `brands/dznr.md`), so all 12 items were dropped as out-of-scope. |

**The root cause is not the model.** Graphify sends a JSON schema only on the `claude-cli` path
(`_claude_cli_supports_json_schema`); every OpenAI-compatible backend is asked for JSON in prose
and is free to answer in prose. Given the same task directly — over both the native `/api/chat`
and the OpenAI-compatible `/v1` endpoint — `qwen3:8b` returned clean structured JSON both times.
It will not follow graphify's long extraction instruction unaided.

**The recipe, for when a better local model lands or graphify closes the gap.** A custom provider
in `~/.graphify/providers.json` can set `extra_body`, which merges into the request body and can
carry `response_format` back:

    "ollama-json": {
      "base_url": "http://127.0.0.1:11434/v1",
      "default_model": "qwen3:14b",
      "env_key": "OLLAMA_API_KEY",
      "extra_body": {
        "response_format": {"type": "json_object"},
        "options": {"num_ctx": 32768},
        "keep_alive": "30m"
      }
    }

Setting `extra_body` opts out of graphify's `num_ctx` auto-derive, which is why it is pinned
there too. That provider IS registered on the Mac. The wrapper deliberately does not use it: a
wrapper that depends on a hand-written config file outside the repo fails differently on the
other machine, and the built-in `ollama` fails the same way everywhere.

**So the practical position today:** Claude reads docs and it works. Ollama is the refusal path —
it will tell you it is falling back and then fail loudly rather than hand back a quietly worse
graph, which is the correct failure for a corpus you chose not to send anywhere.

## The doc path, and why it was a decision rather than a task

`~/DZNR` is **173 docs, 1 paper and 37 code files.** `--code-only` therefore indexes almost
nothing of what matters here — the rosters, chains, triggers, the MCP registry, the skill
inventory are all markdown tables.

Extracting those requires an LLM backend (`gemini`, `kimi`, `claude`, `openai`, `deepseek`, or
`ollama`), and with no key set the tool refuses cleanly rather than silently producing an empty
graph, which is the correct behaviour and worth noting.

**That means the routing corpus would be sent to an external provider.** There is no local model
on this machine — no ollama, no LM Studio, no llama.cpp. So the honest options are:

**Resolved 2026-09-16:** Claude by default through the already-signed-in session — which costs
nothing extra and holds no key — with Ollama as the local fallback. See the two sections above
for what that actually buys today.

**Also worth weighing before spending anything:** `scripts/build-routing-matrix.ts` already
parses the roster tables deterministically. An LLM re-reading the same tables would be solving a
solved problem less reliably. The doc path earns its keep on the corpus that has *no* parser —
world packs, brand packs, client material, lore — not on the rosters.

## Accuracy: what it gets right and what it does not

Measured on `dznr-os`, not assumed. The orphan probe returned 167 candidates. Hand-checking the
top ones:

- **`loraFor()`** (`packages/cli/src/style.ts:135`) — a true find. Exported, zero callers, zero
  tests. Genuinely dead, and the seam for a Fal driver that does not exist yet.
- **`assertSnapshotFeedsDashboard()`** (`packages/cli/src/tui-cmd.ts:52`) — a false positive,
  and an instructive one. It is a **compile-time** seam check whose body must typecheck; being
  uncalled is its design. The graph counts call edges, and a type-level guard has none.
- **`starts`**, **`gitLog`**, **`isEntryPoint`** — graph misses. A `const` arrow function, a
  default parameter value (`run = gitLog`), and a top-level call outside any function. All three
  are real usages the AST pass does not turn into a `calls` edge.
- Most of the remainder are TypeScript **interfaces and types**, used in annotations rather than
  called.

So: high recall, low precision, on a question nothing else answers at all. Treat the output as
leads to check by hand, never as a verdict. A finding from this tool is not evidence until it
has been confirmed in the source — which is the same rule that already applies to every other
confident zero in this project.

## Fallback (when the tool is unavailable)

`grep -rn` for direct mentions, and `tsc` for anything type-level. Both are worse in the specific
way the tool is good: neither follows `re_exports` through a barrel file, so a cross-package
break stays invisible until the build.

## Memory tags

When used on a project, write to project memory:

- Which corpus was graphed, with node/edge counts and whether it was `--code-only`
- Any orphan or hub finding that was **confirmed in the source**, never the raw candidate list
- Whether the doc path was used and against which backend, since that is a spend and a
  disclosure

## Activation steps

Already done on the Mac (2026-09-16):

1. `uv tool install graphifyy` — installs `graphify` and `graphify-mcp` to `~/.local/bin`
2. `graphify install --platform claude` — writes `~/.claude/skills/graphify/` and appends a
   three-line registration to `~/.claude/CLAUDE.md`
3. Verified: `graphify extract . --code-only` on `dznr-os`, then `affected` and `god-nodes`

Deliberately NOT run:

- `graphify claude install` — writes a **PreToolUse hook** into Claude Code settings. Nobody
  asked for a hook, and one that fires before every tool call is not a small thing.
- `graphify hook install` — a post-commit git hook that rebuilds the graph on every commit.
  Reasonable later; it was not part of the ask.

Still to do on the PC (`drogon`) if it is wanted there: the same two commands.

`graphify uninstall --purge` removes it from every detected platform in one shot.

## Status history

- 2026-09-16: ACTIVE for the code path (local AST, no key, verified on `dznr-os`).
  PENDING DECISION for the doc path, which requires sending the corpus to an external LLM.

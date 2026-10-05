---
mcp-name: workspace-and-data-cluster
status: ACTIVE (cluster)
primary-owner: cross-cutting
secondary-owners: tar, sherlock, morpheus
proposal-doc: n/a (foundational integrations)
activated-date: 2026-05-26
---

# Workspace and Data MCPs (cluster spec)

This single spec covers the cluster of cross-cutting workspace and data MCPs DZNR uses, since they share similar patterns and ownership. Each MCP gets its own subsection below; if any one of these needs deeper customization later, split into its own file.

## MCPs in this cluster

| MCP | Status | Primary use | Owners |
|-----|--------|-------------|--------|
| Slack | ACTIVE | Team chat search, read, send (with confirmation), canvases | Tár (memory + references), Morpheus (outbound), Sherlock (search) |
| google-drive | ACTIVE | Google Drive: file search, read, metadata, recent files | Sherlock (discovery), Morpheus (document delivery) |
| Granola | ACTIVE | Meeting transcripts and notes | Sherlock (meeting transcripts as research input) |
| Notion (via enterprise-search) | ACTIVE when authenticated | Knowledge base search | Sherlock (knowledge sourcing), Snape (brand docs) |
| gmail | ACTIVE | Gmail: email read and search, drafts | Tár (memory), Morpheus (outbound email) |
| google-calendar | ACTIVE | Google Calendar: events, availability | Tár (schedule) |
| pdf | ACTIVE | PDF tools (the pdf-viewer plugin): fill, sign, merge, split, extract | Morpheus (delivery), Snape (brand PDFs), Snake Eyes (legal docs), Tár, Sherlock, Neo, Gibson, Gandalf, Cheetara |
| Gong | ACTIVE | Sales call transcripts | Sherlock (call analysis), Snape (brand-voice via conversation analysis) |
| Shopify | ACTIVE when needed | E-commerce data, products, collections, orders | Snake Eyes (retail and CPG industry data), Sherlock (commerce research) |
| Apple Notes | ACTIVE (Mac-specific) | Personal note read/write | Tár (memory crossover), Sherlock (notes as research input) |
| Apify | ACTIVE | Web scraping actors marketplace | Sherlock (research at scale) |

**The MCP column is the server's own name, not a label.** DZNR OS matches each row to a running server by this cell, lowercased: a plugin server by the last part of its name (`plugin:small-business:gmail` is `gmail`, `plugin:pdf-viewer:pdf` is `pdf`), and a connector added through claude.ai by its display name with the prefix dropped and spaces turned to hyphens (`claude.ai Google Calendar` is `google-calendar`). A label such as "Gmail and Calendar" or "PDF Tools" matches no server, so its connector's status never shows. `scripts/validate-routing.sh` fails a row whose name cannot be a server name.

**`pdf` belongs to every agent.** It was written "Cross-cutting", meaning any agent may use it. DZNR OS reads an Owners cell as subagent names and reported "cross-cutting" as an owner it did not know, so the row names all nine instead; the three in parentheses are the ones that use it most. `scripts/validate-routing.sh` fails an owner that is not a directory under `agents/`.

One caveat on `google-calendar`: the design, enterprise-search and operations plugins declare their calendar server as `google calendar`, with a space. That form matches no row here, because one row can carry one name. The claude.ai connector and the small-business plugin both use the hyphen, so the row follows them.

## Common pattern

All cross-cutting workspace MCPs follow the same shape:

1. **Read first, write with confirmation.** These MCPs touch real user data. Tár reads memory and search results freely; write actions (Slack send, email send, Notion edit, calendar create) always require explicit user confirmation per DZNR's explicit-permission action rules.
2. **Search as the entry point.** Most invocations are "find that thing" via the enterprise-search skill cluster or the MCP's native search.
3. **Memory bridge.** Tár writes references to project memory when these MCPs surface relevant project context (e.g., "Slack channel #project-alpha is the active discussion").

## Triggers

Direct invocation by name ("check Slack", "search Google Drive", "look at the Granola transcript"). Plus capability-based triggers via the enterprise-search skill cluster ("find that doc about", "what did we decide on", "where was the conversation about").

## Workflow

Per MCP, but follows the cluster pattern. Specific workflows are documented in the enterprise-search skill set and individual subagent prompts where relevant.

## Fallback

If any MCP in this cluster is disconnected, the subagent reports the gap to the user and either:
- Suggests connecting the MCP
- Routes the work through an alternative MCP if applicable
- Asks the user to provide the missing data manually

## Memory tags

- Tár writes references like "memory/reference_[system].md" for external systems used across multiple projects
- Per-project references go into `memory/project_[name].md`

## Activation steps

Each MCP has its own activation flow (OAuth, API key, plugin install). The cluster is ACTIVE in this session for most; user-specific auth state may vary.

## When to split out a dedicated spec

If any one of these MCPs gets significant DZNR-specific customization (custom triggers, workflow logic, deeper subagent ownership), promote it to its own spec file. Until then, cluster coverage is sufficient.

## Status history

- 2026-05-26: ACTIVE cluster (spec created during Phase 3.6.5 framework build)
- 2026-10-05: four rows renamed to their server names (`google-drive`, `gmail`, `google-calendar`, `pdf`), since DZNR OS saw all four servers on both machines and matched none of them. Gmail and Calendar are two servers, so they are two rows. The PDF row names all nine agents instead of "Cross-cutting", which is not a subagent; it still means every agent may use it.

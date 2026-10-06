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
| google-drive | ACTIVE | Google Drive: file search, read, metadata, recent files | Sherlock (discovery), Morpheus (document delivery) |
| gmail | ACTIVE | Gmail: email read and search, drafts | Tár (memory), Morpheus (outbound email) |
| google-calendar | ACTIVE | Google Calendar: events, availability | Tár (schedule) |
| pdf | ACTIVE | PDF tools (the pdf-viewer plugin): fill, sign, merge, split, extract | Cross-cutting (Morpheus delivery, Snape brand PDFs, Snake Eyes legal docs) |
| Shopify | ACTIVE when needed | E-commerce data, products, collections, orders | Snake Eyes (retail and CPG industry data), Sherlock (commerce research) |
| apple-notes | PENDING (no server installed on either machine, 2026-10-06) | Personal note read/write (Mac only) | Tár (memory crossover), Sherlock (notes as research input) |
| Apify | ACTIVE | Web scraping actors marketplace | Sherlock (research at scale) |

**The MCP column is the server's own name, not a label.** DZNR OS matches each row to a running server by this cell, lowercased: a plugin server by the last part of its name (`plugin:small-business:gmail` is `gmail`, `plugin:pdf-viewer:pdf` is `pdf`), and a connector added through claude.ai by its display name with the prefix dropped and spaces turned to hyphens (`claude.ai Google Calendar` is `google-calendar`). A label such as "Gmail and Calendar" or "PDF Tools" matches no server, so its connector's status never shows. `scripts/validate-routing.sh` fails a row whose name cannot be a server name.

**`pdf` belongs to every agent, written "Cross-cutting".** That is DZNR OS's own word for a connector every agent may use: its agent catalog and connector report read `cross-cutting` that way, and its run preflight gives the connector to no single agent, so a pdf outage does not warn on every run. Naming all nine agents would do exactly that, and would leave out a tenth. The three in parentheses are the ones that use it most. `scripts/validate-routing.sh` fails an owner that is neither `cross-cutting` nor a directory under `agents/`.

**Slack, Granola and Gong are in `plugin-connectors.md`, once each.** They were listed here and there, and DZNR OS reported each as defined in both files, then kept the `plugin-connectors.md` row and dropped this one, so Tár did not own Slack. The rows there now carry every owner either file gave them: Slack is Sherlock, Morpheus, Tár and Snake Eyes; Granola and Gong are Sherlock and Snape. Their fallbacks are the per-row ones there.

**Notion is in `plugin-connectors.md` too.** This file listed it a second time as "Notion (via enterprise-search)", which is no server's name: the plugins declare plain `notion`, so DZNR OS could only show that row as having nothing to check, and the owners on it were never given the `notion` server. Snape (brand docs) now sits on the one `notion` row there, beside Sherlock and Neo.

**`apple-notes` has no server yet.** On 2026-10-06 neither machine declared one: `claude mcp list` on the Mac and the PC (plugins, claude.ai connectors and user servers alike) named none, nor did the Mac's Claude desktop config, and both DZNR OS daemons found nothing to check under that name or a similar one. The row said ACTIVE and "Apple Notes", a name DZNR OS can match only to a server declared with that space in it. `apple-notes` is the name DZNR OS gives a claude.ai connector called "Apple Notes", and the form a plugin server would use, so the row matches the day one is installed. Until then it is PENDING, routing/MCPS.md's word for a spec whose MCP is not connected yet, and DZNR OS shows it as having nothing to check, which is true.

One caveat on `google-calendar`: the design, enterprise-search and operations plugins declare their calendar server as `google calendar`, with a space. That form matches no row here, because one row can carry one name. The claude.ai connector and the small-business plugin both use the hyphen, so the row follows them.

## Common pattern

All cross-cutting workspace MCPs follow the same shape:

1. **Read first, write with confirmation.** These MCPs touch real user data. Tár reads memory and search results freely; write actions (email send, calendar create, Drive file create) always require explicit user confirmation per DZNR's explicit-permission action rules.
2. **Search as the entry point.** Most invocations are "find that thing" via the enterprise-search skill cluster or the MCP's native search.
3. **Memory bridge.** Tár writes references to project memory when these MCPs surface relevant project context (e.g., "the Drive folder Project Alpha / Briefs holds the current brief").

## Triggers

Direct invocation by name ("search Google Drive", "check my Gmail", "what's on my calendar", "pull the Shopify orders"). Slack, Notion, Granola and Gong triggers are with their rows in `plugin-connectors.md`. Plus capability-based triggers via the enterprise-search skill cluster ("find that doc about", "what did we decide on", "where was the conversation about").

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
- 2026-10-05: four rows renamed to their server names (`google-drive`, `gmail`, `google-calendar`, `pdf`), since DZNR OS saw all four servers on both machines and matched none of them. Gmail and Calendar are two servers, so they are two rows. The PDF row keeps "Cross-cutting", which DZNR OS reads as every agent.
- 2026-10-06: Slack, Granola and Gong moved to `plugin-connectors.md`, which already defined them, with every owner from both files.
- 2026-10-06: the "Notion (via enterprise-search)" row folded into `notion` in `plugin-connectors.md`, with Snape added there.
- 2026-10-06: "Apple Notes" renamed `apple-notes` and marked PENDING, since no Apple Notes server is installed on either machine.

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
| Google Drive (Cowork) | ACTIVE | File search, read, metadata, recent files | Sherlock (discovery), Morpheus (document delivery) |
| Granola | ACTIVE | Meeting transcripts and notes | Sherlock (meeting transcripts as research input) |
| Notion (via enterprise-search) | ACTIVE when authenticated | Knowledge base search | Sherlock (knowledge sourcing), Snape (brand docs) |
| Gmail and Calendar | ACTIVE | Email read/search, calendar events | Tár (memory + schedule), Morpheus (outbound email) |
| PDF Tools | ACTIVE | PDF fill, sign, merge, split, extract | Cross-cutting (Morpheus delivery, Snape brand PDFs, Snake Eyes legal docs) |
| Gong | ACTIVE | Sales call transcripts | Sherlock (call analysis), Snape (brand-voice via conversation analysis) |
| Shopify | ACTIVE when needed | E-commerce data, products, collections, orders | Snake Eyes (retail and CPG industry data), Sherlock (commerce research) |
| Apple Notes | ACTIVE (Mac-specific) | Personal note read/write | Tár (memory crossover), Sherlock (notes as research input) |
| Apify | ACTIVE | Web scraping actors marketplace | Sherlock (research at scale) |

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

# Plugin Family MCP Connectors

**Status:** DOCUMENTED (added v2.4.0, 2026-09-03)
**Purpose:** One comprehensive spec covering the plugin-family MCP connectors installed in Kevin's Claude environment. Each row maps the MCP to a Snake Eyes cluster (or core subagent), documents trigger patterns, and lists fallbacks.

**Total plugin MCP connectors documented here:** ~40 across 8 categories.

Most of these require authentication before use. Kevin authorizes them per-connector via claude.ai connector settings or `/mcp` in an interactive session. In non-interactive sessions the tools appear as "unavailable pending auth" and DZNR routes to fallbacks.

---

## Category 1: Data Warehouses and Analytics

Route through: **Snake Eyes Data cluster** (default). Sherlock cross-calls for research when data is quantitative.

| MCP | Plugin | Purpose | Subagent Owner | Fallback |
|-----|--------|---------|----------------|----------|
| amplitude | product-management | Product analytics events, funnels, retention | Snake Eyes (Data) | CSV export upload |
| amplitude-eu | product-management | Amplitude EU region | Snake Eyes (Data) | CSV export upload |
| bigquery | data | BigQuery SQL queries against warehouse | Snake Eyes (Data) | SQL query text saved for later |
| definite | data | Definite data platform (semantic layer) | Snake Eyes (Data) | Manual query build |
| hex | data | Hex notebooks and dashboards | Snake Eyes (Data) | Static Hex share URLs |
| similarweb | marketing | Competitive traffic and market data | Snake Eyes (Data) or Sherlock | Manual web research |
| supermetrics | marketing | Marketing analytics aggregator | Snake Eyes (Data) | Direct source API when possible |
| ahrefs | marketing | SEO keyword and backlink data | Snake Eyes (SearchFit SEO cluster) | Manual keyword research |
| pendo | product-management | Product analytics for onboarding, retention | Snake Eyes (Data) | Pendo export upload |

**Trigger patterns:** "analyze [table]", "run SQL against BigQuery", "Amplitude funnel for [event]", "Hex notebook", "keyword research on Ahrefs", "competitive traffic vs [competitor]"

**Workflow:** subagent receives request → checks connector auth status → if authed, queries directly → if unauthed, tells Kevin to authorize via claude.ai settings and offers the manual fallback path in the meantime.

---

## Category 2: Enterprise Search, Knowledge, and Docs

Route through: **Sherlock** (research/synthesis) and **Tár** (memory when relevant).

| MCP | Plugin | Purpose | Subagent Owner | Fallback |
|-----|--------|---------|----------------|----------|
| notion | enterprise-search + operations | Notion pages, databases | Sherlock (research) or Neo (project docs) | Paste content directly |
| atlassian | enterprise-search + operations | Confluence + Jira | Sherlock (research), Neo (Jira) | Manual export or paste |
| guru | enterprise-search | Guru knowledge base | Sherlock | Manual export |
| box | brand-voice + legal | Box docs, brand assets, legal contracts | Sherlock (brand), Snake Eyes (Legal) | Local file paths |
| granola | brand-voice | Granola meeting notes and transcripts | Sherlock (research), Snape (brand voice) | Paste transcript directly |
| gong | brand-voice | Gong call recordings and transcripts | Sherlock (research), Snape (brand voice) | Paste transcript directly |

**Trigger patterns:** "search Notion for", "find in Confluence", "check Guru", "pull the Box doc", "what did we say in that Granola call", "extract themes from Gong calls"

**Workflow:** Sherlock's `search`, `search-strategy`, `knowledge-synthesis` skills work across these when auth is live. Falls back to Kevin pasting content.

---

## Category 3: Communication and Collaboration

Route through: **Sherlock** (context gathering), **Morpheus** (outbound), or **Tár** (task memory).

| MCP | Plugin | Purpose | Subagent Owner | Fallback |
|-----|--------|---------|----------------|----------|
| slack | operations | Slack messages, channels, threads | Sherlock (context) or Morpheus (drafting messages) | Copy-paste threads |
| slack (small-business) | small-business | Slack watchlist for SMB | Snake Eyes (Small Business) | Copy-paste threads |
| intercom | design | Customer support conversations | Sherlock (voice-of-customer research) | Manual export |

**Trigger patterns:** "check the Slack thread on", "draft a Slack message about", "pull Intercom conversations about [feature]", "customer complaints from the last 30 days"

**Workflow:** Sherlock uses Slack MCP for voice-of-customer research; Morpheus uses it for drafting outbound messages; Snake Eyes small-business cluster uses it for the SMB watchlist skills (`monday-brief`, `friday-brief`).

---

## Category 4: Project Management

Route through: **Neo** (sprint and project delivery), **Sherlock** (project archaeology when researching past decisions).

| MCP | Plugin | Purpose | Subagent Owner | Fallback |
|-----|--------|---------|----------------|----------|
| linear | design + product-management | Linear tickets and cycles | Neo (delivery), Sherlock (research prior decisions) | Manual ticket entry |
| clickup | product-management | ClickUp tasks and docs | Neo (delivery) | Manual task entry |
| monday | product-management | Monday.com boards | Neo (delivery) | Manual board setup |
| asana | operations | Asana tasks and projects | Neo (delivery), Sherlock (research) | Manual task entry |
| fireflies | product-management | Fireflies meeting transcripts | Sherlock | Paste transcript |

**Trigger patterns:** "create Linear tickets for", "what's in ClickUp for this sprint", "Asana project for", "pull the Fireflies transcript"

**Workflow:** Neo's `xcm-user-stories` output can push directly to Linear/ClickUp/Asana when auth is live. Falls back to manual copy-paste.

---

## Category 5: Development Ops

Route through: **Neo** primarily (with Snake Eyes Operations cluster for incident response).

| MCP | Plugin | Purpose | Subagent Owner | Fallback |
|-----|--------|---------|----------------|----------|
| github | engineering | GitHub repos, PRs, issues | Neo (delivery), Sherlock (code archaeology) | Manual repo browse |
| datadog | engineering | Application monitoring, dashboards | Neo (delivery, incidents), Snake Eyes (Operations) | Manual monitor setup |
| pagerduty | engineering | On-call, incident routing | Snake Eyes (Operations, incident-response) | Manual on-call schedule |

**Trigger patterns:** "check the GitHub PR", "Datadog dashboard for [service]", "who's on-call", "PagerDuty incident post-mortem"

**Workflow:** Neo's `standup` and `incident-response` skills consume these when auth is live. Falls back to manual reporting.

---

## Category 6: Marketing and Customer

Route through: **Morpheus** (campaign work), **Snake Eyes Marketing** subroutes, or **Snake Eyes Small Business** for SMB-flavored ops.

| MCP | Plugin | Purpose | Subagent Owner | Fallback |
|-----|--------|---------|----------------|----------|
| klaviyo | marketing | Email marketing automation | Morpheus (campaigns), Snake Eyes (SB) | Manual email drafting |
| hubspot | marketing + small-business | CRM, sales pipeline | Snake Eyes (SB CRM), Morpheus (outbound) | Manual CRM entry |
| canva | marketing | Canva design workflow | Snake Eyes (Canva cluster) | Manual Canva work |

**Trigger patterns:** "draft a Klaviyo campaign", "check HubSpot deals", "resize Canva design for Instagram"

**Workflow:** Morpheus's `email-sequence` writes to Klaviyo when auth is live. Snake Eyes SB cluster (`crm-cleanup`, `crm-maintenance`, `lead-triage`) uses HubSpot directly. Canva cluster uses the Canva MCP for design edits.

---

## Category 7: Legal and Compliance

Route through: **Snake Eyes Legal cluster**.

| MCP | Plugin | Purpose | Subagent Owner | Fallback |
|-----|--------|---------|----------------|----------|
| docusign | legal | DocuSign envelopes, signatures | Snake Eyes (Legal) | Manual envelope setup |
| egnyte | legal | Egnyte legal document storage | Snake Eyes (Legal) | Local file paths |
| box | legal (also brand-voice) | Box legal folder | Snake Eyes (Legal) | Local file paths |

**Trigger patterns:** "send this contract to DocuSign", "pull the NDA from Egnyte", "sign this from Box"

**Workflow:** Snake Eyes Legal cluster (`signature-request`, `review-contract`, `vendor-check`) uses these when auth is live. Falls back to Kevin manually uploading contracts.

---

## Category 8: Bio Research (parked for Kevin)

Route through: **Snake Eyes Bio Research cluster**. Off-domain for Kevin's design practice.

| MCP | Plugin | Purpose | Subagent Owner | Fallback |
|-----|--------|---------|----------------|----------|
| biorender | bio-research | BioRender scientific illustrations | Snake Eyes (Bio Research) | Manual figure creation |
| owkin | bio-research | Owkin federated learning platform | Snake Eyes (Bio Research) | Static analysis |
| synapse | bio-research | Synapse research data | Snake Eyes (Bio Research) | Manual data download |
| wiley | bio-research | Wiley scientific publications | Snake Eyes (Bio Research) | Manual literature search |

**Trigger patterns:** explicit only. "Run BioRender for this figure", "query Synapse for [dataset]", "search Wiley for [topic]"

**Workflow:** Bio Research cluster skills (`nextflow-development`, `scvi-tools`, etc.) use these when adopters in life sciences invoke them. Rare in Kevin's day-to-day.

---

## Auth Status Legend

- **AUTHORIZED**: OAuth complete, tools available immediately
- **PENDING AUTH**: MCP is configured but user has not authorized; DZNR reports "unavailable pending auth" and offers the fallback
- **CONNECTION FAILED**: MCP is configured but the auth server does not support dynamic client registration (some SaaS platforms). Report as connection failure to the user; do not treat as missing capability.

## How DZNR Handles Auth-Pending MCPs

When a subagent needs an MCP that is pending auth:

1. Announce the gap: "The [MCP] connector needs authorization. Please open claude.ai connector settings and authorize [MCP], or run `/mcp` in an interactive Claude Code session."
2. Offer the fallback path from the tables above.
3. Continue the workflow with the fallback if the user says "proceed" or wait if the user says "hold on, let me authorize."

## Adopter Notes

- Adopters install different plugin sets. This spec catalogs Kevin's current install as of 2026-09-03.
- To add a new MCP: install the plugin, authorize via claude.ai settings or `/mcp`, then add a row to the appropriate category table above (or create a new category if it does not fit).
- To remove an MCP: uninstall the plugin, remove its row from this spec.

## Cross-References

- Snake Eyes AGENT.md documents which cluster each MCP feeds
- routing/MCPS.md documents the framework itself
- routing/SUBAGENT_ROSTERS.md documents per-subagent MCP dependencies
- routing/TRIGGERS.md documents trigger patterns per Snake Eyes cluster

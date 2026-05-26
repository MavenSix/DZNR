---
mcp-name: deployment-and-infra-cluster
status: ACTIVE (cluster)
primary-owner: neo
secondary-owners: gibson
proposal-doc: n/a (foundational integrations)
activated-date: 2026-05-26
---

# Deployment and Infrastructure MCPs (cluster spec)

This cluster covers deployment, hosting, and backend infrastructure MCPs. All primarily owned by Neo (delivery and code subagent) since they relate to shipping and operating built artifacts.

## MCPs in this cluster

| MCP | Status | Primary use | Owners |
|-----|--------|-------------|--------|
| Vercel | ACTIVE when needed | Deploy and manage Next.js, React, static sites | Neo (deployment of web artifacts), Gibson (deploy experiential web work) |
| Netlify | ACTIVE when needed | Alternative deployment for JAMstack and static sites | Neo (deployment), Gibson (alternative to Vercel) |
| Supabase | ACTIVE when needed | Postgres, auth, edge functions, storage backend | Neo (backend services when project needs database + auth) |

## Common pattern

These MCPs handle write-to-production operations. DZNR's explicit-permission action rules apply: any deployment, database migration, or infrastructure change requires user confirmation through the chat interface before execution.

Specific cautions:
- **Vercel/Netlify**: deployment commands deploy to live URLs. Confirm target environment (preview vs production) before each deployment.
- **Supabase**: database migrations and SQL execution touch real data. Use list_tables, list_migrations, and execute_sql with read-only queries for exploration; gate any write-or-migration step behind explicit user confirmation.

## Triggers

Direct invocation:

- "deploy to Vercel"
- "Netlify deploy"
- "Supabase database"
- "set up auth in Supabase"

Capability-based (when in delivery context):

- "deploy this"
- "ship the site"
- "set up the backend"
- "add a database"
- "auth flow"

## Workflow

Neo invocation (deploy):

1. Verify the project is build-ready (passing tests, validation loops complete per Chain 4)
2. Identify target environment (preview, staging, production)
3. Confirm with user before deploy command
4. Call the MCP's deploy tool (deploy_to_vercel, netlify-deploy-services-updater, etc.)
5. Verify deployment success; capture deployment URL for the artifact bundle
6. Update project memory with deployment URLs and environment mapping

Neo invocation (Supabase backend):

1. For new projects, scope database needs first (what tables, what auth, what storage)
2. Create project via create_project; confirm cost with user via get_cost and confirm_cost before any paid operation
3. Apply migrations via apply_migration with explicit user confirmation
4. Generate TypeScript types via generate_typescript_types for code integration
5. Use get_advisors to surface security/performance recommendations

## Fallback (when MCP is disconnected)

- Neo describes deployment steps for the user to execute manually
- For Supabase, Neo describes schema and migration plan as SQL; user runs in Supabase dashboard

## Memory tags

- Deployment URLs per project (preview, staging, production)
- Database project IDs and regions
- Migration history for traceability

## Activation steps

Each MCP requires authentication. For all users:

1. Sign up for the service (Vercel, Netlify, Supabase)
2. Authenticate via OAuth or API token through the MCP's flow
3. Verify by listing projects or teams

## Status history

- 2026-05-26: ACTIVE cluster (spec created during Phase 3.6.5 framework build)

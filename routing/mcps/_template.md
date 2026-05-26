---
mcp-name: [exact-name-as-it-appears-in-claude]
status: PENDING
primary-owner: [subagent name]
secondary-owners: [comma-separated, or "none"]
proposal-doc: [path to governance/proposals/ entry, or "n/a"]
activated-date: pending
---

# [Display Name]

## What this MCP does

[1-2 sentence summary of the capability. Focus on what an external user would understand, not internal technical detail.]

## Why DZNR uses it

[The specific gap this MCP fills in DZNR's existing capabilities. Why does the owning subagent need this? What can it not do without this MCP?]

## Triggers

Words and phrases that route requests to this MCP:

- "trigger phrase 1"
- "trigger phrase 2"
- "trigger phrase 3"

[Include both explicit triggers (user names the MCP or skill directly) and implicit triggers (user describes the capability without naming the tool).]

## Workflow

What happens when the MCP is invoked:

1. [Step 1: input gathering]
2. [Step 2: MCP call shape and parameters]
3. [Step 3: response processing]
4. [Step 4: artifact production]
5. [Step 5: handoff or completion]

[Include any subagent-specific logic, like Snape applying industry posture before building the prompt, or Gibson selecting between multiple tools the MCP exposes.]

## Fallback (when MCP is disconnected)

If the MCP is in PENDING status or the connection fails:

[Describe the manual or substitute workflow the subagent uses to deliver value without the MCP. Should preserve the user's intent even if at lower bandwidth.]

## Memory tags

When this MCP is used on a project, write to project memory:

- [What gets recorded, e.g. "Magic Patterns variant selection: variant 3 chosen, anchored on luxury palette"]
- [Any references the user might want to recall later]

## Activation steps

For the user to flip status from PENDING to ACTIVE:

1. [Where to install the MCP server, e.g. "Claude app marketplace > search for [name]"]
2. [Authentication steps, e.g. "OAuth flow on first call, or API key in settings"]
3. [Test step, e.g. "Run a direct tool call to verify response"]
4. [Status flip, e.g. "Edit this file's frontmatter: change status to ACTIVE, set activated-date to today"]

## Status history

- [YYYY-MM-DD]: PENDING (spec created)
- [YYYY-MM-DD]: ACTIVE (connection verified)

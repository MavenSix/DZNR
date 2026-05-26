# Memory Templates

This directory holds reference templates for the memory files DZNR subagents read and write.

## What lives here

- `project-template.md`: structure for project memory files (`memory/project_[name].md` in the user's auto-memory directory)

## How to use

When a new project enters DZNR, Tár creates a project memory file based on `project-template.md`. The user's memory directory (`~/Library/Application Support/Claude/.../memory/` or equivalent on other platforms) is per-user and not stored in this repo.

The industry tag in the template frontmatter is the key field that drives industry posture across subagents. See `routing/INDUSTRIES.md` for the full system.

## Future templates

- `reference-template.md`: for external-system reference memories (planned for when more subagents are built)
- `feedback-template.md`: for behavioral feedback memories (planned)
- `client-template.md`: optional, for long-term client relationship memory across multiple projects (planned)

These will be added as DZNR matures.

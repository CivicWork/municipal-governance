# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Claude AI plugin** (`municipal-governance`, v0.2.0) for local government officials and staff, designed to work for **any US municipality**. Built by Dustin Good, sitting Elgin Illinois Councilmember and creator of CivicAide, PolicyAide, and CivicWork.Ai.

It provides automated workflows for ordinance analysis, meeting preparation, policy research, budget review, constituent communications, agenda synthesis, and intergovernmental scanning.

**Key characteristic**: This is a prompt/workflow-based plugin using Markdown and JSON configuration — not compiled code. There are no build steps, tests, or linting tools.

## Architecture

```
.
├── commands/           # 7 slash command workflow definitions
├── skills/             # 9 domain expertise modules with SKILL.md files
├── .claude-plugin/     # Plugin metadata (plugin.json v0.2.0)
├── .mcp.json           # MCP server connections (~~municipal-code active)
├── municipal.local.md  # Municipality-specific configuration (template — customize per deployment)
├── README.md           # User documentation with installation + quick start
└── CivicWorkPluginReference.md  # Developer reference
```

### Two-Tier Design

1. **Commands** (`/commands/`): User-facing workflows invoked via `/municipal-governance:*`. Each command:
   - Loads `municipal.local.md` configuration first
   - References specific skills via `## Skills Referenced` section
   - Produces structured Markdown output with three-tier attention indicators (🔴/🟡/🟢)
   - Lists `## Related Commands` for discoverability
   - Includes "omit if N/A" guidance on longer output templates

2. **Skills** (`/skills/*/SKILL.md`): Domain knowledge modules containing:
   - YAML frontmatter with `description` (triggers automatic activation)
   - Frameworks, methodologies, analysis techniques
   - `## Related Skills` cross-references to other skills
   - `## Using Connected Tools` with active tools and clearly marked planned connectors
   - `## Municipal Configuration` listing relevant `municipal.local.md` fields
   - Three skills include structured output templates: `policy-evaluation`, `public-finance`, `municipal-code-analysis`

### Commands (7)

| Command | Purpose |
|---------|---------|
| `analyze-ordinance` | Review ordinances against municipal code |
| `meeting-prep` | Comprehensive meeting briefings |
| `policy-research` | Multi-source policy research |
| `agenda-synthesis` | Quick agenda packet summaries |
| `constituent-response` | Draft constituent communications |
| `budget-review` | Fiscal impact and budget analysis |
| `intergovernmental-scan` | State/federal policy monitoring |

### Skills (9)

| Skill | Purpose |
|-------|---------|
| `municipal-code-analysis` | Code interpretation, cross-referencing, hierarchy of authority |
| `parliamentary-procedure` | Robert's Rules, motions, voting procedures |
| `land-use-zoning` | Zoning, variances, form-based codes, inclusionary zoning, TIF |
| `public-finance` | Fund accounting, budgets, debt, pension/OPEB, CIP, fiscal impact |
| `intergovernmental-relations` | Home rule, preemption, grants, regional cooperation |
| `policy-evaluation` | Bardach framework, logic models, stakeholder analysis, decision matrices |
| `open-meetings-foia` | OMA compliance, FOIA, virtual meetings, records retention, social media |
| `council-communication` | Staff reports, ordinances, resolutions, minutes, amendment conventions |
| `ethics-conflicts` | Conflict of interest, recusal, gift restrictions, financial disclosure |

### Data Flow

```
User command → Load municipal.local.md → Retrieve documents (upload or MCP) → Reference skills → Structured Markdown output
```

### MCP Server Connections

Defined in `.mcp.json`. **Active:**
- `~~municipal-code` — Municode lookup via [MunicipalMCP](https://github.com/Skatterbrainz/MunicipalMCP) (Python, installed at `~/MunicipalMCP` with Python 3.12 venv). Path is machine-specific — must be updated per-installation.

**Planned** (referenced in skills as "Planned connectors" — plugin works without these):
- `~~document-management` — agenda packets, staff reports, FOIA records
- `~~agenda-management` — legislation tracking, meeting schedules
- `~~communication` — team messaging
- `~~project-tracking` — action item tracking

## Working with This Codebase

### Configuration Is Central

All workflows depend on `municipal.local.md` being customized with municipality-specific information. The template includes sections for: municipality basics, council structure, code references, agenda management, TIF districts, budget context, fiscal impact thresholds, policy priorities, ethics/disclosure rules, contacts, committees, procedural notes, and regional context.

### Adding New Commands

Follow the existing pattern in `/commands/`:
1. Define trigger and description
2. Specify required inputs
3. Start workflow with "Load Municipal Context" step (load `municipal.local.md`)
4. Document step-by-step workflow
5. Include structured output template (with "omit if N/A" guidance for optional sections)
6. Add `## Skills Referenced` listing primary and secondary skills
7. Add `## Related Commands` pointing to complementary commands
8. Add `## Notes` with edge cases and graceful degradation
9. Update README.md command table

### Adding New Skills

Create a new directory under `/skills/` with a `SKILL.md` file containing:
1. YAML frontmatter with `description` (tells Claude when to activate)
2. Overview and purpose
3. Conceptual framework / methodology
4. Analysis techniques with step-by-step procedures
5. Output template (for skills producing formal analyses)
6. Quality standards and common pitfalls
7. `## Related Skills` cross-referencing 2-4 related skills
8. `## Using Connected Tools` (active tools + "Planned connectors" section)
9. `## Municipal Configuration` listing relevant `municipal.local.md` fields
10. Caveats and limitations
11. Update README.md skills table

### Output Conventions

All command outputs follow consistent patterns:
- Executive summary at top
- Three-tier attention indicators: 🔴 (needs close review) / 🟡 (standard review) / 🟢 (consent/routine)
- Tables for comparisons
- Explicit confidence levels and assumptions
- Legal disclaimers where appropriate
- "Next Steps" or "Recommended Actions" section
- Omit sections where data is unavailable rather than generating boilerplate

### Cross-References

- Every skill has a `## Related Skills` section referencing 2-4 related skills
- Every command has `## Skills Referenced` (primary + secondary skills) and `## Related Commands`
- Maintain these when adding or modifying skills/commands
- See `CivicWorkPluginReference.md` for the full command → skill mapping table

### State-Specific Content

All skills are written for **any US municipality**. State-specific details belong in `municipal.local.md`, not in skill files. When referencing state-specific rules (OMA, FOIA, tax limitations, home rule), use language like "check `municipal.local.md` for your state's requirements" rather than hardcoding any state's rules.

## Known Pitfalls

### plugin.json `author` field must be an object

Claude Desktop strictly validates the plugin.json schema. The `author` field **must** be an object with a `name` property — a plain string will fail validation silently and crash the entire Plugins management page (not just this plugin, but all plugins).

```json
"author": "CivicWork"              // WRONG — breaks the Plugins page
"author": { "name": "CivicWork" }  // CORRECT
```

### MCP placeholder entries propagate and persist

When a plugin with `.mcp.json` entries is uploaded to Claude Desktop, those entries get written to three places:

1. The global config (`~/Library/Application Support/Claude/claude_desktop_config.json`) — prefixed as `municipal-governance:~~<name>`
2. The marketplace copy inside `local-agent-mode-sessions/.../cowork_plugins/marketplaces/local-desktop-app-uploads/municipal-governance/.mcp.json`
3. The cache copy inside `local-agent-mode-sessions/.../cowork_plugins/cache/local-desktop-app-uploads/municipal-governance/<version>/.mcp.json`

If the project `.mcp.json` is later cleaned, the uploaded copies and global config are **not** updated automatically. Stale entries will cause persistent error banners in Claude Desktop. To fully remove them, all three locations must be cleaned manually.

### .mcp.json contains machine-specific paths

The current `.mcp.json` has `~~municipal-code` configured with absolute paths to the developer's local MunicipalMCP installation. This must be updated per-installation. Other connector categories are referenced in skills as planned integrations but are not yet wired — the plugin works without them.

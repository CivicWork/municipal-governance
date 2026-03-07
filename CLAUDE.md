# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Claude AI plugin** (`municipal-governance`, v0.2.0) for local government officials and staff, designed to work for **any US municipality**. Built by Dustin Good, sitting Elgin Illinois Councilmember and creator of CivicAide, PolicyAide, and CivicWork.Ai.

It provides automated workflows for ordinance analysis, meeting preparation, policy research, budget review, constituent communications, agenda synthesis, and intergovernmental scanning.

**Key characteristic**: This is a prompt/workflow-based plugin using Markdown and JSON configuration — not compiled code. There are no build steps, tests, or linting tools.

## Architecture

```
.
├── agents/             # 1 utility agent (setup-municipality)
├── commands/           # 7 slash command workflow definitions
├── skills/             # 9 domain expertise modules with SKILL.md files
├── .claude-plugin/     # Plugin metadata (plugin.json v0.2.0)
├── .mcp.json           # MCP server connections (~~municipal-code active)
├── municipal.local.md  # Municipality-specific configuration (template — customize per deployment)
├── README.md           # User documentation with installation + quick start
└── CivicWorkPluginReference.md  # Developer reference
```

### Design

**Agents** (`/agents/`): Utility agents that run as Claude Code subprocesses in Cowork with file editing access:
- `setup-municipality` — Interactive configuration wizard that walks users through customizing `municipal.local.md`

**Commands and Skills** form the two-tier domain expertise layer:

1. **Commands** (`/commands/`): User-facing workflows invoked via `/municipal-governance:*`. Each command:
   - **Scopes the work first** — brief questions to focus depth and identify what the user actually needs (see "Scope" step in each command)
   - Loads `municipal.local.md` configuration
   - References specific skills via `## Skills Referenced` section
   - Produces structured Markdown output with three-tier attention indicators (🔴/🟡/🟢) and confidence tags on key claims
   - Supports **depth modes** (e.g., quick scan vs. comprehensive) — set during scoping
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
User command → Scope the work (brief user questions) → Load municipal.local.md → Retrieve documents (upload or MCP) → Reference skills → Structured Markdown output with confidence indicators
```

### MCP Server Connections

Defined in `.mcp.json`. **Active:**
- `~~municipal-code` — Municode lookup via [MunicipalMCP](https://github.com/Skatterbrainz/MunicipalMCP) (Python, installed at `~/CivicWork/MunicipalMCP` with Python 3.12 venv). Path is machine-specific — must be updated per-installation.

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
3. Start with a **Scoping step** — brief questions to focus depth and identify what the user needs
4. Load Municipal Context step (load `municipal.local.md`)
5. Document step-by-step workflow
6. Include structured output template (with "omit if N/A" guidance for optional sections)
7. Include **Analysis Boundaries** section in output template if the command produces analysis someone might act on (see "Single-Instance Disclosure" above)
8. Add `## Skills Referenced` listing primary and secondary skills
9. Add `## Related Commands` pointing to complementary commands
10. Add `## Notes` with edge cases and graceful degradation
11. Update README.md command table

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
- Legal disclaimers where appropriate
- "Next Steps" or "Recommended Actions" section
- Omit sections where data is unavailable rather than generating boilerplate

### Confidence Indicators

All substantive claims in command output should include a confidence tag so the user knows what's sourced vs. inferred:

- **High** — directly sourced from a provided document, municipal code lookup, or official record. Example: *"Fiscal impact: $2.3M one-time (High — staff report p.3)"*
- **Medium** — inferred from partial information, based on typical patterns, or sourced from web search. Example: *"May conflict with Title 19.07 (Medium — based on title text, no ordinance draft provided)"*
- **Low** — based on general knowledge, analogies to other municipalities, or incomplete data. Example: *"Implementation likely requires 2-3 FTEs (Low — estimate based on peer city experience, no local staffing data)"*

Confidence tags appear inline after the claim, in parentheses. Keep them brief. Don't tag every sentence — tag key facts that inform decisions: fiscal figures, legal conclusions, code conflict assessments, and implementation estimates. Routine descriptive content (item titles, meeting dates, procedural steps) doesn't need tagging.

### Single-Instance Disclosure (Verification Line)

This plugin runs as a single AI instance — one model, one pass, one perspective. That's appropriate for many tasks (information gathering, document synthesis, procedural guidance) but insufficient for high-stakes policy decisions.

Commands must include a **verification disclosure** when their output approaches the boundary of what a single instance can responsibly provide. The disclosure:

1. **Acknowledges the limitation** — this analysis was not adversarially tested, independently verified, or produced through multi-perspective deliberation
2. **Identifies what specifically needs deeper treatment** — not a generic warning, but a list of the specific claims, conclusions, or recommendations that would benefit from further verification
3. **Points to the next level** — PolicyAide's multi-agent deliberation framework, attorney review, staff analysis, or other appropriate escalation

**When to include the disclosure:**
- Policy research in **Decision-focused** or **Comprehensive** mode
- Ordinance analysis classified as 🟡 SIGNIFICANT or 🔴 CRITICAL
- Meeting prep items flagged 🔴 that involve code amendments, significant fiscal impact, or legal risk
- Any output that includes a recommendation the user might act on directly

**When it's not needed:**
- Quick scans and exploratory research (informational, not decision-driving)
- Agenda synthesis (summary, not analysis)
- Constituent responses (communication, not policy)
- Factual lookups (what does the code say about X)

The disclosure is not a liability disclaimer — it's a design principle. The plugin knows its own limits and says so. This is what responsible AI deployment looks like in government.

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

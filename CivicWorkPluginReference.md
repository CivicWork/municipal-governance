# CivicWork Plugin Development Reference

Reference guide for developers working on the municipal-governance plugin. For user-facing documentation, see [README.md](README.md). For Claude Code guidance, see [CLAUDE.md](CLAUDE.md).

## Cowork Plugin Architecture

Every Cowork plugin follows this standardized structure:

```
plugin-name/
├── .claude-plugin/
│   └── plugin.json          # Required: Plugin manifest (name, version, description, author)
├── .mcp.json                # Optional: MCP server configuration for external tools
├── commands/                # Slash commands users invoke explicitly
│   └── command-name.md      # Each .md file = one slash command
├── skills/                  # Domain knowledge Claude draws on automatically
│   └── skill-name/
│       └── SKILL.md         # Required for each skill
├── hooks/                   # Optional: Event handlers
│   └── hooks.json
└── README.md                # Documentation
```

**Key principles:**
- Everything is **file-based** — Markdown and JSON only, no code, no infrastructure, no build steps
- **Skills** fire automatically when Claude detects relevance (passive domain knowledge)
- **Commands** are explicit actions the user triggers with `/plugin-name:command-name`
- **Connectors** use MCP servers to wire into external tools
- Skills use `~~category` placeholders instead of specific tool names (tool-agnostic)
- Plugins gracefully degrade when tools are unavailable

---

## Design Patterns (from Anthropic's Legal Plugin)

The legal plugin is the closest analog to municipal-governance. Key patterns we follow:

| Pattern | Legal Plugin | Municipal Governance |
|---------|-------------|---------------------|
| Local config | `legal.local.md` (org playbook) | `municipal.local.md` (city-specific context) |
| Structured output | Traffic light triage (GREEN/YELLOW/RED) | Three-tier classification (🟢/🟡/🔴) |
| Graceful degradation | Works without connected tools | Works without MCP servers (uploaded docs fallback) |
| Skill activation | Description field triggers automatic loading | Same — YAML frontmatter `description` field |
| Cross-skill references | Skills reference related skills | Skills reference related skills by name |

**The `~~category` pattern:** The `~~` prefix signals a tool *category* placeholder. Skills reference `~~municipal-code` rather than "Municode" specifically, so a city using American Legal or their own codification can swap the MCP server config without touching any skill files.

---

## Current Plugin Structure

```
municipal-governance/             (CivicWorkPlugin/)
├── .claude-plugin/
│   └── plugin.json               # v0.2.0, author: CivicWork
├── .mcp.json                     # ~~municipal-code → MunicipalMCP (local install)
├── agents/
│   └── setup-municipality.md     # Interactive municipal.local.md configuration wizard
├── .claude/
│   └── settings.local.json       # Project-level Claude Code settings
├── commands/
│   ├── analyze-ordinance.md      # /municipal-governance:analyze-ordinance
│   ├── meeting-prep.md           # /municipal-governance:meeting-prep
│   ├── policy-research.md        # /municipal-governance:policy-research
│   ├── agenda-synthesis.md       # /municipal-governance:agenda-synthesis
│   ├── constituent-response.md   # /municipal-governance:constituent-response
│   ├── budget-review.md          # /municipal-governance:budget-review
│   └── intergovernmental-scan.md # /municipal-governance:intergovernmental-scan
├── skills/
│   ├── municipal-code-analysis/SKILL.md   # Code interpretation, cross-referencing, MunicipalMCP tool reference
│   ├── parliamentary-procedure/SKILL.md   # Robert's Rules, motions, voting, scripted chair language
│   ├── land-use-zoning/SKILL.md           # Zoning, variances, TIF, development review
│   ├── public-finance/SKILL.md            # Fund accounting, budgets, debt, fiscal impact
│   ├── intergovernmental-relations/SKILL.md # Home rule, preemption, grants, IGA evaluation
│   ├── policy-evaluation/SKILL.md         # Bardach framework, logic models, stakeholder analysis
│   ├── open-meetings-foia/SKILL.md        # OMA compliance, FOIA procedures, exemption decision tree
│   ├── council-communication/SKILL.md     # Staff reports, ordinances, resolutions, legal drafting
│   └── ethics-conflicts/SKILL.md          # Conflict of interest, recusal, gift bans
├── municipal.local.md            # Municipality-specific configuration (template)
├── CLAUDE.md                     # Claude Code developer guidance
├── README.md                     # User documentation
└── CivicWorkPluginReference.md   # This file
```

---

## Command → Skill Mapping

Each command draws on specific skills. This mapping documents the intended relationships:

| Command | Primary Skills | Secondary Skills |
|---------|---------------|-----------------|
| `analyze-ordinance` | municipal-code-analysis | policy-evaluation, public-finance, ethics-conflicts |
| `meeting-prep` | parliamentary-procedure | open-meetings-foia, public-finance, municipal-code-analysis, ethics-conflicts |
| `policy-research` | policy-evaluation | intergovernmental-relations, public-finance |
| `agenda-synthesis` | (general synthesis) | parliamentary-procedure, public-finance |
| `constituent-response` | council-communication | open-meetings-foia |
| `budget-review` | public-finance | policy-evaluation, municipal-code-analysis |
| `intergovernmental-scan` | intergovernmental-relations | policy-evaluation, public-finance |

---

## MCP Server Configuration

### Current State

Only one connector is actively configured:

```json
{
  "mcpServers": {
    "~~municipal-code": {
      "command": "/path/to/MunicipalMCP/.venv/bin/python3",
      "args": ["/path/to/MunicipalMCP/municode-mcp-server.py"]
    }
  }
}
```

**Important:** The `.mcp.json` path is machine-specific and must be updated per-installation. The current file points to the developer's local MunicipalMCP install.

### MunicipalMCP Tools (7 tools via `~~municipal-code`)

The `municipal-code-analysis` skill contains the authoritative tool reference. Summary:

| Tool | Purpose | Key Parameters |
|------|---------|---------------|
| `search_municipal_codes` | Full-text search of code provisions | `municipality_name`, `state_abbr`, `search_query`, `page_size`, `titles_only` |
| `get_code_section` | Retrieve full text of a specific section | `municipality_name`, `state_abbr`, `node_id` |
| `get_code_structure` | Browse table of contents / navigate hierarchy | `municipality_name`, `state_abbr`, `node_id` (optional) |
| `get_municipality_info` | Confirm municipality is in Municode | `municipality_name`, `state_abbr` |
| `get_municipality_url` | Get URL to Municode library page | `municipality_name`, `state_abbr` |
| `list_municipalities` | List all Municode municipalities in a state | `state_abbr` |
| `get_states_info` | Get state-level information | `state_abbr` |

**Common workflows:** Search-then-read (`search_municipal_codes` → `get_code_section`), browse-then-read (`get_code_structure` → drill down → `get_code_section`), validation (`get_municipality_info` to confirm availability).

**Tool guidance in skills:** 6 of 9 skills reference `~~municipal-code` with domain-specific search patterns. The 3 that don't need it: `policy-evaluation`, `council-communication`, `parliamentary-procedure`. All 6 point back to `municipal-code-analysis` for the full tool reference.

### Planned Connectors

These categories are referenced in skills as "Planned connectors" but have no MCP server implementations yet:

| Category | Purpose | Candidate Implementations |
|----------|---------|--------------------------|
| `~~document-management` | Agenda packets, staff reports, FOIA records | `@anthropic/mcp-server-filesystem`, Box MCP, SharePoint MCP |
| `~~agenda-management` | Legislation tracking, meeting schedules | Would need custom MCP for Legistar/Granicus/CivicEngage APIs |
| `~~communication` | Team messaging | `@anthropic/mcp-server-slack`, Teams MCP |
| `~~project-tracking` | Action items, task tracking | `@anthropic/mcp-server-linear`, Jira MCP |

### Known Pitfall: MCP Entry Propagation

When a plugin with `.mcp.json` entries is uploaded to Claude Desktop, entries propagate to three locations:

1. Global config: `~/Library/Application Support/Claude/claude_desktop_config.json`
2. Marketplace copy: `local-agent-mode-sessions/.../cowork_plugins/marketplaces/.../municipal-governance/.mcp.json`
3. Cache copy: `local-agent-mode-sessions/.../cowork_plugins/cache/.../municipal-governance/<version>/.mcp.json`

Stale entries are **not** cleaned automatically. All three must be manually updated if `.mcp.json` changes.

---

## Conventions

### Output Format

All commands produce structured Markdown with these consistent elements:
- Executive summary at top
- Three-tier attention indicators: 🔴 (needs close review) / 🟡 (standard review) / 🟢 (consent/routine)
- Tables for structured comparisons
- Confidence levels and explicit assumptions
- Legal disclaimers where appropriate
- "Next Steps" or "Recommended Actions" section

### Skill Structure

Each SKILL.md follows this pattern:
1. YAML frontmatter with `description` field (triggers automatic activation)
2. Overview and purpose
3. Conceptual framework / methodology
4. Analysis techniques with step-by-step procedures
5. Decision frameworks, templates, and practitioner tools (decision trees, scoring rubrics, scripted language, checklists)
6. Output template (for skills producing formal analyses: policy-evaluation, public-finance, municipal-code-analysis)
7. Quality standards and common pitfalls
8. `## Related Skills` — cross-references to 2-4 related skills (standardized header across all 9 skills)
9. `## Using Connected Tools` — active `~~municipal-code` search patterns (6 skills) + planned connectors
10. `## Municipal Configuration` — what to look for in `municipal.local.md`
11. Caveats and limitations

### Command Structure

Each command .md follows this pattern:
1. Title and description
2. Trigger (the slash command)
3. Inputs (required and optional)
4. Workflow steps (numbered, starting with "Load Municipal Context")
5. Output format (structured Markdown template)
6. Variations (alternative modes like quick scan vs. deep dive)
7. Notes (edge cases, fallbacks, disclaimers)

---

## Adding to the Plugin

### Adding a New Command

1. Create `commands/your-command-name.md`
2. Follow the command structure above
3. Start workflow with "Load Municipal Context" step (load `municipal.local.md`)
4. Reference specific skills by name in a `## Skills Referenced` section
5. Include graceful degradation notes for when MCP tools are unavailable
6. Add three-tier classification where applicable
7. Update README.md command table

### Adding a New Skill

1. Create `skills/your-skill-name/SKILL.md`
2. Include YAML frontmatter with a `description` that tells Claude when to activate
3. Follow the skill structure above
4. Reference related skills by name (e.g., "See `public-finance` skill for fiscal impact methodology")
5. Include "Using Connected Tools" section with active tools and planned connectors
6. Include "Municipal Configuration" section listing relevant `municipal.local.md` fields
7. Update README.md skills table

---

## Skill Content Summary

Each skill provides domain expertise. Beyond the base frameworks, skills include practitioner-level tools:

| Skill | Key Practitioner Tools |
|-------|----------------------|
| `municipal-code-analysis` | MunicipalMCP tool reference (7 tools), search-then-read/browse-then-read workflows, search tips, pitfalls |
| `policy-evaluation` | Bardach eightfold path, logic models, decision matrices, risk assessment matrix |
| `public-finance` | Pension/OPEB metrics table, CIP prioritization criteria, fiscal impact output template |
| `land-use-zoning` | Form-based code transect, inclusionary zoning tools, zoning-targeted search patterns |
| `intergovernmental-relations` | IGA 13-item checklist + red flags, preemption 4-step decision tree, grant go/no-go scoring rubric, legislative impact template |
| `parliamentary-procedure` | Scripted chair language (8 situations), 5 conflict resolution scenarios, quasi-judicial hearing script, motion quick reference card (11 motions) |
| `open-meetings-foia` | FOIA exemption 4-step decision tree + exemption comparison table, closed session exception framework with motion language, 5 FOIA response templates |
| `council-communication` | Ordinance vs resolution decision framework, shall/may/must drafting guide + common errors table, 3-tier constituent triage protocol |
| `ethics-conflicts` | Conflict evaluation framework, recusal procedure, gift restriction analysis, ethics-targeted search patterns |

---

## Key Decisions Made

| Decision | Choice | Rationale |
|----------|--------|-----------|
| Plugin name | `municipal-governance` | Descriptive, findable; branded as "by CivicWork" in author field |
| Trigger prefix | `/municipal-governance:` | Matches plugin name per Cowork conventions |
| Audience | Elected officials + staff | Skills useful for both; commands optimized for elected officials |
| State specificity | Generic with state-configurable | `municipal.local.md` holds state-specific details; skills provide general frameworks |
| Architecture | Commands → Skills (two-tier) | Agents were evaluated and removed — content merged into skills for simplicity |
| MCP approach | `~~category` placeholders | Tool-agnostic; any city can swap providers without touching skills |
| `plugin.json` author | `{"name": "CivicWork"}` object | Must be object format — plain string crashes Claude Desktop Plugins page |

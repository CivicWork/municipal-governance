# Municipal Governance Plugin

AI-powered productivity tools for local government elected officials and staff.

## Overview

This plugin automates common workflows for municipal elected officials and staff:

- **Ordinance Analysis**: Review proposed ordinances against existing municipal code
- **Meeting Preparation**: Generate briefings from agenda packets
- **Policy Research**: Multi-source research with intergovernmental context
- **Budget Review**: Analyze fiscal impacts and budget items
- **Constituent Communications**: Draft responses following municipal communication standards
- **Agenda Synthesis**: Quick-turnaround agenda packet summaries
- **Intergovernmental Scanning**: Monitor state/federal policy impacts on local government

## Quick Start

1. Install the plugin (see Installation below)
2. Customize `municipal.local.md` with your municipality's information
3. Try `/municipal-governance:agenda-synthesis` with an uploaded agenda packet PDF

That's it — most commands work immediately with just an uploaded document and your municipal configuration.

## Installation

### Claude Desktop (Cowork)

1. Download or clone this repository
2. In Claude Desktop, go to **Settings > Plugins > Install from folder**
3. Select the `CivicWorkPlugin` directory
4. The plugin's commands will appear as `/municipal-governance:*`

### Claude Code (CLI)

1. Clone this repository into your working directory
2. The plugin files will be automatically detected by Claude Code

### After Installation

1. **Edit `municipal.local.md`** — Replace all `[bracket placeholders]` with your municipality's specific information (council structure, code references, budget context, policy priorities, contacts)
2. **(Optional) Configure MCP servers** — Edit `.mcp.json` to connect your municipal code provider. See [Connectors](#connectors) below.

## Commands

| Command | Description |
|---------|-------------|
| `/municipal-governance:analyze-ordinance` | Analyze proposed ordinances against municipal code |
| `/municipal-governance:meeting-prep` | Prepare comprehensive briefings for council/committee meetings |
| `/municipal-governance:policy-research` | Multi-source policy research workflow |
| `/municipal-governance:agenda-synthesis` | Quick synthesis of agenda packets into briefings |
| `/municipal-governance:constituent-response` | Draft constituent communications |
| `/municipal-governance:budget-review` | Analyze budget items and fiscal impact |
| `/municipal-governance:intergovernmental-scan` | Scan state/federal policy impacts |

## Configuration

Edit `municipal.local.md` to configure:

- Municipality name, state, and government type
- Council structure and meeting schedule
- Municipal code provider and key code references
- Agenda management system
- Budget context and fiscal year
- Current policy priorities
- Organizational contacts and committees
- State law requirements (Open Meetings Act, FOIA references)

The plugin works for **any US municipality** — `municipal.local.md` is where you make it yours.

## Skills

The plugin includes 9 domain expertise modules that Claude draws on automatically:

| Skill | Purpose |
|-------|---------|
| `municipal-code-analysis` | Code interpretation, cross-referencing, hierarchy of authority |
| `parliamentary-procedure` | Robert's Rules, motions, voting procedures |
| `land-use-zoning` | Zoning districts, variances, development review, TIF |
| `public-finance` | Fund accounting, budgets, debt instruments, fiscal impact |
| `intergovernmental-relations` | Home rule, preemption, grants, regional cooperation |
| `policy-evaluation` | Bardach framework, stakeholder analysis, decision matrices |
| `open-meetings-foia` | Open Meetings Act compliance, FOIA procedures |
| `council-communication` | Staff reports, ordinances, resolutions, constituent correspondence |
| `ethics-conflicts` | Conflict of interest, recusal, gift restrictions, financial disclosure |

## Connectors

Configure `.mcp.json` to connect external tools. The plugin uses the `~~category` pattern so you can swap providers without changing any command or skill files.

### Available Now

| Connector | Description | Default Provider |
|-----------|-------------|-----------------|
| `~~municipal-code` | Municipal code lookup | [MunicipalMCP](https://github.com/Skatterbrainz/MunicipalMCP) (Municode API) |


## How It Works

```
User command → Load municipal.local.md → Retrieve documents (upload or MCP) → Reference skills → Structured output
```

All commands produce consistent Markdown output with:
- Executive summary
- Status indicators (red/yellow/green) for attention priority
- Tables for comparisons
- Confidence levels and assumptions
- Legal disclaimers where appropriate
- Recommended next steps

## License

MIT License - Built by [CivicWork](https://civicwork.ai)

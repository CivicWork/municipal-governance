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
2. Run the **Setup Municipality** agent from the Agents tab to configure your municipality interactively — or edit `municipal.local.md` manually
3. Try `/municipal-governance:agenda-synthesis` with an uploaded agenda packet PDF

That's it — most commands work immediately with just an uploaded document and your municipal configuration.

## Installation

### Claude Desktop (Cowork)

1. Download or clone this repository
2. In Claude Desktop, go to **Settings > Plugins > Install from folder**
3. Select the `CivicWorkPlugin` directory
4. The plugin's commands will appear as `/municipal-governance:*`

### Claude Code (CLI)

1. Clone this repository
2. Open Claude Code in the repository directory — plugin files are detected automatically

### After Installation

1. **Configure your municipality** — Open the **Setup Municipality** agent from the Agents tab. It will walk you through the setup interactively and fill in `municipal.local.md` for you. Alternatively, edit `municipal.local.md` manually in a text editor.
2. **(Optional) Configure connectors** — See [Connectors](#connectors) below to enable live municipal code lookup.

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

The plugin includes 9 domain expertise modules. You don't invoke these directly — Claude activates them automatically based on what you're working on.

| Skill | What it covers | Example prompt |
|-------|---------------|----------------|
| `municipal-code-analysis` | Code interpretation, cross-referencing, MunicipalMCP tool reference | "Does this amendment conflict with Chapter 19?" |
| `parliamentary-procedure` | Robert's Rules, scripted chair language, quasi-judicial hearings | "What do I say to open a public hearing?" |
| `land-use-zoning` | Zoning, variances, TIF districts, form-based codes, inclusionary zoning | "Walk me through the variance criteria for this parcel" |
| `public-finance` | Budgets, fund accounting, debt, pension/OPEB, CIP planning | "What's the pension impact of this staffing proposal?" |
| `intergovernmental-relations` | Home rule, preemption decision tree, IGA evaluation, grant scoring | "Should we pursue this grant opportunity?" |
| `policy-evaluation` | Bardach framework, logic models, decision matrices, stakeholder analysis | "Evaluate these three approaches to short-term rentals" |
| `open-meetings-foia` | OMA, FOIA exemption decision tree, closed session framework, response templates | "Can we discuss this in executive session?" |
| `council-communication` | Staff reports, ordinances vs resolutions, legal drafting, constituent triage | "Should this be an ordinance or a resolution?" |
| `ethics-conflicts` | Conflicts of interest, recusal procedures, gift rules, financial disclosure | "Do I need to recuse myself from this vote?" |

## Connectors

The plugin can optionally connect to external data sources via MCP servers. Currently supported:

| Connector | Description | Provider |
|-----------|-------------|----------|
| `~~municipal-code` | Search and retrieve municipal code sections (7 tools) | [MunicipalMCP](https://github.com/Skatterbrainz/MunicipalMCP) (Municode API) |

Six of the nine skills include domain-specific search patterns for `~~municipal-code` (e.g., zoning queries, ethics ordinance lookups, budget code references). Without connectors, commands work with uploaded documents and web search.

## How It Works

1. You run a command (e.g., `/municipal-governance:meeting-prep`) and upload a document
2. Claude loads your municipality's configuration from `municipal.local.md`
3. Relevant skills activate automatically based on the subject matter
4. You get structured output with an executive summary, attention-priority flags (red/yellow/green), and recommended next steps

## License

MIT License - Built by [CivicWork](https://civicwork.ai)

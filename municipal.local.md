# Municipal Configuration

Customize this file for your municipality. This configuration is used by all skills and commands in the municipal-governance plugin.

**Getting started:** Run the **Setup Municipality** agent from the Agents tab — it will walk you through this interactively and fill in the fields for you. Or edit this file manually.

## Municipality

- **Name**: [Your municipality name]
- **State**: [State]
- **Population**: [Approximate population]
- **Government Type**: [Council-Manager / Mayor-Council / Commission / Town Meeting / other]
- **Home Rule**: [Yes/No — note relevant constitutional or statutory provision]

## Council Structure

- **Governing Body Title**: [City Council / Board of Trustees / Town Board / etc.]
- **Members**: [Number and composition, e.g., "6 Council Members + Mayor (7 total)"]
- **Terms**: [Term length and staggering, e.g., "Four-year terms, staggered"]
- **Districts**: [At-Large / Ward-based / Mixed]
- **Meeting Schedule**: [Regular meeting schedule, e.g., "1st and 3rd Tuesday, 7:00 PM"]
- **Meeting Location**: [Address]
- **Committee Structure**: [Standing committees, Committee of the Whole, etc.]

### Current Members

| Member | Role |
|--------|------|
| [Name] | [Mayor / Council Member / etc.] |

## Key Code References

- **Municipal Code Provider**: [Municode / American Legal / General Code / other]
- **Code URL**: [Link to online municipal code]
- **Zoning Code**: [Title/Chapter reference]
- **Subdivision Code**: [Title/Chapter reference]
- **Building Code**: [Adopted edition and local reference]

## Agenda Management

- **System**: [Legistar / Granicus / CivicEngage / other / none]
- **Public URL**: [Link to public agenda/meeting portal]
- **Note**: Plugin works with file-based agenda packets (uploaded PDFs) when no structured agenda API is available.

### Active TIF Districts

| District Name | Creation Date | Expiration Date | Purpose |
|--------------|---------------|-----------------|---------|
| [District name] | [Date] | [Date] | [Purpose] |

### Special Districts/Authorities

- [Note any overlapping jurisdictions, special districts, or joint authorities]

## Budget Context

- **Fiscal Year**: [Calendar Year / July-June / October-September]
- **General Fund Size**: [Approximate annual budget]
- **Major Revenue Sources**: [List primary revenue sources]
- **Tax Limitations**: [Note any state-imposed tax caps or limitations]
- **Bond Rating**: [Current rating if known]

### Fiscal Impact Thresholds

These thresholds are used by commands to flag items for attention:

- **Critical Fiscal Impact**: $[amount] — triggers 🔴 classification
- **Significant Fiscal Impact**: $[amount] — triggers 🟡 classification
- **Contract Authority Limit**: $[amount] (requiring council approval)
- **Budget Amendment Threshold**: $[amount] (requiring council approval for line-item transfers)

## Policy Priorities

Current administration/council priorities:

1. [Priority area and brief context]
2. [Priority area and brief context]
3. [Priority area and brief context]

## Organizational Context

### Key Contacts

- **City Manager / Administrator**: [Name]
- **City Clerk**: [Name]
- **City Attorney / Corporation Counsel**: [Name]
- **Finance Director**: [Name]
- **Community Development Director**: [Name]
- **FOIA Officer**: [Name or office]

### Standing Committees

| Committee / Board / Commission | Purpose |
|-------------------------------|---------|
| [Name] | [Purpose] |

## Procedural Notes

### State Law Requirements

- **Open Meetings Act**: [State statute citation]
- **FOIA/Public Records**: [State statute citation]
- **Public Hearing Requirements**: [When required — zoning, budget, etc.]
- **Notice Requirements**: [Meeting notice requirements under state law]

### Ethics and Disclosure

- **State Ethics Statute**: [Citation]
- **Local Ethics Ordinance**: [Code reference if applicable]
- **Gift Ban Threshold**: [Amount and source]
- **Financial Disclosure Deadline**: [Date]
- **Ethics Commission/Officer**: [Name or body]
- **Post-Employment Restrictions**: [Summary if applicable]

### Local Rules

- **Rules of Procedure**: [Reference or link to adopted rules]
- **Voting Requirements**: [Simple majority / supermajority requirements]
- **Quorum**: [Number required]

## Technology Context (Optional)

- **Current technology vendors**: [List major SaaS vendors and products]
- **IT staffing**: [Description of internal IT capacity]
- **Technology strategic plan**: [Reference or link if one exists]
- **Key integrations**: [CRM, ERP, agenda management, etc.]

## Regional Context

- **County**: [County name(s)]
- **Metropolitan Planning Organization**: [Name if applicable]
- **Council of Governments**: [Name if applicable]
- **School Districts**: [Name(s)]
- **Other Taxing Bodies**: [List significant overlapping jurisdictions]

---

*Last updated: [Date]*

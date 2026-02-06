# Municipal Configuration

Customize this file with your municipality's specific information. This configuration is used by all skills and commands in the municipal-governance plugin.

## Municipality

- **Name**: [Your City/Town/Village Name]
- **State**: [State]
- **Population**: [Approximate population]
- **Government Type**: [Council-Manager | Mayor-Council | Commission | Town Meeting]
- **Home Rule**: [Yes | No]

## Council Structure

- **Governing Body Title**: [City Council | Board of Trustees | Town Council | etc.]
- **Members**: [Number of members + Mayor/President]
- **Terms**: [Term length and staggering]
- **Districts**: [Ward-based | At-Large | Mixed]
- **Meeting Schedule**: [Day, time, frequency]
- **Meeting Location**: [Address or virtual platform]

## Key Code References

- **Municipal Code Provider**: [Municode | American Legal | Sterling Codifiers | General Code | etc.]
- **Code URL**: [URL to your municipality's online code, e.g., https://library.municode.com/xx/your_city]
- **Zoning Code**: [Title/Chapter reference]
- **Subdivision Code**: [Title/Chapter reference]
- **Building Code**: [Adopted code version]

## Agenda Management

- **System**: [Legistar | Granicus | CivicEngage | manual/email-based | etc.]
- **Public URL**: [URL to your agenda center, e.g., https://yourcity.gov/AgendaCenter]
- **Note**: Plugin works with file-based agenda packets (uploaded PDFs) when no structured agenda API is available

### Active TIF Districts

| District Name | Creation Date | Expiration Date | Purpose |
|--------------|---------------|-----------------|---------|
| [District 1] | [Date] | [Date] | [Economic development focus] |

### Special Districts/Authorities

- [List any special service areas, business improvement districts, etc.]

## Budget Context

- **Fiscal Year**: [Calendar Year Jan-Dec | Fiscal Year Month-Month]
- **General Fund Size**: [Approximate annual budget]
- **Major Revenue Sources**: [Property tax, sales tax, utility tax, state sharing, etc.]
- **Tax Limitations**: [PTELL, Headlee, Prop 13, TABOR, or none]
- **Bond Rating**: [If applicable]

### Fiscal Impact Thresholds

These thresholds are used by commands to flag items for attention:

- **Critical Fiscal Impact**: $[amount, e.g., 500000] — triggers 🔴 classification
- **Significant Fiscal Impact**: $[amount, e.g., 100000] — triggers 🟡 classification
- **Contract Authority Limit**: $[amount requiring council approval, e.g., 50000]
- **Budget Amendment Threshold**: $[amount requiring council approval for line-item transfers]

## Policy Priorities

Current administration/council priorities (update as needed):

1. [Priority area 1]
2. [Priority area 2]
3. [Priority area 3]
4. [Priority area 4]

## Organizational Context

### Key Contacts

- **Chief Executive**: [City Manager/Mayor/Administrator name]
- **City Clerk**: [Name]
- **City Attorney**: [Name or firm]
- **Finance Director**: [Name]
- **Community Development**: [Name]
- **Public Works**: [Name]
- **FOIA Officer**: [Name/Department]

### Standing Committees

| Committee | Chair | Meeting Schedule | Jurisdiction |
|-----------|-------|------------------|--------------|
| [Finance] | [Name] | [Schedule] | [Budget, audit, investments] |
| [Planning] | [Name] | [Schedule] | [Land use, zoning, development] |

## Procedural Notes

### State Law Requirements

- **Open Meetings Act**: [State statute reference]
- **FOIA/Public Records**: [State statute reference]
- **Public Hearing Requirements**: [Key triggers for public hearings]
- **Notice Requirements**: [Required notice periods]

### Ethics and Disclosure

- **State Ethics Statute**: [Statute reference, e.g., State Government Ethics Act]
- **Local Ethics Ordinance**: [Code section reference, if any]
- **Gift Ban Threshold**: [$X de minimis exception amount]
- **Financial Disclosure Deadline**: [Annual filing date]
- **Ethics Commission/Officer**: [Contact or body name]
- **Post-Employment Restrictions**: [Duration and scope, if any]

### Local Rules

- **Rules of Procedure**: [Reference or link]
- **Voting Requirements**: [Simple majority | Supermajority triggers]
- **Quorum**: [Number required]

## Regional Context

- **County**: [County name]
- **Metropolitan Planning Organization**: [MPO name if applicable]
- **Council of Governments**: [COG name if applicable]
- **School Districts**: [Overlapping districts]
- **Other Taxing Bodies**: [Library, park district, fire protection, etc.]

---

*Last updated: [Date]*
*Updated by: [Name/Role]*

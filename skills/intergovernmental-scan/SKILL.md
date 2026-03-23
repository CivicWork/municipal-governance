---
description: >
  This skill should be used when the user needs to scan state and federal
  policy developments for impacts on local government. Triggers include
  any mention of state legislation affecting municipalities, federal
  mandates, intergovernmental policy monitoring, legislative session
  tracking, preemption alerts, grant opportunities, or when the user
  needs to understand how actions at other levels of government affect
  their municipality.
---

# Intergovernmental Scan

Scan state and federal policy developments for impacts on local government.

## Trigger

User invokes `/municipal-governance:intergovernmental-scan`

## Inputs

- Scan scope (state legislative session, federal actions, specific topic)
- Policy areas of interest
- Time period
- Urgency/priority filter

## Workflow

### 1. Load Municipal Context

Check `municipal.local.md` for:
- State
- Home rule status
- Policy priorities
- Regional context (county, MPO, COG)

### 2. Determine Scan Parameters

**Scope Options**:
- Full legislative session scan
- Specific bill/action analysis
- Topic-focused scan
- Deadline-driven scan (upcoming effective dates)

**Priority Filters**:
- 🔴 Direct mandate/preemption
- 🟡 Significant impact likely
- 🟢 Informational/opportunity

### 3. Source Identification

**State Sources**:
- State legislature website
- State municipal league
- Governor's office
- State agency rules
- Attorney General opinions

**Federal Sources**:
- Congress.gov
- Federal Register
- OMB/White House
- Agency announcements
- National League of Cities
- U.S. Conference of Mayors

**Regional Sources**:
- County actions
- MPO/COG activities
- Neighboring jurisdictions
- Special districts

### 4. Conduct Scan

For each relevant development, capture:
- What it is (bill, rule, action)
- Status (proposed, passed, enacted, effective)
- Impact on municipalities
- Timeline (effective dates, comment periods)
- Required local action
- Advocacy opportunity

### 5. Categorize Findings

**Mandates**
- New requirements on municipalities
- Compliance deadlines
- Cost implications
- Implementation guidance

**Preemption**
- Areas where local authority limited
- Existing local ordinances affected
- Workaround possibilities

**Funding/Grants**
- New funding opportunities
- Changes to existing programs
- Application deadlines
- Eligibility requirements

**Authority Changes**
- New powers granted
- Expanded or restricted authority
- Optional adoptions

**Regulatory Changes**
- State agency rules
- Federal regulations
- Compliance requirements

### 6. Generate Scan Report

## Output Format

```markdown
# Intergovernmental Scan Report

**Scan Period**: [Dates]
**State**: [State]
**Focus Areas**: [List if specific]
**Report Date**: [Date]

---

## Executive Summary

**Key Headlines**:
- [Most important finding 1]
- [Most important finding 2]
- [Most important finding 3]

**Action Required By [Date]**:
- [Time-sensitive item]

**Advocacy Alerts**:
- [Pending legislation requiring attention]

---

## Critical Items 🔴

### [Bill/Action Name]

**Type**: [Mandate / Preemption / Funding / Authority]
**Status**: [Introduced / Committee / Passed / Signed / Effective]
**Effective Date**: [Date]

**What It Does**:
[Clear description of the action]

**Impact on [Municipality]**:
[Specific local impact analysis]

**Required Local Action**:
- [ ] [Action item with deadline]
- [ ] [Action item with deadline]

**Cost Implications**: [Estimated fiscal impact]

**Advocacy Position**: [Support/Oppose/Monitor/Amend]

**Resources**:
- [Link to bill text]
- [Municipal league analysis]

---

## Significant Items 🟡

### [Bill/Action Name]

[Same format as above, potentially condensed]

---

## Monitoring Items 🟢

| Item | Type | Status | Impact | Next Action |
|------|------|--------|--------|-------------|
| [Name] | [Type] | [Status] | [Brief impact] | [Watch/Comment/etc.] |

---

## By Topic Area

### Revenue and Finance
- [Item 1]: [Brief description and status]
- [Item 2]: [Brief description and status]

### Land Use and Development
- [Items]

### Public Safety
- [Items]

### Employment and Personnel
- [Items]

### Environment and Utilities
- [Items]

### Transportation
- [Items]

### [Other relevant categories]

---

## Funding Opportunities

### [Program Name]
**Amount Available**: $[X]
**Eligible Uses**: [Description]
**Application Deadline**: [Date]
**Local Match**: [Requirements]
**Status**: [Open/Upcoming/Closed]
**Fit for [Municipality]**: [High/Medium/Low]

---

## Upcoming Deadlines

| Date | Item | Action Required |
|------|------|-----------------|
| [Date] | [Item] | [Action] |

---

## Advocacy Recommendations

### Support
| Item | Reason | Action |
|------|--------|--------|
| [Bill] | [Why support] | [Contact legislator/testify/etc.] |

### Oppose
| Item | Reason | Action |
|------|--------|--------|
| [Bill] | [Why oppose] | [Action] |

### Seek Amendment
| Item | Concern | Proposed Amendment |
|------|---------|-------------------|
| [Bill] | [Issue] | [Suggested change] |

---

## Regional Coordination Notes

### County Actions
- [Relevant county actions]

### MPO/COG Updates
- [Regional planning updates]

### Neighboring Jurisdictions
- [Actions by nearby communities that may affect [Municipality]]

---

## Next Steps

### Immediate Actions (This Week)
1. [Action item]
2. [Action item]

### Short-Term (This Month)
1. [Action item]
2. [Action item]

### Ongoing Monitoring
- [Items to continue watching]

---

## Sources

- [State Legislature]: [URL]
- [Municipal League]: [URL]
- [Federal Source]: [URL]

---

*Scan prepared [date]. Legislative status changes rapidly.
Verify current status before taking action.*
```

## Scan Variations

### Quick Weekly Scan
- Focus on new developments only
- 1-page summary
- Action items only

### Session Summary
- End-of-session comprehensive review
- All enacted legislation
- Effective dates calendar
- Implementation checklist

### Topic Deep Dive
- Single issue comprehensive analysis
- Historical context
- Multi-state comparison
- Implementation options

## Skills Referenced

- `intergovernmental-relations` — preemption analysis, home rule, grants, regional cooperation
- `policy-evaluation` — impact assessment for proposed state/federal actions
- `public-finance` — fiscal impact of mandates, grant opportunities, revenue sharing changes

## Notes

- **Preemption threat monitoring**: Check the state reference in `state-references/` for the current preemption landscape, including pending threats (e.g., Illinois BUILD plan: SB 4060-4064, HB 5626 proposing sweeping preemption of local land use authority). Flag preemption bills affecting local authority as high-priority items.
- Use web search for current legislative status
- Cross-reference multiple sources for accuracy
- Note effective dates prominently
- Distinguish enacted from pending
- Flag items requiring attorney review
- Include advocacy opportunities
- Update regularly during legislative sessions

## Related Skills

- `policy-research` — for deeper research into specific state/federal policy areas
- `budget-review` — for fiscal impact analysis of mandate or funding changes
- `analyze-ordinance` — if state action requires a local ordinance response

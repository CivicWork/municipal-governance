# Budget Review

Analyze budget items, fiscal impacts, and financial proposals.

## Trigger

User invokes `/municipal-governance:budget-review`

## Inputs

- Budget document(s) or specific item to analyze
- Analysis type (full budget review, specific item, amendment, fiscal impact)
- Comparison data (prior year, proposed vs. adopted, peer communities)
- Specific questions or concerns

## Workflow

### 1. Load Municipal Context

Check `municipal.local.md` for:
- Fiscal year (calendar vs. other)
- General fund size
- Major revenue sources
- Tax limitations (PTELL, etc.)
- Policy priorities
- Fund balance policies

### 2. Determine Analysis Scope

**Full Budget Review**:
- Overall revenue and expenditure trends
- Fund balance analysis
- Major changes from prior year
- Alignment with policy priorities

**Specific Item Analysis**:
- Line item detail
- Historical trends
- Peer comparison
- Cost drivers

**Budget Amendment**:
- What's changing
- Funding source
- Impact on fund balance
- Policy implications

**Fiscal Impact Analysis**:
- For proposed projects/policies
- Revenue projections
- Cost projections
- Net fiscal impact

### 3. Conduct Analysis

**Revenue Analysis**:
- Major revenue sources and trends
- Assumptions validation
- Sensitivity analysis
- One-time vs. recurring
- Economic factors

**Expenditure Analysis**:
- Major cost categories
- Personnel costs (typically 60-80%)
- Operating vs. capital
- Contractual obligations
- Discretionary vs. fixed

**Fund Balance Analysis**:
- Current fund balance
- Policy minimums
- Projected year-end
- Trend over time

**Debt Analysis**:
- Outstanding debt
- Debt service burden
- Debt capacity
- Upcoming issuances

### 4. Generate Analysis Report

## Output Format

*Omit any section where data is unavailable. For specific-item analysis, skip full budget sections and focus on the item in question.*

```markdown
# Budget Analysis: [Title/Focus]

**Analysis Date**: [Date]
**Budget Year**: [FY]
**Prepared for**: [Requestor]

---

## Executive Summary

[3-4 paragraph summary of key findings, concerns, and observations]

---

## Budget Overview

### Key Numbers

| Metric | Amount | Change from PY |
|--------|--------|----------------|
| Total Budget | $[X] | [+/-X%] |
| General Fund | $[X] | [+/-X%] |
| Property Tax Levy | $[X] | [+/-X%] |
| Personnel Costs | $[X] | [+/-X%] |
| Capital Investment | $[X] | [+/-X%] |
| Projected Fund Balance | $[X] | [X% of expenditures] |

### Budget by Fund

| Fund | Revenue | Expenditures | Net |
|------|---------|--------------|-----|
| General | $[X] | $[X] | $[X] |
| [Other funds] | | | |

---

## Revenue Analysis

### Revenue Mix

| Source | Amount | % of Total | Trend |
|--------|--------|------------|-------|
| Property Tax | $[X] | [X%] | [↑/↓/→] |
| Sales Tax | $[X] | [X%] | [↑/↓/→] |
| [etc.] | | | |

### Key Revenue Observations

- [Observation 1]
- [Observation 2]

### Revenue Assumptions

| Assumption | Basis | Risk Level |
|------------|-------|------------|
| [Assumption 1] | [How derived] | [Low/Med/High] |

### Revenue Risks

- [Risk 1]
- [Risk 2]

---

## Expenditure Analysis

### Expenditure by Category

| Category | Amount | % of Total | Change |
|----------|--------|------------|--------|
| Personnel | $[X] | [X%] | [+/-X%] |
| Operating | $[X] | [X%] | [+/-X%] |
| Capital | $[X] | [X%] | [+/-X%] |
| Debt Service | $[X] | [X%] | [+/-X%] |

### Expenditure by Department

| Department | Amount | Change | Notes |
|------------|--------|--------|-------|
| [Dept 1] | $[X] | [+/-X%] | [Notable items] |

### Significant Changes

**Increases over [5%]**:
- [Item]: [Amount] - [Reason]

**Decreases over [5%]**:
- [Item]: [Amount] - [Reason]

**New Programs/Positions**:
- [Description]

---

## Personnel Analysis

| Metric | Count/Amount |
|--------|--------------|
| Total FTEs | [X] |
| Change from PY | [+/-X] |
| Salary Budget | $[X] |
| Benefits Budget | $[X] |
| Benefits as % of Salary | [X%] |

### Position Changes
- New positions: [X]
- Eliminated positions: [X]
- Reclassifications: [X]

---

## Fund Balance Analysis

### General Fund Balance

| Category | Amount |
|----------|--------|
| Beginning Balance | $[X] |
| Revenues | $[X] |
| Expenditures | $[X] |
| Ending Balance | $[X] |
| As % of Expenditures | [X%] |

### Fund Balance Policy
- Minimum policy: [X%]
- Current: [X%]
- Status: [Above/At/Below policy]

### Fund Balance Trend

| Year | Balance | % of Exp |
|------|---------|----------|
| [FY-2] | $[X] | [X%] |
| [FY-1] | $[X] | [X%] |
| [FY] Projected | $[X] | [X%] |

---

## Debt Analysis

### Outstanding Debt
- GO Bonds: $[X]
- Revenue Bonds: $[X]
- Other Obligations: $[X]
- **Total**: $[X]

### Debt Metrics
- Debt per capita: $[X]
- Debt as % of EAV: [X%]
- Debt service as % of budget: [X%]

### Upcoming Debt
- [Planned issuances]

---

## Capital Investment

### Capital Budget Summary
- Total capital: $[X]
- Funded from operations: $[X]
- Funded from debt: $[X]
- Funded from grants: $[X]

### Major Projects
| Project | Amount | Funding | Status |
|---------|--------|---------|--------|
| [Project 1] | $[X] | [Source] | [Year X of Y] |

---

## Policy Alignment

### Priority 1: [From municipal.local.md]
- Budget support: [Strong/Moderate/Weak]
- Relevant investments: [List]

### Priority 2: [From municipal.local.md]
[Same format]

---

## Concerns and Questions

### Financial Concerns
1. [Concern with explanation]
2. [Concern with explanation]

### Questions for Staff
1. [Question]
2. [Question]

### Items Warranting Further Review
1. [Item with reason]
2. [Item with reason]

---

## Peer Comparison (if available)

| Metric | [City] | Peer Avg | State Avg |
|--------|--------|----------|-----------|
| Per capita spending | $[X] | $[X] | $[X] |
| Property tax rate | [X] | [X] | [X] |

---

*This analysis is for informational purposes.
Contact Finance Department for clarifications.*
```

## Skills Referenced

- `public-finance` — fund accounting, levy limits, debt analysis, fiscal impact methodology
- `policy-evaluation` — policy alignment analysis, evaluation criteria
- `municipal-code-analysis` — levy ordinance requirements, budget-related code provisions

## Notes

- Tailor depth to analysis type requested
- Always note assumptions and their basis
- Flag items that seem unusual or require explanation
- Compare to prior years for context
- Note one-time items separately
- Distinguish between controllable and non-controllable costs
- Identify structural balance vs. one-time fixes

## Related Commands

- `meeting-prep` — if the budget is on an upcoming meeting agenda
- `policy-research` — for research into policy alternatives with different fiscal profiles
- `intergovernmental-scan` — for state/federal funding changes affecting the budget

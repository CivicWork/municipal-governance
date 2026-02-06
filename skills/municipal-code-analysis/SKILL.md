---
description: >
  This skill should be used when the user needs to analyze, interpret,
  cross-reference, or understand municipal code provisions. Triggers include
  any mention of ordinances, municipal code sections, zoning code, code
  amendments, code compliance, or when evaluating how a proposed action
  relates to existing municipal regulations.
---

# Municipal Code Analysis

## Overview

Municipal codes are the comprehensive body of local law governing a municipality. They are organized by title, chapter, and section, and include everything from zoning regulations to business licensing to public health requirements.

## Code Structure

Most municipal codes follow a hierarchical structure:

- **Title**: Broad subject area (e.g., Title 19 - Zoning)
- **Chapter**: Subdivision of title (e.g., Chapter 19.07 - Residential Districts)
- **Section**: Specific provision (e.g., 19.07.050 - Permitted Uses)

Common title organization:
1. General Provisions / Administration
2. Elections
3. Revenue and Finance
4. Business Licenses and Regulations
5. Health and Safety
6. Animals
7. Public Peace, Morals and Welfare
8. Vehicles and Traffic
9. Streets, Sidewalks and Public Places
10. Parks and Recreation
11. Public Utilities
12. Buildings and Construction
13. Subdivision Regulations
14. Zoning

## Analysis Framework

When analyzing code provisions:

### 1. Identify the Operative Language

- **"Shall"** = mandatory requirement
- **"May"** = permissive/discretionary
- **"Should"** = advisory (rare in code, more common in plans)
- **"Is prohibited"** = absolute prohibition
- **"Upon finding that..."** = conditions precedent

### 2. Check Definitions

- Always reference the definitions section of the relevant title
- Terms may have specific legal meanings that differ from common usage
- Look for both title-specific definitions AND general code definitions
- Note when terms are undefined (may require interpretation)

### 3. Cross-Reference Related Provisions

Code sections rarely stand alone. Always check for:

- Sections explicitly referenced in the provision
- Exceptions and exemptions
- General provisions that apply code-wide
- Penalty/enforcement provisions
- Conflict resolution provisions (which section controls when provisions conflict)
- Related state law requirements

### 4. Consider the Hierarchy of Authority

1. **Federal Constitution** - supreme law
2. **Federal statutes and regulations** - preempt conflicting state/local law
3. **State Constitution** - may grant or limit local authority
4. **State statutes** - often preempt local ordinances on specific topics
5. **Local charter/constitution** (if home rule)
6. **Local ordinances** - municipal code
7. **Administrative rules/regulations** - implement ordinances

### 5. Check Amendment History

- Recent amendments may signal policy direction
- Pending amendments may affect analysis
- Repealed provisions may be relevant for grandfathered uses
- Effective dates matter for applicability

## Home Rule vs. Dillon's Rule

**Home Rule Municipalities**:
- Broad authority to legislate on local matters
- Can act unless specifically prohibited by state law
- Greater flexibility in code drafting
- May have charter that functions as local constitution

**Dillon's Rule (Non-Home Rule)**:
- Limited to powers expressly granted by state
- Must point to specific enabling authority
- Ambiguities resolved against municipal authority
- More constrained in code drafting

## Common Code Analysis Tasks

### Zoning Compliance Check
1. Identify the zoning district
2. Find permitted uses for that district
3. Check if use requires special/conditional use permit
4. Review dimensional requirements (setbacks, height, FAR)
5. Check parking requirements
6. Identify any overlay districts
7. Review nonconforming use provisions if applicable

### Ordinance Amendment Analysis
1. Identify all sections being amended
2. Compare old and new language (redline)
3. Check for internal consistency
4. Verify cross-references remain valid
5. Assess conflicts with other code sections
6. Consider state preemption issues
7. Review procedural requirements for adoption

### Enforcement Analysis
1. Locate violation provisions
2. Identify penalty structure
3. Check enforcement authority
4. Review appeal/hearing procedures
5. Assess statute of limitations
6. Consider due process requirements

## Related Skills

- `land-use-zoning` — zoning code analysis, variance findings, development review
- `public-finance` — levy ordinances, budget-related code provisions, TIF compliance
- `ethics-conflicts` — local ethics ordinance analysis, prohibited transaction provisions
- `open-meetings-foia` — OMA compliance requirements codified in local rules

## Using Connected Tools

- Use `~~municipal-code` to look up specific code sections
- When connected tools are unavailable, note the gap and suggest manual verification

**Planned connectors** (not yet available — plugin works without these):
- `~~agenda-management` — legislation history
- `~~document-management` — staff reports and supporting materials

## Municipal Configuration

Check `municipal.local.md` for:
- Municipality-specific code provider and URL
- Key code references (zoning, subdivision, etc.)
- Active TIF districts and special districts
- State-specific legal framework
- Local procedural requirements

## Procedural Requirements Checklist

When reviewing any action against the code, verify:
- [ ] Public hearing requirements
- [ ] Notice requirements (mail, posting, publication)
- [ ] Voting requirements (simple majority, supermajority)
- [ ] Effective date rules
- [ ] Recording/filing requirements

## Output Template

When producing a code compliance review, use this structure:

```markdown
# Code Compliance Review: [Subject]

## Summary
[Key compliance findings in 2-3 sentences]

## Subject of Review
[Description of what's being reviewed]

## Relevant Code Sections

### Primary Sections
| Section | Title | Relevance |
|---------|-------|-----------|
| [X.XX.XXX] | [Title] | [Why relevant] |

### Supporting Sections
| Section | Title | Relevance |
|---------|-------|-----------|
| [X.XX.XXX] | [Title] | [Why relevant] |

### Definitions (from [Section])
- **[Term 1]**: [Definition]
- **[Term 2]**: [Definition]

## Compliance Analysis

### Authority
- **Legal basis**: [Code section authorizing action]
- **Limitations**: [Any restrictions on authority]
- **Home rule considerations**: [If applicable]

### Requirements
| Requirement | Code Section | Status | Notes |
|-------------|--------------|--------|-------|
| [Requirement 1] | [Section] | ✅/❌/⚠️ | [Details] |
| [Requirement 2] | [Section] | ✅/❌/⚠️ | [Details] |

### Procedural Requirements
- [ ] [Requirement 1] - [Section reference]
- [ ] [Requirement 2] - [Section reference]

## Issues Identified

### Conflicts
| Issue | Sections | Description | Resolution |
|-------|----------|-------------|------------|
| [Issue 1] | [X] vs [Y] | [Description] | [How to resolve] |

### Gaps
- [Gap 1]: [Description]

### Ambiguities
- [Section X]: [Ambiguity description]

## Cross-Reference Check

### References Updated
| Section | Reference | Status |
|---------|-----------|--------|
| [X.XX] | [What it references] | ✅/Needs update |

### Impacted Sections
| Section | Impact | Action Needed |
|---------|--------|---------------|
| [X.XX] | [How affected] | [Update needed] |

## Compliance Determination

**Overall Status**: [Compliant / Non-Compliant / Requires Modification]

**Conditions for Compliance**:
1. [Condition 1]
2. [Condition 2]

## Recommendations

### Required Actions
- [Action 1]

### Suggested Improvements
- [Suggestion 1]

## Caveats
- This analysis is based on [code version/date]
- Complex legal questions should be referred to the municipal attorney
```

## Quality Standards

- Cite specific section numbers
- Quote operative language when important
- Note version/date of code reviewed
- Identify ambiguities honestly
- Flag items requiring attorney review
- Don't overstate certainty on legal questions

## Important Caveats

- Code analysis supports policy deliberation but does not constitute legal advice
- Complex legal questions should be referred to the municipal attorney
- Always verify current code version (codes are frequently amended)
- Online codes may have lag time from recent amendments

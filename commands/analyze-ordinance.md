# Analyze Ordinance

Review a proposed ordinance against the municipality's existing code, policy priorities, and procedural requirements.

## Trigger

User invokes `/municipal-governance:analyze-ordinance`

## Inputs

- Ordinance text (file upload, URL, or pasted text)
- Context: sponsoring department/councilmember, stated purpose, timeline

## Workflow

### 1. Load Municipal Context

Look for the municipality's configuration in local settings (`municipal.local.md`).
If not found, ask for basic municipal context and proceed with general analysis:
- State (for legal framework)
- Home rule status
- Government type

### 2. Parse the Ordinance

Extract and identify:
- Ordinance number
- Title/subject
- Sections being added, amended, or repealed
- Effective date
- Any whereas clauses (legislative findings)

### 3. Code Cross-Reference

Using `~~municipal-code` (when available), identify all existing code sections affected by the proposed ordinance:
- Sections explicitly referenced
- Sections that may conflict
- Sections being superseded
- Related provisions that should be reviewed

Flag any potential conflicts, gaps, or inconsistencies.

### 4. Systematic Analysis

Analyze the ordinance across these dimensions:

**Legal Authority**
- Does the municipality have authority to enact this?
- Home rule powers analysis (if applicable)
- State preemption check
- Dillon's Rule considerations (if non-home rule)
- Constitutional limitations

**Code Conflicts**
- Sections that conflict with the proposal
- Sections that are superseded
- Internal consistency issues
- Cross-reference accuracy

**Fiscal Impact**
- Estimated implementation costs
- Ongoing operational costs
- Revenue implications
- Unfunded mandate concerns
- Budget line items affected

**Implementation Requirements**
- Staff capacity needed
- Enforcement mechanisms required
- Technology or equipment needs
- Training requirements
- Timeline feasibility

**Intergovernmental Implications**
- State law compliance
- Federal requirements
- Neighboring jurisdiction impacts
- Regional coordination needs

**Public Process Requirements**
- Notice provisions required
- Public hearing requirements
- FOIA implications
- Open Meetings Act compliance

### 5. Impact Classification

Classify the ordinance using a three-tier system:

**🟢 ROUTINE**
- Aligns with existing code and policy direction
- Minimal fiscal or operational impact
- No significant public controversy expected
- Routine administrative matter

**🟡 SIGNIFICANT**
- Meaningful policy change
- Moderate fiscal or operational impact
- Requires careful deliberation
- May generate public interest

**🔴 CRITICAL**
- Major fiscal impact (define threshold based on municipal.local.md)
- Significant legal risk or complexity
- High community impact
- Recommend additional review (legal, financial, community)

### 6. Generate Output

Produce a structured briefing including:

**Executive Summary** (2-3 sentences)
- What the ordinance does
- Classification level
- Key recommendation

**Analysis by Category**
- Legal authority assessment
- Code conflict analysis
- Fiscal impact summary
- Implementation considerations
- Intergovernmental implications

**Recommended Questions for Deliberation**
- Questions council should ask before voting
- Areas where additional information is needed
- Policy trade-offs to consider

**Suggested Amendments** (if applicable)
- Technical corrections
- Clarifications recommended
- Alternative approaches to consider

**Related Precedents** (if available via web search)
- How other municipalities have addressed similar issues
- Best practices from peer communities
- Relevant state or federal guidance

## Output Format

```markdown
# Ordinance Analysis: [Title/Number]

## Classification: [🟢 ROUTINE | 🟡 SIGNIFICANT | 🔴 CRITICAL]

## Executive Summary
[2-3 sentence summary]

## Ordinance Overview
- **Number**: [if assigned]
- **Subject**: [topic]
- **Sponsor**: [if known]
- **Effective Date**: [date]
- **Code Sections Affected**: [list]

## Legal Authority
[Analysis]

## Code Analysis
### Sections Amended
[List with brief description]

### Potential Conflicts
[Any identified conflicts or gaps]

## Fiscal Impact
| Category | One-Time | Ongoing |
|----------|----------|---------|
| [Item] | $X | $X/year |

**Total Estimated Cost**: $X
**Funding Source**: [identified/unidentified]

## Implementation Requirements
[Analysis of what's needed to implement]

## Intergovernmental Considerations
[State/federal implications]

## Questions for Deliberation
1. [Question 1]
2. [Question 2]
3. [Question 3]

## Suggested Amendments
[If any]

## Comparable Approaches
[From peer communities, if available]

---
*This analysis supports policy deliberation but does not constitute legal advice.
Complex legal questions should be referred to the municipal attorney.*
```

## Skills Referenced

- `municipal-code-analysis` — code cross-referencing, hierarchy of authority, operative language
- `policy-evaluation` — impact assessment framework, stakeholder analysis
- `public-finance` — fiscal impact methodology
- `ethics-conflicts` — conflict of interest screening for officials voting on the ordinance

## Notes

- When `~~municipal-code` is not available, note code sections that should be manually reviewed
- Always include the legal disclaimer
- Flag any items that require attorney review
- Cross-reference with `municipal.local.md` policy priorities when available

## Related Commands

- `meeting-prep` — if the ordinance is on an upcoming agenda, use meeting-prep for the full briefing
- `policy-research` — for deeper research into the policy area the ordinance addresses
- `budget-review` — for detailed fiscal impact analysis beyond what this command provides

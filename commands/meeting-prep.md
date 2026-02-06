# Meeting Preparation

Generate a comprehensive briefing for an upcoming council or committee meeting.

## Trigger

User invokes `/municipal-governance:meeting-prep`

## Inputs

- Meeting date and type (regular session, committee, special meeting, workshop)
- Agenda packet (file upload or link via `~~agenda-management`)
- Specific items of interest (optional)

## Workflow

### 1. Load Municipal Context

Check `municipal.local.md` for:
- Council structure and committees
- Meeting schedule and procedures
- Policy priorities
- Key contacts

### 2. Retrieve Agenda and Materials

Pull the agenda packet from `~~agenda-management` or accept uploaded documents.

Documents to look for:
- Official agenda
- Staff reports for each item
- Supporting documents (contracts, plans, etc.)
- Prior meeting minutes (for context)

### 3. Agenda Overview

Create a quick-reference summary:

| # | Item | Type | Staff Rec | Fiscal Impact | Attention Level |
|---|------|------|-----------|---------------|-----------------|
| 1 | [Title] | [Action/Info/Hearing] | [Approve/Deny/None] | [$X] | [🟢/🟡/🔴] |

### 4. Categorize Items

**Consent Agenda**
- Identify items on consent
- Flag any that may warrant removal for separate discussion
- Note any with fiscal impact above threshold

**Public Hearings**
- Required notice verification
- Key issues expected
- Quasi-judicial considerations

**Action Items**
- Items requiring a vote
- Supermajority requirements
- Potential controversy

**Informational Items**
- Presentations
- Reports
- Updates

### 5. Synthesize Each Item

For each non-consent item, provide:

**What is Being Asked**
- Specific action requested
- Motion language (if provided)
- Decision options available

**Staff Recommendation**
- Summary of staff position
- Key supporting rationale
- Alternatives considered

**Fiscal Impact**
- Direct costs
- Budget line item
- Ongoing vs. one-time

**Code Implications**
- Any code changes involved
- Trigger ordinance analysis skill if needed

**Key Decision Points**
- Core policy question
- Trade-offs to consider
- Stakeholder perspectives

**Background Context**
- How this item came to council
- Related prior decisions
- Timeline/deadline pressures

### 6. Flag Items Requiring Special Attention

Automatically flag items with:

🔴 **Critical Attention**
- Significant fiscal impact (>threshold from municipal.local.md)
- Code amendments (trigger ordinance analysis)
- Legal risk identified
- Known community controversy
- Supermajority or special voting requirements

🟡 **Elevated Attention**
- Moderate fiscal impact
- Policy direction questions
- Implementation complexity
- Time-sensitive matters

🟢 **Routine**
- Standard approvals
- Informational updates
- Consent-appropriate items

### 7. Check Procedural Requirements

**Open Meetings Compliance**
- Proper notice given?
- Agenda posted timely?
- Notice content adequate?

**Public Hearings**
- Required hearings scheduled?
- Notice published per requirements?
- Quasi-judicial procedures needed?

**Quorum and Voting**
- Expected attendance
- Recusal/abstention anticipated
- Supermajority items identified

### 8. Generate Meeting Briefing

Produce comprehensive briefing document.

## Output Format

*Omit any section that doesn't apply to this meeting. For meetings with few agenda items, a shorter briefing is better than padding thin sections.*

```markdown
# Meeting Briefing
**[Meeting Type]**: [City Council Regular Meeting / Committee Name / etc.]
**Date**: [Date and Time]
**Location**: [Location]

## Quick Reference

### Attention Summary
- 🔴 Critical Items: [count]
- 🟡 Elevated Items: [count]
- 🟢 Routine Items: [count]

### Key Numbers
- Total agenda items: [X]
- Public hearings: [X]
- Consent items: [X]
- Total fiscal impact: $[X]

---

## Agenda Overview

| # | Item | Action | Fiscal | Attention |
|---|------|--------|--------|-----------|
[Table of all items]

---

## Consent Agenda Review

[List consent items with any flags]

**Items to Consider Removing**:
- [Item X] - [reason]

---

## Public Hearings

### [Item Number]: [Title]
**Required by**: [statute/code reference]
**Notice**: [Verified/Check required]
**Key Issues**: [Summary]
**Public Comment Expected**: [Yes/No/Unknown]

---

## Action Items

### [Item Number]: [Title] [🔴/🟡/🟢]

**The Ask**: [Clear statement of what council is being asked to do]

**Staff Recommendation**: [Approve/Deny/Direct staff to...]

**Key Points**:
- [Point 1]
- [Point 2]
- [Point 3]

**Fiscal Impact**: $[amount] - [one-time/ongoing] - [funding source]

**Questions to Consider**:
1. [Question 1]
2. [Question 2]

**Background**: [Brief context]

---

[Repeat for each action item]

---

## Procedural Notes

### Voting Requirements
- Items requiring supermajority: [list]
- Expected recusals: [if known]

### Public Comment
- Scheduled: [yes/no/per rules]
- Time limit: [X minutes per speaker]

### Executive Session
- Scheduled: [yes/no]
- Topics: [if scheduled]

---

## Preparation Checklist

- [ ] Review staff reports for flagged items
- [ ] Prepare questions for [specific items]
- [ ] Review [related documents]
- [ ] [Other preparation tasks]

---
*Briefing prepared for informational purposes.
Contact [staff contact] with questions.*
```

## Skills Referenced

- `parliamentary-procedure` — quorum, voting requirements, motion procedures
- `open-meetings-foia` — notice compliance, closed session procedures
- `public-finance` — fiscal impact analysis for budget items
- `municipal-code-analysis` — code amendment analysis for ordinance items
- `ethics-conflicts` — flag items where officials may need to recuse

## Notes

- Prioritize depth over breadth - focus analysis on 🔴 and 🟡 items
- For consent agenda items, brief descriptions are sufficient
- When agenda management tools are not connected, work from uploaded documents
- Cross-reference policy priorities from `municipal.local.md`
- Include relevant context from prior meetings when available

## Related Commands

- `agenda-synthesis` — for a quicker, lighter-weight agenda summary
- `analyze-ordinance` — for deep analysis of any ordinance on the agenda
- `budget-review` — for detailed fiscal analysis of budget items on the agenda

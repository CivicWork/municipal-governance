---
description: >
  This skill should be used when the user needs to quickly synthesize an
  agenda packet into a digestible briefing format. Triggers include any
  mention of agenda review, agenda summary, upcoming meeting agenda,
  packet synthesis, or when the user needs a fast overview of what's on
  an agenda without a full meeting prep deep-dive.
---

# Agenda Synthesis

Quickly synthesize an agenda packet into a digestible briefing format.

## Trigger

User invokes `/municipal-governance:agenda-synthesis`

## Inputs

- Agenda packet document(s) (PDF, Word, or multiple files)
- Meeting date and type
- Specific items to focus on (optional)

## Workflow

### 0. Quick Scope

Agenda synthesis is designed for speed. Before processing, ask one question:

**"Anything specific you want me to watch for, or should I flag what stands out?"**

If the user names specific items or topics (e.g., "the zoning amendment" or "anything over $500K"), prioritize those in the output. Otherwise, proceed with automatic flagging based on fiscal thresholds and item types.

If the user wants deep analysis of specific items, suggest escalating to `meeting-prep` instead.

### 0.5. Load Municipal Context

Load the municipality's configuration from `municipal.local.md`. Use council structure, meeting schedule, policy priorities, and fiscal thresholds to contextualize the synthesis. If not found, proceed with general analysis.

### 1. Document Intake

Accept agenda packet in various formats:
- Single PDF (most common)
- Multiple PDFs
- Word documents
- Links to online agenda system

### 2. Parse Document Structure

Identify:
- Meeting header (body, date, time, location)
- Agenda items (numbered/lettered)
- Item descriptions
- Staff report locations within packet
- Attachments and exhibits

### 3. Extract Key Information

For each agenda item, extract:
- Item number
- Title/description
- Action type (action, information, hearing, consent)
- Department/presenter
- Staff recommendation (if action item)
- Fiscal impact (if stated)
- Page references in packet

### 4. Quick Classification

Automatically classify items:

🔴 **Needs Close Review**
- Large dollar amounts
- Code changes
- Public hearings
- Contracts over threshold
- Personnel matters
- Controversial topics (detected from context)

🟡 **Standard Review**
- Moderate fiscal items
- Policy decisions
- Appointments
- Reports requiring action

🟢 **Consent/Routine**
- Minutes approval
- Routine contracts
- Informational items
- Standard renewals

### 5. Generate Synthesis

## Output Format

```markdown
# Agenda Synthesis
**Meeting**: [Body Name]
**Date**: [Date and Time]
**Location**: [Location]
**Packet Pages**: [Total]

---

## At a Glance

| Metric | Count |
|--------|-------|
| Total Items | [X] |
| Action Items | [X] |
| Public Hearings | [X] |
| Consent Items | [X] |
| Informational | [X] |
| Est. Meeting Length | [X hours] |

### Fiscal Summary
- Total new spending: $[X]
- Largest single item: $[X] ([Item name])
- Revenue items: $[X]

### Items Flagged for Attention
1. 🔴 [Item X]: [Brief reason]
2. 🔴 [Item Y]: [Brief reason]
3. 🟡 [Item Z]: [Brief reason]

---

## Consent Agenda
*Items typically approved in bulk without discussion*

| # | Item | Amount | Note |
|---|------|--------|------|
| [A] | [Description] | $[X] | [Any flag] |

**Consider pulling**: [Item X - reason]

---

## Public Hearings

### [Item #]: [Title]
**Purpose**: [What the hearing is for]
**Required by**: [Statute/code]
**Staff Rec**: [Recommendation]
**Key Issue**: [One sentence summary]
📄 Staff report: p. [X]

---

## Action Items

### [Item #]: [Title] 🔴
**The Ask**: [What council is being asked to do]
**Staff Rec**: [Approve/Deny/etc.]
**Fiscal**: $[X] ([source])
**Key Points**:
- [Point 1]
- [Point 2]
📄 Staff report: p. [X]

### [Item #]: [Title] 🟡
[Same format]

---

## Informational Items

### [Item #]: [Title]
**Topic**: [Brief description]
**Presenter**: [Name/Dept]
**Time Est**: [X min]
📄 Materials: p. [X]

---

## Packet Navigation

| Section | Page Range |
|---------|------------|
| Agenda | p. 1-[X] |
| [Item 1] Staff Report | p. [X]-[Y] |
| [Item 2] Staff Report | p. [X]-[Y] |
| Attachments | p. [X]-end |

---

*Synthesis generated [timestamp].
Review full packet for complete information.*
```

## Variations

### Quick Mode
When user needs rapid turnaround:
- Focus on flagged items only
- Brief descriptions
- Skip detailed analysis
- Provide page references for follow-up

### Deep Dive Mode
When user requests thorough analysis:
- Invoke full meeting-prep workflow
- Include questions for each item
- Cross-reference with municipal code
- Check against policy priorities

### Single Item Focus
When user specifies particular items:
- Provide full analysis of specified items
- Brief summary of others
- Cross-reference related items

## Skills Referenced

- `parliamentary-procedure` — item classification, voting requirements
- `public-finance` — fiscal impact flagging for budget items

## Notes

- For deeper analysis of flagged items, apply the Standard Deliberation Question Framework from the `meeting-prep` skill (fiscal impact, legal/compliance, policy alignment, community impact, alternatives, timeline, risk)
- Prioritize speed for standard synthesis
- Escalate to meeting-prep for comprehensive needs
- Always provide page references
- Flag items that warrant further analysis
- Note any parsing uncertainties
- Handle varying packet formats gracefully

## Related Skills

- `meeting-prep` — for a comprehensive deep-dive briefing (use agenda-synthesis for quick turnaround, meeting-prep for thorough preparation)
- `analyze-ordinance` — for detailed analysis of any ordinance item flagged in the synthesis

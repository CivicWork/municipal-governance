# Policy Research

Conduct comprehensive multi-source research on a municipal policy topic.

## Trigger

User invokes `/municipal-governance:policy-research`

## Inputs

- Policy topic or question
- Research scope (quick scan vs. comprehensive analysis)
- Specific aspects of interest
- Deadline or time constraints

## Workflow

### 1. Clarify Research Question

Ensure clear understanding of:
- What specific question needs answering?
- What decision will this inform?
- What level of depth is needed?
- What's the timeline?

### 2. Load Context

Check `municipal.local.md` for:
- Current policy priorities
- State (for legal framework)
- Population/demographics (for peer selection)
- Existing related policies

### 3. Research Framework

Structure research across these dimensions:

**Legal Framework**
- State statutory requirements
- State preemption issues
- Home rule considerations
- Federal requirements

**Local Policy Landscape**
- Current municipal code provisions
- Related policies and ordinances
- Recent council actions
- Pending initiatives

**Peer Community Practices**
- Similar-sized communities in state
- Regional peer practices
- National best practices
- Innovative approaches

**Academic/Expert Resources**
- ICMA resources
- Municipal league publications
- Academic research
- Government reports

**Stakeholder Perspectives**
- Who is affected?
- What positions exist?
- What concerns are raised?
- What solutions are proposed?

### 4. Conduct Research

**Internal Sources** (when connected):
- `~~municipal-code`: Current code provisions
- `~~document-management`: Prior staff reports, studies
- `~~agenda-management`: Historical council actions

**External Sources** (via web search):
- State municipal league resources
- National League of Cities
- ICMA knowledge network
- State statutes and regulations
- Peer community ordinances
- Academic publications
- News coverage

### 5. Synthesize Findings

Organize findings by:
- What we know
- What the options are
- What the trade-offs are
- What we still need to learn

### 6. Generate Research Report

## Output Format

*Omit any section where no data is available. For quick scan scope, use only the Executive Summary, Key Findings, and Recommendations sections.*

```markdown
# Policy Research: [Topic]

**Research Date**: [Date]
**Requested by**: [if known]
**Scope**: [Quick Scan / Comprehensive Analysis]

## Executive Summary

[3-4 paragraph summary of key findings and implications]

## Research Question

[Clear statement of the question being addressed]

## Background

### Current Situation
[Description of status quo in the municipality]

### Why This Matters Now
[Impetus for the research - what's driving the question]

---

## Legal Framework

### State Law
[Relevant state statutes and requirements]

### Federal Requirements
[Any applicable federal law]

### Preemption Issues
[State preemption concerns, if any]

### Home Rule Implications
[How home rule status affects options]

---

## Current Local Policy

### Existing Code Provisions
[Relevant municipal code sections]

### Related Policies
[Connected policies and initiatives]

### Recent Council Actions
[Relevant decisions from past X years]

---

## What Other Communities Are Doing

### In-State Peers
| Community | Population | Approach | Results |
|-----------|------------|----------|---------|
| [City A] | [X] | [Description] | [Outcome] |
| [City B] | [X] | [Description] | [Outcome] |

### Regional Approaches
[Summary of regional practices]

### National Best Practices
[Notable approaches from around the country]

### Innovative Models
[Cutting-edge or experimental approaches]

---

## Policy Options

### Option 1: [Name]
**Description**: [What this approach entails]
**Pros**:
- [Advantage 1]
- [Advantage 2]
**Cons**:
- [Disadvantage 1]
- [Disadvantage 2]
**Fiscal Impact**: [Estimated costs]
**Implementation**: [What it would take]

### Option 2: [Name]
[Same structure]

### Option 3: [Name]
[Same structure]

---

## Stakeholder Perspectives

### [Stakeholder Group 1]
- Position: [Support/Oppose/Mixed]
- Key concerns: [What they care about]
- Proposed solutions: [What they suggest]

### [Stakeholder Group 2]
[Same structure]

---

## Key Considerations

### Fiscal Implications
[Summary of financial considerations across options]

### Implementation Challenges
[Common challenges to anticipate]

### Political Considerations
[Political dynamics to be aware of]

### Timing Factors
[Deadlines, windows of opportunity, sequencing]

---

## Gaps and Uncertainties

### What We Don't Know
- [Gap 1]
- [Gap 2]

### Recommended Additional Research
- [Suggestion 1]
- [Suggestion 2]

---

## Preliminary Assessment

[Analysis of which options seem most promising and why,
acknowledging this is staff-level research, not recommendation]

---

## Sources

### Documents Reviewed
- [Document 1]
- [Document 2]

### Communities Contacted
- [Community 1] - [Contact name if applicable]

### Web Sources
- [Source 1] - [URL]
- [Source 2] - [URL]

---
*This research is intended to inform policy deliberation.
Recommendations should be developed through the normal staff process.*
```

## Skills Referenced

- `policy-evaluation` — Bardach framework, evaluation criteria, decision matrices
- `intergovernmental-relations` — state/federal context, preemption analysis, peer comparisons
- `public-finance` — fiscal impact methodology, revenue/expenditure analysis

## Notes

- Scale depth to scope requested (quick scan vs. comprehensive)
- Always cite sources
- Distinguish between facts, analysis, and opinion
- Flag areas of uncertainty
- Suggest follow-up research when warranted
- Include contact information for peer communities when possible

## Related Commands

- `analyze-ordinance` — if the research leads to a specific ordinance proposal
- `intergovernmental-scan` — for state/federal context on the policy area
- `budget-review` — for fiscal impact analysis of policy options

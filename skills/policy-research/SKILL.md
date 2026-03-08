---
description: >
  This skill should be used when the user needs to conduct comprehensive
  multi-source research on a municipal policy topic. Triggers include any
  mention of policy research, policy analysis, best practices research,
  peer community comparison, policy options evaluation, or when the user
  needs to research a policy question to inform an upcoming decision,
  long-range planning, or council deliberation.
---

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

### 1. Scope the Research

Before beginning research, have a brief conversation with the user to focus the work:

1. **"What decision does this inform, and when?"** — A vote next Tuesday needs different output than a long-range planning question. This sets depth and urgency.
2. **"What do you already know?"** — The user often has context from staff conversations, committee discussions, or personal experience. Don't waste time researching what they can tell you in a sentence.
3. **"Quick scan or deep dive?"** — Quick scan: executive summary, key findings, top 3 peer examples (15-minute read). Deep dive: full legal framework, comprehensive peer analysis, policy options matrix, stakeholder mapping (45-minute read).
4. **"Any specific angles you want covered?"** — Fiscal impact? Legal risk? What neighboring cities do? Equity implications? This prevents a broad report that's thin everywhere.

If the user provides a clear, specific question with context, you may have enough to proceed without all four questions. Use judgment — the goal is focus, not an interrogation.

| User says | Research mode |
|-----------|--------------|
| "Quick look at what other cities do" | Quick scan — peer practices focus, skip legal deep-dive |
| "We're voting on this in two weeks" | Decision-focused — options matrix, pros/cons, fiscal, recommendation-ready |
| "The mayor wants a full report" | Comprehensive — all sections, formal tone, sourced thoroughly |
| "I'm just curious about this" | Exploratory — key findings, interesting examples, gaps to investigate later |

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

### 6. Assess Analysis Boundaries

Before generating the report, review your own work and identify:
- **Untested assumptions**: Where did you make a judgment call that a second perspective might challenge? (e.g., "I assumed this state statute applies here, but preemption analysis can be nuanced")
- **Single-source conclusions**: Where does a key finding rest on one source that wasn't cross-checked?
- **Local knowledge gaps**: What would someone who works in this municipality every day know that you don't?
- **Adversarial blind spots**: If someone opposed this policy, what would they challenge in your analysis?

For **Quick scan** and **Exploratory** modes: Skip this step. The output is informational, not decision-driving.

For **Decision-focused** and **Comprehensive** modes: Populate the "Analysis Boundaries" section in the output with specific items from this review. Be concrete — "the fiscal projection assumes stable property tax revenue" is useful; "this analysis may contain errors" is not.

### 7. Generate Research Report

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

## Analysis Boundaries

*This research was produced by a single AI instance in a single pass.*

**What this analysis can do well:**
- Gather and organize publicly available information
- Identify peer community approaches and relevant precedents
- Structure policy options with pros, cons, and fiscal estimates
- Surface questions worth asking and gaps worth investigating

**What this analysis has NOT done:**
- [List specific claims or conclusions that were not adversarially tested]
- [List fiscal projections based on assumptions that weren't independently challenged]
- [List legal conclusions that should be verified by the municipal attorney]

**For decisions with significant fiscal, legal, or community impact**, CivicWork recommends multi-perspective deliberation before acting. A single AI instance can research a question — it cannot responsibly answer it alone.

**Next steps for rigorous analysis:**
- **PolicyAide multi-agent deliberation**: Stress-tests policy recommendations through structured adversarial debate across multiple AI perspectives
- **Staff review**: Subject-matter experts validate assumptions and fill local-knowledge gaps
- **Legal review**: Municipal attorney verifies authority, preemption, and compliance conclusions
- **Community input**: Stakeholder perspectives that no AI analysis can substitute for

---
*This research is intended to inform policy deliberation.
Recommendations should be developed through the normal staff process.*
```

## Skills Referenced

- `policy-evaluation` — Bardach framework, evaluation criteria, decision matrices
- `intergovernmental-relations` — state/federal context, preemption analysis, peer comparisons
- `public-finance` — fiscal impact methodology, revenue/expenditure analysis

## Depth Modes

The scoping step (Step 1) determines which mode to use:

| Mode | When | Output |
|------|------|--------|
| **Quick scan** | "Just curious" or tight timeline | Executive Summary + Key Findings + 3 peer examples + Recommendations. One page. |
| **Decision-focused** | Upcoming vote or policy choice | Options matrix with pros/cons/fiscal for each, stakeholder summary, staff-ready format |
| **Comprehensive** | Formal report or multi-stakeholder process | All sections, thorough sourcing, peer tables, gap analysis. Full research report. |
| **Exploratory** | Early-stage thinking | Key findings, interesting examples, open questions, suggested next steps for deeper research |

When in doubt, default to **Decision-focused** — it serves the most common use case (an official preparing for a deliberation).

## Notes

- Match depth to the mode selected in scoping — a quick scan should be one page, not ten
- Always cite sources
- Distinguish between facts, analysis, and opinion
- Flag areas of uncertainty with confidence indicators (see CLAUDE.md)
- Suggest follow-up research when warranted
- Include contact information for peer communities when possible

## Related Commands

- `analyze-ordinance` — if the research leads to a specific ordinance proposal
- `intergovernmental-scan` — for state/federal context on the policy area
- `budget-review` — for fiscal impact analysis of policy options

---
description: >
  This skill should be used when the user needs to understand what open-source
  or self-hosted alternatives exist for a municipal software category, assess
  replacement feasibility, or plan a migration from a vendor product. Triggers
  include any mention of open-source alternatives, vendor replacement, self-hosted
  options, build-vs-buy for a specific software category, or when vendor-evaluate
  produces a build feasibility spec and the user wants to know where to start.
---

# Municipal Software Alternatives

## Overview

This skill provides a structured knowledge base of municipal software categories, the open-source landscape for each, and honest assessments of replacement feasibility. It is referenced by the `vendor-evaluate` workflow to produce Replacement Roadmaps.

The municipal software market has a consistent pattern: vendors take commodity open-source capabilities, add a government-specific configuration layer, and sell the result as a specialized product at a significant markup. In some categories, that government layer is genuinely complex and worth paying for. In others, it's a thin wrapper that a municipality could configure itself.

This skill helps distinguish between the two.

## Replacement Tier System

Every municipal software category falls into one of four tiers based on the current state of open-source alternatives:

### Tier 1 — Deploy and Configure
Mature open-source project exists. Needs municipal-specific configuration, compliance setup, and deployment guidance — but the core software works.

**What this means for the user**: You can realistically replace the vendor with an open-source alternative. The work is configuration and deployment, not software development. A technically capable IT generalist with good documentation can do this.

### Tier 2 — Municipal Wrapper Needed
Open-source building blocks exist but nobody has assembled them into a municipal-ready solution. Requires building the government-specific layer on top of existing tools.

**What this means for the user**: Replacement is feasible but requires development work — either a developer on staff, a contractor, or a community effort. This is a project, not a configuration task. Consider whether the vendor cost justifies the build effort.

### Tier 3 — Build from Scratch
No viable open-source starting point. The entire application would need to be purpose-built.

**What this means for the user**: This is a significant software development project. Unless your municipality has unusual technical capacity or this is a strategic priority, the vendor is probably the right answer for now. Watch for community efforts that may change this.

### Tier 4 — Keep the Vendor
The domain is too specialized, too compliance-heavy, or too deeply integrated for self-hosting to make sense. The vendor genuinely earns their fee here.

**What this means for the user**: This is not a good candidate for replacement. Focus negotiation on data ownership, portability provisions, and favorable contract terms. The vendor-assess skill's lock-in mitigation strategies are more relevant than replacement.

## Municipal Software Categories

### Website / CMS
**Tier: 1 — Deploy and Configure**

**Current vendor landscape**: CivicPlus, Granicus (govAccess), Civic CMS, ProudCity
**Typical municipal spend**: $5,000-$30,000/year

**Open-source alternatives**:
- **WordPress** — Powers ~43% of all websites globally. Extremely mature ecosystem. Multiple government-specific themes available. Largest plugin ecosystem of any CMS.
- **Drupal** — More complex than WordPress but more flexible. Australia's GovCMS is Drupal-based. Strong accessibility features. Better for complex site architectures.

**What the vendor adds (and what you'd need to configure yourself)**:
- ADA/WCAG 2.1 AA accessibility compliance — achievable with accessibility-focused themes and plugins, but requires deliberate configuration and testing
- Government-specific templates (meeting calendars, department pages, staff directories, news/alerts)
- Integrated agenda posting and document management
- Emergency alert integration
- Multi-language support

**Municipal configuration needed**:
- Accessibility-compliant theme selection and testing
- Meeting calendar integration
- Agenda packet archive page
- FOIA request portal / online form
- ADA compliance audit (automated + manual)
- SSL, security hardening, backup schedule
- Staff training on content management

**Deployment complexity**: Low-Medium. WordPress hosting is commodity ($20-100/month). The real work is accessibility compliance and initial content migration.

**Recommended starting approach**: Managed WordPress hosting (WP Engine, Pantheon, or similar) + government accessibility theme + content migration from current site.

---

### Document Management / Records
**Tier: 1 — Deploy and Configure**

**Current vendor landscape**: Laserfiche, DocuWare, OpenText, Hyland OnBase
**Typical municipal spend**: $10,000-$50,000/year

**Open-source alternatives**:
- **Paperless-ngx** — Modern, actively maintained document management. Excellent OCR, tagging, search. Large community. Self-hosted.
- **Alfresco Community Edition** — Enterprise-grade document management. More complex but more capable. Workflow engine included.

**What the vendor adds**:
- Records retention schedule automation (destroy-after-X-years by document type)
- FOIA response workflow integration
- Closed session document handling with restricted access
- Audit trail for compliance
- State-specific records retention rules pre-configured

**Municipal configuration needed**:
- Records retention schedule setup (from state reference or municipal records policy)
- Access control for sensitive documents (closed session materials, personnel files)
- FOIA tag/category for responsive record identification
- Backup and disaster recovery plan
- Integration with email archiving

**Deployment complexity**: Medium. The software is straightforward; the records management policies require attention.

**Recommended starting approach**: Paperless-ngx on a local server or VM. Start with one department as a pilot before municipality-wide rollout.

---

### GIS / Mapping
**Tier: 2 — Municipal Wrapper Needed**

**Current vendor landscape**: Esri (ArcGIS), Mapbox (via integrators)
**Typical municipal spend**: $15,000-$75,000/year (Esri licensing is notoriously complex)

**Open-source alternatives**:
- **PostGIS** — PostgreSQL extension for spatial data. Industry standard for open-source GIS data management.
- **QGIS** — Desktop GIS application. Full-featured alternative to ArcGIS Desktop.
- **GeoServer** or **MapServer** — Serve map data as web services.
- **MapLibre** / **OpenLayers** / **Leaflet** — Client-side web mapping libraries.

**What the vendor adds**:
- Integrated platform (data management + analysis + web publishing in one)
- Municipal-specific data models (parcels, zoning, utilities, addresses)
- Public-facing map portal (ArcGIS Hub)
- Integration with county assessor and state GIS data
- Mobile field data collection
- Pre-built municipal workflows (permit tracking on map, 311 visualization)

**Municipal wrapper needed**:
- Municipal parcel/zoning data model on PostGIS
- Public-facing web map portal (Leaflet or MapLibre + GeoServer)
- Integration with county GIS data feeds
- Staff-facing analysis tools

**Deployment complexity**: Medium-High. Requires GIS knowledge for initial setup. Many regional planning agencies provide technical assistance.

**Why this is Tier 2, not Tier 1**: The individual tools are mature and production-ready. But assembling them into a cohesive municipal GIS platform with a public-facing portal requires integration work that nobody has packaged as a turnkey solution.

---

### Constituent Services / 311 / CRM
**Tier: 2 — Municipal Wrapper Needed**

**Current vendor landscape**: CivicPlus (RequestTracker), SeeClickFix, PublicStuff, QAlert
**Typical municipal spend**: $8,000-$40,000/year

**Open-source alternatives**:
- **Zammad** — Modern helpdesk/ticketing with email, phone, chat integration. Could be adapted for constituent services.
- **osTicket** — Simple, mature ticketing system. Lower complexity than Zammad.
- **ERPNext** — Open-source ERP with CRM module. Overkill for pure 311 but capable.

**What the vendor adds**:
- Public-facing intake portal (web + mobile app)
- Routing to departments based on request type
- GIS integration (pin requests on a map, route by geographic area)
- Status tracking and notifications to constituents
- Reporting dashboard for management
- Integration with municipal website

**Municipal wrapper needed**:
- Public intake form (web-based, mobile-responsive)
- Department routing rules
- Status notification system (email/SMS)
- Simple reporting dashboard
- Integration with municipal website and GIS

**Deployment complexity**: Medium. The core ticketing functionality exists; the public-facing portal and department routing are the municipal-specific parts.

---

### Agenda Management / Legislation Tracking
**Tier: 3 — Build from Scratch**

**Current vendor landscape**: Legistar (Granicus), PrimeGov, Municode Meetings, BoardDocs
**Typical municipal spend**: $10,000-$40,000/year

**Open-source alternatives**: Essentially none that are production-ready.
- **Open Civic Data** — A data specification for legislative data, not deployable software.
- Various abandoned projects (OpenLegislation, Council Data Project) — research/academic projects, not maintained.

**What the vendor provides (and why it's hard to replicate)**:
- Full legislation lifecycle management (introduction → committee → hearing → vote → codification)
- Agenda packet assembly and publishing
- Voting record tracking
- Public meeting calendar with legal notice compliance
- Document versioning (ordinance amendments through readings)
- Integration with code publisher (Legistar → Municode)
- Public-facing legislative search
- Roll call vote recording

**Why this is Tier 3**: The workflow is genuinely complex — it tracks legislation through a multi-step process with legal requirements at each stage (notice periods, hearing requirements, reading requirements). No open-source project has implemented the full workflow.

**Future opportunity**: This is a high-value category where a well-executed open-source alternative could serve thousands of municipalities. CivicWork's municipal-pipeline project addresses part of this (code search and publishing). A full agenda management system is a significant but high-impact project.

---

### Permitting / Licensing / Code Enforcement
**Tier: 3 — Build from Scratch**

**Current vendor landscape**: Tyler Technologies (EnerGov), Accela, CityView, ViewPoint
**Typical municipal spend**: $20,000-$100,000+/year

**Open-source alternatives**: None production-ready for municipal permitting.

**What the vendor provides**:
- Permit application intake (public portal)
- Workflow routing (application → plan review → inspection → approval)
- Fee calculation and payment processing
- Inspector mobile app (field inspections)
- Code enforcement case management
- Integration with GIS (parcel-based)
- State building code compliance checklists
- License renewal tracking

**Why this is Tier 3**: Permitting workflows are deeply configurable per municipality (each has different permit types, review steps, fee schedules, and inspection requirements). The vendor earns their fee by providing a configurable workflow engine, not just software.

---

### Meeting Video / Streaming
**Tier: 1 — Deploy and Configure**

**Current vendor landscape**: Granicus (streaming + archive), Swagit, Cablecast
**Typical municipal spend**: $5,000-$25,000/year

**Open-source alternatives**:
- **OBS Studio** — Free, professional-grade recording and streaming software.
- **YouTube Live** — Free streaming with automatic archiving and public access.
- **PeerTube** — Self-hosted video platform (if you want to avoid YouTube dependency).

**What the vendor adds**:
- Agenda-indexed video (click an agenda item, jump to that point in the video)
- Closed captioning
- Archival with searchable transcripts
- Integration with cable access channels
- Multi-camera switching

**Municipal configuration needed**:
- Camera setup (one fixed camera is sufficient for most small councils)
- OBS configured for streaming to YouTube
- YouTube channel setup with meeting playlist structure
- Closed captioning (YouTube auto-captions are adequate; professional captioning is better for ADA)
- Link from municipal website to YouTube archive

**Deployment complexity**: Low. A camera, a computer running OBS, and a YouTube account. The agenda-indexed video feature is the main thing you lose — for most ~15K municipalities, that's an acceptable tradeoff.

---

### Financial / ERP Systems
**Tier: 4 — Keep the Vendor**

**Current vendor landscape**: Tyler Technologies (Munis, Incode), BS&A Software, Caselle, Springbrook (Accela)
**Typical municipal spend**: $30,000-$150,000+/year

**Why this is Tier 4**:
- GASB fund accounting is a specialized domain with strict compliance requirements
- State-specific reporting formats (Annual Financial Report, tax levy calculations)
- Payroll integration with state pension systems (IMRF, police/fire pensions)
- Utility billing with complex rate structures
- Bank reconciliation, accounts payable/receivable
- Annual audit support and auditor access
- The consequences of financial system errors are severe (missed payroll, incorrect tax bills, audit findings)

**No credible open-source alternative exists** for municipal fund accounting. The closest general-purpose tools (ERPNext, Odoo) lack GASB compliance, fund accounting structure, and government-specific reporting.

**Recommended approach**: Focus contract negotiation on data ownership, export capabilities, and API access. Ensure the municipality can extract its financial data in standard formats. Negotiate favorable renewal terms. This is a category where the vendor genuinely earns their fee.

---

### Pension Administration
**Tier: 4 — Keep the Vendor**

This is administered by the pension fund (IMRF, police/fire pension boards), not typically a municipal vendor choice. Not a replacement candidate.

---

### Code Publishing
**Tier: 2 — Municipal Wrapper Needed**

**Current vendor landscape**: Municode (CivicPlus), American Legal Publishing, General Code (ICC)
**Typical municipal spend**: $5,000-$20,000/year (plus per-ordinance codification fees)

**Open-source alternatives**:
- **CivicWork Municipal Pipeline** — Crawler, search, and export tools for municipal code data. Currently handles Municode-hosted codes. Open source.
- **State-decoded** — Open-source project for parsing and publishing legal codes. Inactive but architecturally relevant.

**What the vendor adds**:
- Professional codification (integrating new ordinances into the code structure)
- Legal accuracy verification (cross-reference checking, conflict detection)
- Hosted, searchable, mobile-responsive public code website
- Supplementation scheduling (regular updates as ordinances pass)
- Print publication (still required in some jurisdictions)

**Municipal wrapper needed**:
- Automated codification workflow (ordinance → integration → publication)
- Public-facing searchable code website
- Version history and track-changes
- Cross-reference linking

**Note**: CivicWork's municipal-pipeline already provides the data layer (crawler, FTS search, export). A full code publishing replacement would build on this foundation.

---

## Using This Skill

### When Referenced by vendor-evaluate

When the `vendor-evaluate` workflow identifies the software category of the vendor being evaluated, this skill provides:
1. The tier classification for that category
2. Specific open-source alternatives with maturity assessment
3. Municipal-specific configuration requirements
4. Deployment complexity rating
5. Honest assessment of what you gain and lose by replacing the vendor

### When Used Directly

Users may ask about alternatives for a software category without a specific vendor contract to evaluate. In that case:
1. Identify the software category from the user's description
2. Present the tier classification and reasoning
3. If Tier 1 or 2, outline the recommended starting approach
4. If Tier 3 or 4, explain why and suggest contract negotiation strategies instead
5. Always calibrate advice to the municipality's IT capacity (from `municipal.local.md`)

### Key Principles

- **Honesty over advocacy**: Not everything should be replaced. Credibility depends on telling users when the vendor is the right answer.
- **Capacity-calibrated**: Recommendations must account for the target audience — one IT generalist at a ~15,000 population municipality. A replacement that requires a DevOps team is not a replacement.
- **Plain language**: The user is a city manager or council member, not a developer. "Set up a PostgreSQL database with PostGIS extensions" means nothing. "Install mapping software on a server" is better.
- **Start small**: Always recommend a pilot before full migration. One department, one workflow, one use case — prove it works before committing.
- **Vendor respect**: Vendors provide real value. The goal is not to demonize vendors but to make the costs, tradeoffs, and alternatives legible so municipalities can make informed decisions.

## Related Skills

- **`vendor-evaluate`** — Primary consumer of this skill; produces the vendor evaluation that triggers replacement roadmap generation
- **`vendor-assessment`** — Lock-in assessment frameworks, build-vs-buy analysis methodology
- **`public-finance`** — Cost comparison methodology, fiscal impact classification
- **`policy-research`** — Peer community comparison for how other municipalities handle the same capability

## Municipal Configuration

Check `municipal.local.md` for:
- Current technology contracts and systems in use
- IT staffing capacity
- Technology-related policy priorities
- Budget context for technology spending

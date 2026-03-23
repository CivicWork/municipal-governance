#!/usr/bin/env bash
# Municipal Governance Plugin — SessionStart configuration check
# Verifies that the plugin is configured before the user starts working.

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$0")")}"
CONFIG_FILE="${PLUGIN_ROOT}/municipal.local.md"
STATE_REF_DIR="${PLUGIN_ROOT}/state-references"

# Check 1: Does municipal.local.md exist?
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Municipal Governance plugin is not configured yet."
  echo ""
  echo "To get started:"
  echo "  - In Cowork: Click 'Customize plugin settings' on the home screen"
  echo "  - In Claude Code: Run the setup-municipality agent"
  echo ""
  echo "Configuration is required for municipality-specific analysis."
  exit 0
fi

# Check 2: Is the state field populated (not a bracket placeholder)?
STATE=$(grep -i "^\- \*\*State\*\*:" "$CONFIG_FILE" 2>/dev/null | head -1 | sed 's/.*\*\*State\*\*:\s*//' | xargs)

if [ -z "$STATE" ] || echo "$STATE" | grep -q '^\[' ; then
  echo "Municipal Governance plugin: municipality configured but state is not set."
  echo "Update your configuration to set the state for jurisdiction-specific guidance."
  exit 0
fi

# Check 3: Does a state reference exist for this state?
# Map common state names to abbreviations for file lookup
STATE_UPPER=$(echo "$STATE" | tr '[:lower:]' '[:upper:]')
case "$STATE_UPPER" in
  ALABAMA) ABBR="AL" ;; ALASKA) ABBR="AK" ;; ARIZONA) ABBR="AZ" ;; ARKANSAS) ABBR="AR" ;;
  CALIFORNIA) ABBR="CA" ;; COLORADO) ABBR="CO" ;; CONNECTICUT) ABBR="CT" ;; DELAWARE) ABBR="DE" ;;
  FLORIDA) ABBR="FL" ;; GEORGIA) ABBR="GA" ;; HAWAII) ABBR="HI" ;; IDAHO) ABBR="ID" ;;
  ILLINOIS) ABBR="IL" ;; INDIANA) ABBR="IN" ;; IOWA) ABBR="IA" ;; KANSAS) ABBR="KS" ;;
  KENTUCKY) ABBR="KY" ;; LOUISIANA) ABBR="LA" ;; MAINE) ABBR="ME" ;; MARYLAND) ABBR="MD" ;;
  MASSACHUSETTS) ABBR="MA" ;; MICHIGAN) ABBR="MI" ;; MINNESOTA) ABBR="MN" ;; MISSISSIPPI) ABBR="MS" ;;
  MISSOURI) ABBR="MO" ;; MONTANA) ABBR="MT" ;; NEBRASKA) ABBR="NE" ;; NEVADA) ABBR="NV" ;;
  "NEW HAMPSHIRE") ABBR="NH" ;; "NEW JERSEY") ABBR="NJ" ;; "NEW MEXICO") ABBR="NM" ;; "NEW YORK") ABBR="NY" ;;
  "NORTH CAROLINA") ABBR="NC" ;; "NORTH DAKOTA") ABBR="ND" ;; OHIO) ABBR="OH" ;; OKLAHOMA) ABBR="OK" ;;
  OREGON) ABBR="OR" ;; PENNSYLVANIA) ABBR="PA" ;; "RHODE ISLAND") ABBR="RI" ;; "SOUTH CAROLINA") ABBR="SC" ;;
  "SOUTH DAKOTA") ABBR="SD" ;; TENNESSEE) ABBR="TN" ;; TEXAS) ABBR="TX" ;; UTAH) ABBR="UT" ;;
  VERMONT) ABBR="VT" ;; VIRGINIA) ABBR="VA" ;; WASHINGTON) ABBR="WA" ;; "WEST VIRGINIA") ABBR="WV" ;;
  WISCONSIN) ABBR="WI" ;; WYOMING) ABBR="WY" ;; "DISTRICT OF COLUMBIA") ABBR="DC" ;;
  # If it's already an abbreviation (2 chars), use as-is
  ??) ABBR="$STATE_UPPER" ;;
  *) ABBR="" ;;
esac

if [ -n "$ABBR" ] && [ ! -f "${STATE_REF_DIR}/${ABBR}.md" ]; then
  echo "Municipal Governance: No state reference available for ${STATE} (${ABBR})."
  echo "Compliance guidance will use general frameworks only."
  echo "Statutory citations, deadlines, and thresholds require the state reference."
  echo ""
  echo "Currently available: $(ls "${STATE_REF_DIR}"/*.md 2>/dev/null | xargs -I{} basename {} .md | tr '\n' ' ' || echo 'none')"
fi

# If everything is configured, exit silently — no noise on happy path
exit 0

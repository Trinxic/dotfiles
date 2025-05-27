#!/usr/bin/env bash
set -euo pipefail

# ──────────────────────────────────────────────────────────
# Configuration
HYPR_CONFIG="$HOME/.config/hypr/configs/variables.conf"
DEFAULT_ROUNDING=10
# ──────────────────────────────────────────────────────────

# 0) OS check: ensure on linux
if [[ "$(uname)" != "Linux" ]]; then
  echo "Error: this script is only for Linux" >&2
  exit 1
fi

# 1) Sanity check: file must exist
if [[ ! -f "$HYPR_CONFIG" ]]; then
  echo "Error: config not found at $HYPR_CONFIG" >&2
  exit 1
fi

# 2) Usage check
if (( $# > 1 )); then
  echo "Usage: $0 [rounding_value]" >&2
  exit 1
fi

# 3) Extract current rounding (first match of `rounding = <num>`)
current=$(grep -Po '^\s*rounding\s*=\s*\K[0-9]+' "$HYPR_CONFIG" || true)
if [[ -z "$current" ]]; then
  echo "Error: no 'rounding =' line found in $HYPR_CONFIG" >&2
  exit 1
fi

# 4) Decide new value
if (( $# == 1 )); then
  new="$1"
else
  if (( current == 0 )); then
    new=$DEFAULT_ROUNDING
  else
    new=0
  fi
fi

# 5) In‐place replace with sed
#    – Uses a regex to find the rounding line and swap out the number
#    – -r for extended regex, -i to edit file
sed -r -i \
  "s#(^[[:space:]]*rounding[[:space:]]*=[[:space:]]*)[0-9]+#\1$new#" \
  "$HYPR_CONFIG"

echo "✅ Hyprland window rounding set to $new"


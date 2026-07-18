#!/usr/bin/env bash
# Move the current sway workspace to a screen chosen by *relative position*,
# resolving output names dynamically (they change across replugs).
#
# Usage: move-workspace-to-output.sh <left|main|right>
#
#   main   -> the laptop panel: first active output whose name matches ^eDP
#   left   -> leftmost of the external (non-eDP) outputs
#   right  -> rightmost of the external (non-eDP) outputs
#
# "left/right" are decided by each output's x coordinate in the layout.
# Fallbacks: with only one external, left and right resolve to it; with no
# externals, everything goes to the laptop panel; if there's no eDP panel,
# main falls back to the leftmost external.

set -euo pipefail

pos=${1:?usage: $0 <left|main|right>}

outputs=$(swaymsg -t get_outputs -r)

# Laptop panel: first active output named like eDP* (case-insensitive).
laptop=$(jq -r '
  [ .[] | select(.active) | select(.name | test("^eDP"; "i")) ]
  | .[0].name // empty' <<<"$outputs")

# External outputs, sorted left-to-right by their x position in the layout.
externals_raw=$(jq -r '
  [ .[] | select(.active) | select((.name | test("^eDP"; "i")) | not) ]
  | sort_by(.rect.x) | .[].name' <<<"$outputs")

mapfile -t ext <<<"$externals_raw"
# An empty result still yields one empty element via the here-string; drop it.
[[ ${#ext[@]} -eq 1 && -z ${ext[0]} ]] && ext=()
n=${#ext[@]}

target=""
case "$pos" in
  main) target=$laptop ;;
  left)   ((n)) && target=${ext[0]} ;;
  right)  ((n)) && target=${ext[n-1]} ;;
  *) echo "unknown position: $pos (expected left|main|right)" >&2; exit 2 ;;
esac

# Fallbacks: prefer an external if the laptop panel is absent, and vice versa.
[[ -z $target ]] && target=$laptop
[[ -z $target && $n -gt 0 ]] && target=${ext[0]}

if [[ -z $target ]]; then
  echo "no suitable output found" >&2
  exit 1
fi

exec swaymsg move workspace to output "$target"

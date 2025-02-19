#!/bin/bash

set -euo pipefail

set_sway_bg() {
  local CHOSEN_IMAGE="$1"

  if [ ! -f "${CHOSEN_IMAGE}" ]; then
    echo "Will not switch to '${CHOSEN_IMAGE}' because I cannot find it."
    return
  fi

  echo "INFO: Executing swaybg..."
  swaybg --image "${CHOSEN_IMAGE}" --mode fill
}

if pgrep swaybg ; then
  echo "ERROR: It seems there is a 'swaybg' process running (pgrep swaybg -> $(pgrep swaybg))"
  exit 1
fi

WP_PATH=/home/ztf/.wallpaper-path
if [ ! -f "${WP_PATH}" ]; then
  echo "ERROR: No wallpaper path set in '${WP_PATH}'."
  exit 1
fi
WALLPAPER="$(cat "${WP_PATH}")"
echo "INFO: setting wallpaper '${WALLPAPER}'"
set_sway_bg "${WALLPAPER}"

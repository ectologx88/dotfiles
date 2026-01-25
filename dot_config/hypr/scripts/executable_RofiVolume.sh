#!/usr/bin/env bash
set -euo pipefail

if ! command -v rofi >/dev/null 2>&1; then
  exit 0
fi

if ! command -v pamixer >/dev/null 2>&1; then
  exit 0
fi

current_vol="$(pamixer --get-volume)"
is_muted="$(pamixer --get-mute)"

status="Vol: ${current_vol}%"
if [ "$is_muted" = "true" ]; then
  status="Muted"
fi

choice="$(printf "%s\n%s\n%s\n%s\n%s\n%s\n%s\n" \
  "$status" \
  "Toggle Mute" \
  "Volume 0%" \
  "Volume 25%" \
  "Volume 50%" \
  "Volume 75%" \
  "Volume 100%" \
  | rofi -dmenu -p "Volume")"

case "$choice" in
  "Toggle Mute") pamixer --toggle-mute ;;
  "Volume 0%") pamixer --set-volume 0 ;;
  "Volume 25%") pamixer --set-volume 25 ;;
  "Volume 50%") pamixer --set-volume 50 ;;
  "Volume 75%") pamixer --set-volume 75 ;;
  "Volume 100%") pamixer --set-volume 100 ;;
  *) exit 0 ;;
esac

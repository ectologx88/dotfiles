#!/usr/bin/env bash
# Simple Rofi Wi-Fi menu using nmcli.
set -euo pipefail

notify() {
  if command -v notify-send >/dev/null 2>&1; then
    notify-send "Wi-Fi" "$1"
  fi
}

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    notify "Missing dependency: $1"
    exit 1
  fi
}

require_cmd nmcli
require_cmd rofi

wifi_status=$(nmcli -t -f WIFI g 2>/dev/null || echo "enabled")

actions=(
  "Action: Open Settings"
  "Action: Disconnect"
  "Action: Enable Wi-Fi"
  "Action: Disable Wi-Fi"
)

networks=$(nmcli -t -f IN-USE,SSID,SECURITY,SIGNAL dev wifi list --rescan yes 2>/dev/null | awk -F: '
  {
    inuse = ($1 == "*") ? "*" : " "
    ssid = $2
    sec = $3
    sig = $4
    if (ssid == "") ssid = "<hidden>"
    if (sec == "") sec = "--"
    printf("%s %s | %s | %s%%\n", inuse, ssid, sec, sig)
  }')

menu=$(printf "%s\n%s\n" "${actions[@]}" "$networks" | rofi -dmenu -p "Wi-Fi")
if [[ -z "$menu" ]]; then
  exit 0
fi

case "$menu" in
  "Action: Open Settings")
    nm-connection-editor >/dev/null 2>&1 &
    exit 0
    ;;
  "Action: Disconnect")
    dev=$(nmcli -t -f DEVICE,TYPE,STATE dev status | awk -F: '$2=="wifi" && $3=="connected"{print $1; exit}')
    if [[ -n "${dev:-}" ]]; then
      nmcli dev disconnect "$dev" >/dev/null 2>&1 || true
      notify "Disconnected"
    else
      notify "No active Wi-Fi connection"
    fi
    exit 0
    ;;
  "Action: Enable Wi-Fi")
    nmcli radio wifi on >/dev/null 2>&1 || true
    notify "Wi-Fi enabled"
    exit 0
    ;;
  "Action: Disable Wi-Fi")
    nmcli radio wifi off >/dev/null 2>&1 || true
    notify "Wi-Fi disabled"
    exit 0
    ;;
esac

ssid=$(printf "%s" "$menu" | awk -F" \\| " '{print $1}' | sed 's/^[* ]*//')
sec=$(printf "%s" "$menu" | awk -F" \\| " '{print $2}' | sed 's/^ *//')

if [[ "$ssid" == "<hidden>" || -z "$ssid" ]]; then
  notify "Hidden SSID selected; use Network Settings"
  exit 0
fi

if [[ "$sec" == "--" || "$sec" == "NONE" ]]; then
  nmcli dev wifi connect "$ssid" >/dev/null 2>&1 || notify "Failed to connect"
  exit 0
fi

pass=$(rofi -dmenu -p "Password" -password)
if [[ -z "${pass:-}" ]]; then
  exit 0
fi

nmcli dev wifi connect "$ssid" password "$pass" >/dev/null 2>&1 || notify "Failed to connect"

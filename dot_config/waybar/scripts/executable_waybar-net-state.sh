#!/usr/bin/env sh

if ! command -v nmcli >/dev/null 2>&1; then
  exit 0
fi

state=$(nmcli -t -f STATE general 2>/dev/null | head -n 1)

case "$state" in
  connected)
    exit 0
    ;;
  connecting|connecting*)
    text="󰈁 NET"
    class="warn"
    ;;
  disconnecting|disconnected|unavailable)
    text="󰌙 NET"
    class="critical"
    ;;
  *)
    text="󰌙 NET"
    class="critical"
    ;;
esac

printf '{"text":"%s","class":"%s","tooltip":"Network: %s"}\n' "$text" "$class" "$state"

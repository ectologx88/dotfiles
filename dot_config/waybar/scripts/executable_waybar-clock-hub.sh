#!/usr/bin/env bash
set -euo pipefail

time_text="$(date '+%a %d | %I:%M %p')"
calendar_text="$(cal)"

weather_text=""

weather_tooltip=""

# Prefer cached simple text to avoid network stalls
cache="$HOME/.cache/.weather_cache"
if [ -f "$cache" ]; then
  first_line="$(head -n 1 "$cache" | tr -d '\r')"
  if [[ "$first_line" == \{* ]]; then
    weather_text="$(python3 - <<'PY' 2>/dev/null
import json, sys
try:
    data = json.loads(sys.stdin.read())
    print(str(data.get("text","")).strip())
except Exception:
    pass
PY
<<<"$first_line")"
    weather_tooltip="$(python3 - <<'PY' 2>/dev/null
import json, sys
try:
    data = json.loads(sys.stdin.read())
    print(str(data.get("tooltip","")).strip())
except Exception:
    pass
PY
<<<"$first_line")"
  else
    icon="$(sed -n '2p' "$cache" | awk '{print $1}')"
    temp="$(grep -m1 -oE '[-]?[0-9]+°[CF]' "$cache" | head -n1 || true)"
    if [ -n "$temp" ]; then
      weather_text="${icon:-}  ${temp}"
    fi
    weather_tooltip="$(cat "$cache")"
  fi
fi

if [ -z "$weather_text" ] && command -v python3 >/dev/null 2>&1; then
  weather_json="$(WEATHER_UNITS=imperial "$HOME/.config/hypr/UserScripts/WeatherWrap.sh" 2>/dev/null || true)"
  if [ -n "$weather_json" ]; then
    weather_text="$(python3 - <<'PY' 2>/dev/null
import json, sys
try:
    data = json.loads(sys.stdin.read())
    print(str(data.get("text","")).strip())
except Exception:
    pass
PY
<<<"$weather_json")"
  fi
fi

if [ -z "$weather_text" ]; then
  weather_text="  N/A"
fi

tooltip_raw="${weather_tooltip:-Weather unavailable}\n\n${calendar_text}"
tooltip_json="$(python3 - <<'PY' 2>/dev/null
import json, sys
print(json.dumps(sys.stdin.read()))
PY
<<<"$tooltip_raw")"

text="${weather_text}  ${time_text}"
printf '{"text":"%s","tooltip":%s,"class":"hub"}\n' "$text" "$tooltip_json"

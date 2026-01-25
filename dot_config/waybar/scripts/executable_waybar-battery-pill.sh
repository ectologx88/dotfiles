#!/usr/bin/env sh

bat_path=$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -n 1)
if [ -z "$bat_path" ]; then
  exit 0
fi

status=$(cat "$bat_path/status" 2>/dev/null)
capacity=$(cat "$bat_path/capacity" 2>/dev/null)
threshold=30

if [ -z "$capacity" ]; then
  exit 0
fi

show=false
if [ "$status" = "Charging" ]; then
  show=true
elif [ "$capacity" -le "$threshold" ]; then
  show=true
fi

if [ "$show" != "true" ]; then
  exit 0
fi

if [ "$status" = "Charging" ]; then
  icon=""
  class="charging"
else
  if [ "$capacity" -ge 90 ]; then
    icon="󰁹"
  elif [ "$capacity" -ge 70 ]; then
    icon="󰂀"
  elif [ "$capacity" -ge 50 ]; then
    icon="󰁾"
  elif [ "$capacity" -ge 30 ]; then
    icon="󰁼"
  elif [ "$capacity" -ge 15 ]; then
    icon="󰁻"
  else
    icon="󰁺"
  fi

  if [ "$capacity" -le 15 ]; then
    class="critical"
  else
    class="warning"
  fi
fi

printf '{"text":"%s %s%%","class":"%s","tooltip":"Battery: %s%% (%s)"}\n' "$icon" "$capacity" "$class" "$capacity" "$status"

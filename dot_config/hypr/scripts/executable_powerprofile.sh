#!/bin/bash
asusctl profile next
MODE=$(asusctl profile get | head -n 1)
notify-send -u low -t 2000 "ASUS Power" "$MODE"

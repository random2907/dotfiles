#!/bin/env bash

if [ -z "$1" ]; then
        BG="$(find $wallpaper_path | shuf -n 1)"
else
	BG="$1"
fi

trans_type="simple"
# trans_type="center"
# Name of the program to check
PROGRAM="swww-daemon"

# Check if the program is running
if pgrep "$PROGRAM" >/dev/null; then
	swww img "$BG" --transition-type "$trans_type" --transition-step 10
        matugen image "$BG"
	killall dunst
else
	swww-daemon &
fi

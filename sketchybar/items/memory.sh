#!/usr/bin/env bash

COLOR="$CYAN"

sketchybar --add item memory right \
	--set memory \
	update_freq=3 \
	icon.color="$WHITE" \
	label.color="$WHITE" \
	icon.padding_left=8 \
	script="$PLUGIN_DIR/memory.sh"
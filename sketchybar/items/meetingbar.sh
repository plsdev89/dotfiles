#!/bin/bash

COLOR="$MAGENTA"

sketchybar --add alias "MeetingBar,Item-0" right \
	--rename "MeetingBar,Item-0" meetingbar_alias \
	--set meetingbar_alias \
	update_freq=180 \
	alias.color="0xffF0F1F1" \
	icon="" \
	label.drawing=off \
  background.padding_left=15  \
	icon.color="0xffF0F1F1" \
	icon.padding_left=10 \
	icon.padding_right=3 \
	script="$PLUGIN_DIR/meetingbar.sh" \
	click_script="osascript $CONFIG_DIR/open_meetingbar.applescript" \
	--subscribe meetingbar_alias system_woke

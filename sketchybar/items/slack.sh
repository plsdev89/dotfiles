sketchybar  --add   item slack right \
            --set   slack \
                    update_freq=10 \
                    script="$PLUGIN_DIR/badge_count.sh Slack" \
                    background.padding_left=15  \
                    icon.font="sketchybar-app-font:Regular:16.0" \
                    icon.font.size=18 \
                    click_script="open -a Slack" \
           --subscribe slack system_woke
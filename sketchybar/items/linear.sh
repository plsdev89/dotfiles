sketchybar  --add   item linear right \
            --set   linear \
                    update_freq=10 \
                    script="$PLUGIN_DIR/badge_count.sh Linear" \
                    background.padding_left=15  \
                    icon.font="sketchybar-app-font:Regular:16.0" \
                    icon.font.size=18 \
           --subscribe linear system_woke
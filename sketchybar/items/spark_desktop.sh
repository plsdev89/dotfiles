sketchybar  --add   item spark_desktop right \
            --set   spark_desktop \
                    update_freq=10 \
                    script="$PLUGIN_DIR/badge_count.sh Spark\ Desktop" \
                    background.padding_left=15  \
                    icon.font="sketchybar-app-font:Regular:16.0" \
                    icon.font.size=18 \
                    click_script="open -a 'Spark Desktop'" \
           --subscribe spark_desktop system_woke
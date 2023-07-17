#!/bin/bash

sketchybar -m --add item mic right \
              --set mic update_freq=3 \
              --set mic script="~/.config/sketchybar/plugins/mic.sh" \
              --set mic click_script="~/.config/sketchybar/plugins/mic_click.sh"
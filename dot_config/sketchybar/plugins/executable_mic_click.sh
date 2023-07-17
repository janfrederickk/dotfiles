#!/bin/bash

source "$CONFIG_DIR/icons.sh"

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME -eq 0 ]]; then
  osascript -e 'set volume input volume 100'
  sketchybar -m --set mic icon=$MIC_ON
elif [[ $MIC_VOLUME -gt 0 ]]; then
  osascript -e 'set volume input volume 0'
  sketchybar -m --set mic icon=$MIC_OFF
fi
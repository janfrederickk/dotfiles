#!/bin/bash

source "$CONFIG_DIR/icons.sh"

weather_current=(
	label.font="$FONT:Heavy:14"
	icon="$SUNNY"
    icon.font="$FONT:Bold:20.0"
	update_freq=3000
	icon.align=right
    background.padding_right=-10
    script="$PLUGIN_DIR/weather.sh"
)

weather_daily_top=(
    label.font="$FONT:Heavy:10"
	y_offset=4
    update_freq=3000
    script="$PLUGIN_DIR/weather.sh"
)

weather_daily_bottom=(
    label.font="$FONT:Heavy:10"
	y_offset=-8
	background.padding_right=-70
    update_freq=3000
    script="$PLUGIN_DIR/weather.sh"
)

sketchybar 	--add item weather_daily_top right\
			--set weather_daily_top "${weather_daily_top[@]}"

sketchybar 	--add item weather_daily_bottom right\
			--set weather_daily_bottom "${weather_daily_bottom[@]}"

sketchybar 	--add item weather_current right\
			--set weather_current "${weather_current[@]}"

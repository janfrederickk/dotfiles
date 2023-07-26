#!/bin/bash

source "$CONFIG_DIR/icons.sh"

cpu_percent=(
	label.font="$FONT:Heavy:12"
	label=CPU%
	#label.color="$TEXT"
	icon="$CPU"
	icon.color="$BLUE"
	update_freq=2
	mach_helper="$HELPER"
)

memory=(
    label.font="$FONT:Heavy:12"
	#label.color="$TEXT"
	icon="$MEMORY"
	icon.font="$FONT:Bold:16.0"
	icon.color="$GREEN"
	update_freq=15
	script="$PLUGIN_DIR/ram.sh"
)

disk=(
	label.font="$FONT:Heavy:12"
	#label.color="$TEXT"
	icon="$DISK_ICON"
	icon.color="$RED"
	update_freq=60
	script="$PLUGIN_DIR/disk.sh"
)

sketchybar 	--add item cpu.percent right\
			--set cpu.percent "${cpu_percent[@]}"

sketchybar 	--add item memory right\
			--set memory "${memory[@]}"


sketchybar  --add item disk right\
			--set disk "${disk[@]}"

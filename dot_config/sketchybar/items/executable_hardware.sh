#!/bin/bash

source "$CONFIG_DIR/icons.sh"

cpu_percent=(
	label.font="$FONT:Heavy:14"
	label=CPU%
	#label.color="$TEXT"
	icon="$CPU"
    icon.font="$FONT:Bold:20.0"
	icon.color="$BLUE"
	update_freq=2
	mach_helper="$HELPER"
)

memory=(
    label.font="$FONT:Heavy:14"
	#label.color="$TEXT"
	icon="$MEMORY"
	icon.font="$FONT:Bold:20.0"
	icon.color="$GREEN"
	update_freq=15
	script="$PLUGIN_DIR/ram.sh"
)

disk=(
	label.font="$FONT:Heavy:14"
	#label.color="$TEXT"
	icon="$DISK_ICON"
    icon.font="$FONT:Bold:19.0"
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

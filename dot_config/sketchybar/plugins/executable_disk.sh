#!/bin/bash

sketchybar -m --set disk label="$(df -H | grep -E '^(/dev/disk3s3s1).' | awk '{ printf ("%s\n", $4) }')"

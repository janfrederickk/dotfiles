#!/bin/bash

if [ "$(uname)" != "Darwin" ]; then
    # Do something under Mac OS X platform
    exit
fi

INPUTVOLUME="$(osascript -e 'input volume of (get volume settings)')"
#echo $INPUTVOLUME
if [ $INPUTVOLUME != "0" ]; then
    osascript -e "set volume input volume 0"
else
    osascript -e "set volume input volume 100"
fi

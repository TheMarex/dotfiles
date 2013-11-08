#!/bin/sh

xautolock -time 10 -locker lock-screen &
xset dpms 0 0 600

xrdb ~/.Xresources
set-gnome-bg


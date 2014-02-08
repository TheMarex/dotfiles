#!/bin/sh

HOSTNAME=$(hostname)

if [ "$HOSTNAME" = "patrick-desktop" ]; then
	echo "Setting destkop config..."
	xset -dpms
	xset s off
elif [ "$HOSTNAME" = "patrick-laptop"]; then
	echo "Setting laptop config..."
	xautolock -time 10 -locker lock-screen &
	xset dpms 0 0 600
fi

xrdb ~/.Xresources
exec ~/.local/bin/set-gnome-bg


#!/bin/sh

HOSTNAME=$(hostname)

redshift -l 49.822923:6.749668 -b 1.0:0.8 &

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


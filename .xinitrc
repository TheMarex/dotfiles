#!/bin/sh

HOSTNAME=$(hostname)

xrdb ~/.Xresources

if [ "$HOSTNAME" = "patrick-desktop" ]; then
	echo "Setting destkop config..."
	xset -dpms
	xset s off
	redshift -l 49.822923:6.749668 -b 1.0:1.0 &
elif [ "$HOSTNAME" = "patrick-laptop" ]; then
	echo "Setting laptop config..."
	xautolock -time 10 -locker lock-screen &
	xset dpms 0 0 600
	redshift -l 49.822923:6.749668 -b 1.0:0.8 &
fi

exec ~/.local/bin/set-gnome-bg


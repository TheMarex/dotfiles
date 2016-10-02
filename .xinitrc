#!/bin/sh

HOSTNAME=$(hostname)

xrdb ~/.Xresources

if [ "$HOSTNAME" = "patrick-desktop" ]; then
	echo "Setting destkop config..."
	xset -dpms
	xset s off
	redshift -l 49.822923:6.749668 -b 1.0:1.0 &
elif [ "$HOSTNAME" = "patrick-x240" ]; then
	echo "Setting laptop config..."
	xautolock -time 2 -locker ~/.local/bin/locker &
#	xset dpms 0 0 600
	redshift -l 49.822923:6.749668 -b 1.0:1.0 &
fi

ssh-agent > /home/patrick/.ssh/agent.env
chmod 0600 /home/patrick/.ssh/agent.env

exec ~/.local/bin/set-gnome-bg


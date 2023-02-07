# vim: ft=bash

# Autostart
#redshift &
dunst &
while true; do xsetroot -name " $(status)"; sleep 0.5; done &
sudo wpa_supplicant -i wlan0 -D nl80211 -c /etc/wpa_supplicant/wpa_supplicant.conf -B
sudo dhcpcd
xrandr --output HDMI-0 --mode 2560x1440
~/.fehbg &
start-pipewire

# Window Manager
exec startdwm

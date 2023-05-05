# vim: ft=bash

# Autostart
dunst &
while true; do xsetroot -name " $(status)"; sleep 0.5; done &
sudo wpa_supplicant -i wlan0 -D nl80211 -c /etc/wpa_supplicant/wpa_supplicant.conf -B
sudo dhcpcd
xrandr --output HDMI-0 --mode 2560x1440
~/.fehbg &
start-pipewire
picom -b

# for theming QT applications
export QT_QPA_PLATFORMTHEME=qt6ct

# Window Manager
exec startdwm

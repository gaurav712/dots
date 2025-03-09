[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="helix"
export PATH="$HOME/.local/bin:$HOME/.config/scripts:$PATH"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec dbus-launch Hyprland
fi


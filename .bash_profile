[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export PATH="$HOME/.local/bin:$PATH"

# Android
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

alias undervolt_cpu="sudo amdctl -gmc 0 -v 84 -f 168 -p 0"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec dbus-launch hyprland
fi

# LM Studio
export PATH="$PATH:$HOME/.lmstudio/bin"


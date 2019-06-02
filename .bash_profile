[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export NNN_OPENER="launch"
export PATH="$HOME/.cargo/bin:$HOME/.scripts:$PATH"

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi


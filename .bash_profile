[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export PATH="$HOME/.local/bin:$PATH"

alias undervolt_cpu="sudo amdctl -gmc 0 -v 84 -f 168 -p 0"


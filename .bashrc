# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vol='pactl list sinks | grep Volume | sed -n 1p'

. "$HOME/.cargo/env"

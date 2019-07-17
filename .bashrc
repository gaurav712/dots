# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ughz='sudo cpufreq 2.7'
alias mghz='sudo cpufreq 1.5'
alias dghz='sudo cpufreq 0.8'
alias sp=music_dl
alias vol='pactl list sinks | grep Volume | sed -n 1p'
alias brt='echo "$(($(cat /sys/class/backlight/intel_backlight/brightness)/192))%"'
alias trr='transmission-remote'

function music_dl {
    spotdl --song "$1"
}


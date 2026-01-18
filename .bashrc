# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# $ [directory] (git-branch)
PS1='\[\e[1;32m\]$\[\e[0m\] [\W]$(b=$(git branch --show-current 2>/dev/null); [ -n "$b" ] && printf " (%s)" "$b") '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias delete_merged_branches='git branch --merged | grep -v "main\|master" | xargs git branch -d'
alias castscr='scrcpy -Sf -b 8M --video-codec=av1 --render-driver=vulkan --max-fps=24 --max-size 1080'
alias ltorrents='while true; do clear; transmission-remote -l; sleep 1; done'

function discache() {

  # Check for argument
  if [ -z $1 ]; then
    echo "USAGE: disable-cache path"
    return -1
  fi

  echo "creating a link for $1 to /dev/null .."
  rm -rf $1 && ln -sf /dev/null $1
}

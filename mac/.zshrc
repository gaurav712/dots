autoload -Uz compinit && compinit

#alias disable_spotlight='sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist && sudo mdutil -a -i off'
#alias emulator='~/Library/Android/sdk/emulator/emulator -avd Pixel_3a_API_32_arm64-v8a'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -l'

function discache() {

  # Check for argument
  if [ -z $1 ]; then
    echo "USAGE: disable-cache path"
    return -1
  fi

  echo "creating a link for $1 to /dev/null .."
  rm -rf $1 && ln -sf /dev/null $1
}

# for version control info in the prompt
precmd () {
  autoload -Uz vcs_info # enable vcs_info
  vcs_info # always load before displaying the prompt
  zstyle ':vcs_info:*' formats '(%b)' # git(main)

  # the prompt
  export PS1="anon@mac${vcs_info_msg_0_} %~ $ "
}

# To make node v18.0 the default
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

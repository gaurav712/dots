#!/bin/bash

# Check bash version
# as dictionaries are only supported with bash 4.0+

bash_version=$(echo "echo \$BASH_VERSINFO" | bash)

if ((bash_version < 4)); then
  echo "You need bash 4.0 or higher to run this script!"
  exit 1
fi

# Check flags
r_flag=""

print_usage() {
  printf "\nUsage:\n\t$0 [FLAGS]\n\nFLAGS:\n-r\treverse (unlinks all the symlinks)\n\n"
}

while getopts 'rh' flag; do
  case "${flag}" in
    r) r_flag="true" ;;
    h) print_usage
       exit 1 ;;
  esac
done

# create the dictionary
declare -A links

# Check OS
# 
# Credits to https://stackoverflow.com/users/14860/paxdiablo for this snippet

unameOut="$(uname -s)"

case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# Define the symlinks sources and targets

links[".config/nvim"]="$HOME/.config/nvim"

if [ $machine == "Linux" ]; then

  echo "Linux detected.."

  links[".tmux.conf"]="$HOME/.tmux.conf"
  links[".xinitrc"]="$HOME/.xinitrc"
  links[".bashrc"]="$HOME/.bashrc"
  links[".config/alacritty"]="$HOME/.config/alacritty"
  links[".config/dunst"]="$HOME/.config/dunst"
  links[".config/picom.conf"]="$HOME/.config/picom.conf"
  links["bg.png"]="$HOME/.config/bg"

elif [ $machine == "Mac" ]; then

  echo "MacOS detected.."

  links["mac/.zshrc"]="$HOME/.zshrc"
  links["mac/.zprofile"]="$HOME/.zprofile"
  links["mac/.tmux.conf"]="$HOME/.tmux.conf"
  links["mac/.config/alacritty"]="$HOME/.config/alacritty"
  links["bg.png"]="$HOME/Pictures/bg.png"

fi

# Check if symlinks need to be removed on linked

if [ $r_flag == "true" ]; then
  echo "Unlinking the symlinks.."

  for key in "${!links[@]}"; do
    echo "${links[$key]}"
    unlink "${links[$key]}"
  done

  exit 0
fi

# Create the links

for key in "${!links[@]}"; do

  echo "Linking $(pwd)/$key -> ${links[$key]}"

  # Check if the directory exists
  if [ -d "${links[$key]}" ]; then 
    if [ -L "${links[$key]}" ]; then
      unlink "${links[$key]}"
    else
      rm -rf "${links[$key]}"
    fi
  fi

  ln -sf "$(pwd)/$key" "${links[$key]}"
done


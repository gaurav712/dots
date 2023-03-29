#!/bin/bash

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
  links["bg.jpg"]="$HOME/.config/bg"

elif [ $machine == "Mac" ]; then

  echo "MacOS detected.."

  links["mac/.tmux.conf"]="$HOME/.tmux.conf"
  links["mac/.config/alacritty"]="$HOME/.config/alacritty"
  links["bg.jpg"]="$HOME/Pictures/bg.jpg"

fi


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


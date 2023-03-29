#!/bin/bash

# create the dictionary
declare -A links

# Define the symlinks sources and targets

links["mac/.tmux.conf"]="$HOME/.tmux.conf"
links["mac/.config/alacritty"]="$HOME/.config/alacritty"
links[".config/nvim"]="$HOME/.config/nvim"
links["bg.jpg"]="$HOME/Pictures/bg.jpg"

for key in "${!links[@]}"; do

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


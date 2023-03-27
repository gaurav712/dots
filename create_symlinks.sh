#!/bin/bash

# create the dictionary
declare -A links

# Define the symlinks sources and targets

links[".tmux.conf"]="$HOME/.tmux.conf"
links[".xinitrc"]="$HOME/.xinitrc"
links[".bashrc"]="$HOME/.bashrc"
links[".config/alacritty"]="$HOME/.config/alacritty"
links[".config/dunst"]="$HOME/.config/dunst"
links[".config/nvim"]="$HOME/.config/nvim"
links[".config/picom.conf"]="$HOME/.config/picom.conf"
links["bg.jpg"]="$HOME/.config/bg"

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


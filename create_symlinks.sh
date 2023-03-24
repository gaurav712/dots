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

for key in "${!links[@]}"; do
  echo "ln -sf" "$(pwd)/$key" "${links[$key]}"
  ln -sf "$(pwd)/$key" "${links[$key]}"
done


#!/bin/bash

hyprctl hyprpaper unload all

WALLPAPER_DIR="$HOME/dotfiles/stownt/photos/wallpapers"

# get number of wallpapers
max=$(ls WALLPAPER_DIR | wc -l)
min=1 # first wallpaper ends in '-1'

if [ $max -gt 0 ]; then
    # assumes all wallpapers are consecutively named `wallpaper-<n>.jpg``
    n=$((RANDOM % ($max - $min + 1) + $min))
    hyprctl hyprpaper preload "$WALLPAPER_DIR/wallpaper-$n.jpg"
    hyprctl hyprpaper wallpaper "DP-1,$WALLPAPER_DIR/wallpaper-$n.jpg"
    hyprctl hyprpaper wallpaper "DP-2,$WALLPAPER_DIR/wallpaper-$n.jpg"
fi

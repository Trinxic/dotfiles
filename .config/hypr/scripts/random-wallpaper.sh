#!/bin/bash

hyprctl hyprpaper unload all

# get number of wallpapers
max=$(ls $HOME/Wallpapers/ | wc -l)
min=1  # first wallpaper ends in '-1'

if [ $max -gt 0 ] ; then
    # assumes all wallpapers are consecutively named `wallpaper-<n>.jpg``
    n=$((RANDOM%($max - $min + 1) + $min))
    hyprctl hyprpaper preload "$HOME/Wallpapers/wallpaper-$n.jpg"
    hyprctl hyprpaper wallpaper "DP-1,$HOME/Wallpapers/wallpaper-$n.jpg"
    hyprctl hyprpaper wallpaper "DP-2,$HOME/Wallpapers/wallpaper-$n.jpg"
fi
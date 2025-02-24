#!/bin/bash

# For more settings:
# $ swww img --help

# -------- Variables ------- #
# wallpaper directory
DIR="$HOME/dotfiles/stownt/photos/wallpapers"

# swww command variables
FPS=30
TYPE="random" # choose 'any' for circle-only
DURATION=3
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

# get list of wallpapers
PICS=($(ls ${DIR} | grep -e ".jpg$" -e ".jpeg$" -e ".png$" -e ".gif$"))

# -- Get Random Wallpaper -- #
WALLPAPER="$DIR/${PICS[$RANDOM % ${#PICS[@]}]}"

echo "[for debugging purposes]: $WALLPAPER"

# ------ Set Wallpaper(s) ----- #
swww img $WALLPAPER --outputs=DP-1 $SWWW_PARAMS
swww img $WALLPAPER --outputs=DP-2 $SWWW_PARAMS # --resize=no
#                                                          {crop, fit, no}

# use `$ swww img -h`

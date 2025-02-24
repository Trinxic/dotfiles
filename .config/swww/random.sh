#!/bin/bash

# For more settings:
# $ swww img --help

WALLPAPER_DIR="$HOME/dotfiles/stownt/photos/wallpapers"

# -- Get Random Wallpaper -- #
max=$(ls $WALLPAPER_DIR | wc -l)
min=1
if [ $max -gt 0 ]; then
    # assumes all wallpapers are consecutively named
    # `wallpaper-<n>.jpg`, n ∈ {1, number-of-wallpapers}
    n=$((RANDOM % ($max - $min + 1) + $min))
fi

WALLPAPER="$WALLPAPER_DIR/wallpaper-$n.jpg"

echo "$WALLPAPER"

# ------ Set Wallpaper(s) ----- #
swww img $WALLPAPER --outputs=DP-1 --transition-type=random
swww img $WALLPAPER --outputs=DP-2 --transition-type=random --resize=no
#                                                          {crop, fit, no}

# use `$ swww img -h`

#!/bin/bash

# Original script from:
# https://github.com/JaKooLit/wallpaper-switcher/blob/main/scripts/wallpaper-switcher2

# WALLPAPERS PATH
DIR=$HOME/dotfiles/stownt/photos/wallpapers

# Transition config (type swww img --help for more settings
FPS=30
TYPE="any"
DURATION=3

# wofi window config (in %)
WIDTH=20
HEIGHT=30

# swww command
SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"

# get list of wallpapers
PICS=($(ls ${DIR} | grep -e ".jpg$" -e ".jpeg$" -e ".png$" -e ".gif$"))

# get a random wallpaper from the list
RANDOM_PIC=${PICS[$RANDOM % ${#PICS[@]}]}
RANDOM_PIC_NAME="${#PICS[@]}. random"

# WOFI STYLES
CONFIG="$HOME/dotfiles/.config/wofi/config"
STYLE="$HOME/dotfiles/.config/wofi/style.css"
# COLORS="$HOME/dotfiles/.config/wofi/colors"

# to check if swaybg is running
if [[ $(pidof swaybg) ]]; then
    pkill swaybg
fi

## Wofi Command
wofi_command="wofi --show dmenu \
			--prompt choose...
			--conf $CONFIG --style $STYLE \
			--width=$WIDTH% --height=$HEIGHT% \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--matching=fuzzy"

menu() {
    # Here we are looping in the PICS array that is composed of all images in
    # the $DIR folder
    for i in ${!PICS[@]}; do
        # keeping the .gif to make sue you know it is animated
        if [[ -z $(echo ${PICS[$i]} | grep .gif$) ]]; then
            printf "$i. $(echo ${PICS[$i]} | cut -d. -f1)\n" # n°. <name_of_file_without_identifier>
        else
            printf "$i. ${PICS[$i]}\n"
        fi
    done

    printf "$RANDOM_PIC_NAME"
}

swww query || swww-daemon

main() {
    choice=$(menu | ${wofi_command})

    # no choice case
    if [[ -z $choice ]]; then return; fi

    # random choice case
    if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
        swww img ${DIR}/${RANDOM_PIC} --outputs DP-1 $SWWW_PARAMS
        swww img ${DIR}/${RANDOM_PIC} --outputs DP-2 $SWWW_PARAMS # --resize no
        return
    fi

    pic_index=$(echo $choice | cut -d. -f1)
    swww img ${DIR}/${PICS[$pic_index]} $SWWW_PARAMS
}

# Check if wofi is already running
if pidof wofi >/dev/null; then
    killall wofi
    exit 0
else
    main
fi

# Uncomment to launch something if a choice was made
# if [[ -n "$choice" ]]; then
# Restart Waybar
# fi

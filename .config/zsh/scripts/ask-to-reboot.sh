#!/bin/bash

# defaults
timeout=30
default_answer="y"
answer=""

countdown() {
    for ((i=timeout; i>-1; i--)); do
        echo -ne "\rDo you want to reboot now? [$i] (Y/n): "
        sleep 1
    done
}

# Countdown loop
countdown &
countdown_pid=$!

read -t $((timeout + 1)) -n 1 answer

if kill -0 $countdown_pid 2>/dev/null; then
    kill $countdown_pid
fi
# Use default answer if no input was given
answer=${answer:-$default_answer}

case $answer in
    [Yy]*) echo -e "\nRebooting...";;
    *) echo -e "\nOk, goodbye." && exit;;
esac

reboot

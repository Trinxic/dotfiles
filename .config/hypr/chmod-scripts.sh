#!/bin/bash

for file in /home/$SUDO_USER/.config/hypr/scripts/*.sh; do
  chmod +x "$file"
done
#!/bin/bash

FRIENDLY_NAME="linux lab computer"

VNC_FILE=""
for file in "/home/david/.vnc/ViewerStore/"*.vnc; do
    if grep -q "FriendlyName=${FRIENDLY_NAME}" "$file"; then
        VNC_FILE="$file"
        break
    fi
done

echo "executing: $VNC_FILE"

vncviewer -config ${VNC_FILE}

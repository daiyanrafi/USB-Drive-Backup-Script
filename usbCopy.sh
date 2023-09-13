#!/bin/bash

#variable
TARGET_PATH=~/Desktop/UsbBackup
NAME=$(date +%Y-%m-%d_%H:%M)_backup

#condition
if [ -n "$(lsblk -o RM,MOUNTPOINTS | grep 'media' | grep ' 1 ')" ]; then
    mkdir -p "$TARGET_PATH/$NAME"
    cp -r "$(lsblk -o RM,MOUNTPOINTS | grep 'media' | grep ' 1 ' | awk '{print $NF}')" "$TARGET_PATH/$NAME"
fi

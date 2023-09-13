#!/bin/bash

# Check for a USB drive
if [ -z "$(lsblk -o RM,MOUNTPOINTS | grep media | grep '\s1\s' | awk '{print $NF}')" ]; then
  # No USB drive found, do nothing
  :
else
  # USB drive is detected

  # Define the USB drive location
  LOCATION=$(lsblk -o RM,MOUNTPOINTS | grep media | grep '\s1\s' | awk '{print $NF}')

  # Set the target path on your desktop
  TARGET_PATH=~/Desktop/UsbBackup

  # Create a backup folder with a timestamp
  NAME=$(date +%Y-%m-%d_%H:%M)_backup

  # Check if the backup folder already exists
  if [ -d $TARGET_PATH/$NAME ]; then
    :
  else
    # Create the backup folder
    mkdir $TARGET_PATH/$NAME

    # Copy the USB drive contents to the backup folder
    cp -r $LOCATION $TARGET_PATH/$NAME
  fi
fi

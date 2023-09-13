#!/bin/bash
if [ -z "$(lsblk -o RM,MOUNTPOINTS | grep media | grep '\s1\s' | awk '{print $NF}')" ]; then
  :
else
  LOCATION=$(lsblk -o RM,MOUNTPOINTS | grep media | grep '\s1\s' | awk '{print $NF}')
  TARGET_PATH=~/Desktop/UsbBackup
  NAME=$(date +%Y-%m-%d_%H:%M)_backup
  
  if [ -d $TARGET_PATH/$NAME ]; then
    :
  else
    mkdir $TARGET_PATH/$NAME
    cp -r $LOCATION $TARGET_PATH/$NAME
  fi
fi

#!/bin/bash

Path="/data01/Server/DN1T/Export/*"
NEWEST=$(find $Path  -type d -prune -exec ls -d {} \; | tail -n 1)   #Plus the latest folder 
DEST="/home/mmove/"

if [ -d "${NEWEST}" ] ; then
    echo "The most recent entry is a directory"
    cp -Rp "${NEWEST}"/PRC999/* "${DEST}" # Copies the files from the latest folder over to move folder
    ls -al "${DEST}"   # Lists the files in the move folder
    exit 1

elif [ -z "${NEWEST}" ] ; then
    echo "No file to copy"
    exit 1

else
    echo "Exiting"
    exit 0
fi
#!/bin/bash
Path="/data01/Server*"
Test="/Test/"
NEWEST=$(find $Path -type d -prune -exec ls -d {} \; | tail -n 1)
echo -n "Please enter an Username: "
read User

mount -t cifs -o username="${User}" "//homedirprod/Software Repository/" /Test/
ls -al $NEWEST

if [ -d "${NEWEST}" ] ; then
    echo "The most recent entry is a directory"
    cp -Rp "${NEWEST}" "${Test}"  #Outputs the Date

elif [ -z "${NEWEST}" ] ; then
    echo "No file to copy"
    exit 1

else
    echo "Exiting"
    exit 0


fi
umount /Test

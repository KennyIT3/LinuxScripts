#!/bin/bash
Path="/data01/Server/*"
DEST="/data01/DataCopy"

Dest2="/data01/Linux"

#NEWEST=$(ls -trld $Path | head -1)
NEWEST=$(find $Path  -type d -prune -exec ls -d {} \; | tail -n 1)
mkdir ${Dest2}

if [ -d "${NEWEST}" ] ; then
    echo "The most recent entry is a directory"
    cp -Rp "${NEWEST}" "${DEST}"
    COPY=$(find /data01/DataCopy -type f | grep -E 'Linux|Admin|Bash' | xargs -i cp -rp {} /data01/DataCopy)
    echo $COPY
    ls -al ${Dest2}
   exit 1

elif [ -z "${NEWEST}" ] ; then
    echo "No file to copy"
    exit 1

else
    echo "Exiting"
    exit 0

fi
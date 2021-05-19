# https://superuser.com/questions/489180/remove-r-from-echoing-out-in-bash-script
# Remember to use dos2unix command to convert file to unix format
#!/bin/bash
Path="/data01/Server/Trace/*"
DEST="/data01/Server/Trace/Copy"

De="/data01/Server/Trace/Copy2"

#NEWEST=$(ls -trld $Path | head -1)
NEWEST=$(find $Path  -type d -prune -exec ls -d {} \; | tail -n 1)
mkdir ${De}

if [ -d "${NEWEST}" ] ; then
    echo "The most recent entry is a directory"
    cp -Rp "${NEWEST}" "${DEST}"
    COPY=$(find /data01/Server/Trace/Copy -type f | grep -E 'NC01|NCCI|NCQ02' | xargs -i cp -rp {} /data01/Server/Trace/Copy2)
    echo $COPY
    ls -al ${De}
   exit 1

elif [ -z "${NEWEST}" ] ; then
    echo "No file to copy"
    exit 1

else
    echo "Exiting"
    exit 0

fi

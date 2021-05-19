#!/bin/bash
Path="/data01/Server/DN1TExport/*"
Test="/Test/"
NEWEST=$(find $Path -type d -prune -exec ls -d {} \; | tail -n 1)
echo -n "Please enter an Username: "
read User

mount -t cifs -o username="${User}" "//homedirprod/Test Repository/Test_Team/Files/" /Test/
ls -al $NEWEST
#cd {$NEWEST}

if [ -d "${NEWEST}" ] ; then
    echo "The most recent entry is a directory"
    cp -Rp "${NEWEST}" "${Test}"  #Outputs the Date
    #cp -Rp "${NEWEST}/PRC999/" "${Test}"

elif [ -z "${NEWEST}" ] ; then
    echo "No file to copy"
    exit 1

else
    echo "Exiting"
    exit 0


fi
umount /Test

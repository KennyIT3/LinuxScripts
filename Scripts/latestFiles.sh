#!/bin/bash
Path="/data01/WebUI/logs/web_traces/"
DEST="/data01/WebUI/logs/web_traces/TestTrace"
Cata="/data01/apache-tomcat-8.5.20/log/catalina.out"
Test=cat $Cata | grep "date +"%Y-%m-%d""
cat catalina.out | grep "$(date +"%Y-%m-%d")"


echo $Test


if [ -d "${Path}" ] ; then
    cp -rp "${Path}" "${DEST}"
    ls -al ${DEST}
    exit 1

elif [ -z "${NEWEST}" ] ; then
    echo "No file to copy"
    exit 1

else
    echo "Exiting"
    exit 0

fi

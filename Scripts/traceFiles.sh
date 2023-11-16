#!/bin/bash
Path="/data01/WebUI/logs/web_traces/"
DEST="/data01/WebUI/logs/web_traces/TestTrace"
Cata="/data01/apache-tomcat-8.5.20/logs/catalina.out/"

Test=$(cat /data01/apache-tomcat-8.5.20/logs/catalina.out | grep "$(date +"%Y-%m-%d")" > /data01/apache-tomcat-8.5.20/logs/test.out)
echo $Test
head -n 10 /data01/apache-tomcat-8.5.20/logs/dane.out
mkdir $DEST

if [ -d "${Path}" ] ; then
    find "${Path}" -type f | xargs -I {} cp -vrp {} "${DEST}"
    #cp -Rp "${Path}" "${DEST}"
    ls -al ${DEST}
    exit 1

else
    echo "Exiting"
    exit 0

fi

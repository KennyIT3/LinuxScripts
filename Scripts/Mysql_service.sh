#!/bin/sh
#STATUS="$(systemctl status mysql.service)"
SERVER=$(hostname)
SERVICE='mysql.service'
Mysql="$(systemctl is-active mysql.service)"


#if ps ax | grep -v grep | grep $SERVICE > /dev/null
if [ "${Mysql}" = "active" ];
then
        echo "$SERVICE:Service running on server: $SERVER"
else
        echo "$SERVICE:is not running on hostname:$SERVER"
        echo "$SERVICE is not running!" | mail -s "$SERVICE down" testemail@gmail.com
fi
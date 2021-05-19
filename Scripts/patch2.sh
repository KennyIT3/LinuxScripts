#!/bin/bash

HOST="Server1 Server2"
#while [ "${HOST}" -ne 0 ]
while :
do
for element in "${HOST}"; do
        echo "$element"
        sshpass -p "PAssword" ssh root@$HOST hostname
        yum -y update
        break
done

break
done

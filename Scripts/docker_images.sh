#!/bin/bash
echo "List of docker images running in host"
echo " "
docker images -a | awk '{print $2 ":" ," List of images:",  $3}'

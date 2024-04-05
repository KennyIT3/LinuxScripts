#!/bin/bash
read -rp "Enter username: " user
du -h --max-depth=1 /home/$user/* | awk '{print $2, "uses", $1}'
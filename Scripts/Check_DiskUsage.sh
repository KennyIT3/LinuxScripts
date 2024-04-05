#!/bin/bash
find /home/ksneed/* -type d \( -name Docker -o -name LinuxScripts -o -name Python_Scipts-Automating-Sysadmin \) -exec du -sh {} +
# du -sh /home/ksneed/* | awk '/\/(Python_Scipts-Automating-Sysadmin|Docker|LinuxScripts)$/{print $2, "uses", $1}'

read -rp "Enter username: " user
du -h --max-depth=1 /home/$user/* | awk '{print $2, "uses", $1}'
du -h /home/ | awk '/\/path\/to\/directory\/(dir1|dir2|dir3)$/{print $2, "uses", $1}'
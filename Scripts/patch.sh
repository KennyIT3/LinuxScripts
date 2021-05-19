#!/bin/bash
echo -n  "Please enter the password: "
read Pass
echo "${Pass}"
while :
do

for i in `cat ./patch_list.txt`
do
        echo "$i"
        sshpass -p "${Pass}"  ssh -o PreferredAuthentications=password -o StrictHostKeychecking=no  root@"${i[*]}" "yum update -y"
        sshpass -p "${Pass}"  ssh -o PreferredAuthentications=password -o StrictHostKeychecking=no root@"${i[*]}" "reboot"
        continue

done #Finish for loop

break #Breaks While loop

done
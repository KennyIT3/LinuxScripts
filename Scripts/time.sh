#!/bin/bash
yum install -y ntp
ntp="/etc/"
cd $ntp
sed -i  's/^server [0-3]/#&/' /etc/ntp.conf_backup
cat /etc/ntp.conf_backup | grep "^#server [0-3]"
#sed -i  's/^#server/server /' ntp.conf
awk '/^# Please consider joining/ { print; print "server ntp.test.local iburst"; next }1' ntp.conf_backup > ntps.conf && mv -f ntps.conf ntp.conf_backup
systemctl restart ntpd.service
systemctl status ntpd.service


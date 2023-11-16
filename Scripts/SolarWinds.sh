#!/bin/bash
#Variable
snmp="/etc/snmp"

#Script, used for PROD, SIT, TEST, UAT, QA

cd $snmp

rm snmpd.conf

touch snmpd.conf;

echo -e agentAddress udp:161 >> /etc/snmp/snmpd.conf

echo -e rocommunity <password> <Ip Address> >> /etc/snmp/snmpd.conf

echo -e "Example"
echo -e rocommunity JzJAh2 172.25.55.38/24 >> /etc/snmp/snmpd.conf

restart=$(systemctl restart snmpd.service)

start=$(systemctl start snmpd.service)

service=$(systemctl status snmpd.service | grep 'running')

echo $restart

#Redundancy

echo $start

echo $service

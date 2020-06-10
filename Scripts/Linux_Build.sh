#!/bin/bash
snmp="/etc/snmp"
ntp="/etc/"
user="demo"

echo -n "Do you want to add Host to Redhat or remove host from Redhat: "
read Redhat
echo $Redhat
if [[ $Redhat == "yes" || $Redhat == "YES" || $Redhat == "Yes" ]]; then 
	
	echo -n  "Please enter the password: "
	read pass
	echo $pass
	
	subscription-manager register --username=$user --password=$pass
    echo -n "Please enter the pool you wish to use: "
	
	read pool
	
	subscription-manager attach --pool=$pool
	subscription-manager refresh

	yum -y install net-snmp

	cd $snmp

	rm snmpd.conf

	touch snmpd.conf; echo -e "agentAddress udp:161 \nrocommunity DemoP@sswo1d" >> snmpd.conf

	start=$(systemctl start snmpd.service)

	service=$(service snmpd status | grep 'running')

	echo $start
	echo $service

	echo "The NTP script"
	source /Linux/time.sh
	

	cd $ntp

	sed -i  's/^server [0-3]/#&/' /etc/ntp.conf

	cat /etc/ntp.conf | grep "^#server [0-3]"


	echo "Open ports 52311 in the firewall"

	firewall-cmd --add-port=53211/tcp --permanent

	firewall-cmd --add-port=53211/udp --permanent

	firewall-cmd --reload

	
	echo "Start the service"

	systemctl start sshd

	echo "Make sure the service starts up automatically"

	chkconfig sshd on
	
	
elif [[ $Redhat == "no" || $Redhat == "NO" || $Redhat == "No" ]]; then 
	echo "Removing the subscription"
	subscription-manager unregister
	subscription-manager clean

	
	
elif [[ $Redhat == "done" || $Redhat == "DONE" || $Redhat == "Done" ]]; then
	yum update

	
	
else 	
    echo "Exiting Script"
	exit 0 
fi 

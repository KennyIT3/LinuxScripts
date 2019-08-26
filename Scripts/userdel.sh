#Script to add a user to Linux system
cat /etc/passwd

while [ $(id -u) -eq 0 ]; do
	# Enter Username
	read -p "Enter username : " username
	# Display the User_acceount
	user=$(getent passwd | grep -w $username  )
	echo $user
	echo " $user Is this the user you want"
	read -p "Do you want to continue"
	# Kill all the process that the user is running
	ps -u $username
	COMMAND_1="ps -u $username --no-heading"
	# COMMAND_3="xargs -d \\n /usr/bin/sudo /bin/kill"
	COMMAND_3=$(pkill -u $username)
	$COMMAND_1 | gawk '{print $1}' | $COMMAND_3
	# If user doesn't exist the exit the script
	if [ $? -eq 1 ]; then
		echo "$username does not exists!"
		exit 1
	else
	# Delete the user and the user home directory
		userdel -r $username
	fi
	echo 'Press <CTRL+C> to exit if you have no more users.'; sleep 1;
done


# else
# 	echo "Only root may add a user to the system"
# fi
# cat /etc/passwd

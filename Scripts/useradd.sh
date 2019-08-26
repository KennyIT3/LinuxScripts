#Script to add a user to Linux system
cat /etc/passwd

while  [ $(id -u) -eq 0 ]; do
	ns="yes"
	m="no"
	read -p "Enter username : " username
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username Already exists!"
		read -p "Do you want to continue: Enter yes or no : " output
		if [ "$output" == "$m" ];
			then
			echo "$output Thanks for using"
			exit 1
		fi
		# echo $output
# elif [[$? -eq 0 ]];
	#statements
	# elif test $output != $ns
	# then
	# 	echo "$output Thanks for using"
	# 	exit 1
else
		read -s -p "Enter password : " password
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		useradd -m -p $pass $username
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
fi
echo 'Press <CTRL+C> to exit if you have no more users.'; sleep 1;

done
# else
echo "Only root may add a user to the system"
# fi
# cat /etc/passwd

#/bin/bashr
echo "Who has enter your computer?:"
w
echo
echo " here is list of users tied to the login"
getent passwd | less
echo
who
echo
echo 
lastlog

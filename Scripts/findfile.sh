#!/bin/bash
declare -i a
a=1
echo -e "where is this file at:"
echo
read file
echo
if test -f $file 
	then
		echo $file "exits.."
	else
		echo $file "doesn't exists"

fi
for a in $(seq 15)
do 
	echo "what number you at" $a

done

exit 0

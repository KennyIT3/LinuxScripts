#!/usr/bin/env bash
DIRS=("/root" "/var") # Just used predetermined directories to test script

#Makes sure that only root user can excute the script
if [ $(id -u) -ne 0 ];  then
    echo "This script must be run as root."
    exit 1
else
  echo ""
  echo -e "\e[31;42m***** You are the root User  *****\e[0m"

for files in "${DIRS[@]}";
do
      echo ""
      echo -e "\e[31;43m***** ${files[@]}:This is the directory we are searching for files  *****\e[0m"
      echo ""
      s=$(find  "${files[@]}" -type f -mtime 0 -regex '.*[A-Za-z].*'  -exec ls {} \;) #key varaible to test

      if [ "$s" != 0 ]; # If S finds no files then it skips to directories
      then
        echo "Here is a list of files"
        #Search for files in the directories which have been modified in the last twenty-four hours and are over 1 Kilobytes
        find  "${files[@]}" -type f -mtime 0 -regex '.*[A-Za-z].*' -size +1k -exec ls {} \;
        echo
        read -p "Does user want to remove these files? " file

      else
        echo "No Files"
        echo
        echo "Here is a list of Directories"
        # Checks the directories however it leaves out the top directory
        find "${files[@]}" -maxdepth 1 -type d ! -path "${files[@]}" ! -path "${files[@]}" -regex '.*[A-Za-z].*' -exec ls -d {} \;
        echo
        read -p "Does user want to remove empty directory? " input
      fi

      #For directories
      if [ "$input" == 'yes' ] || [ "$input" == 'YES' ] || [ "$input" == 'Yes'  ]; then
        #Removes all the empty directories that are under the top directories
        find "${files[@]}" -maxdepth 1 -type d ! -path "${files[@]}" ! -path "${files[@]}" -empty -regex '.*[A-Za-z].*' -exec rm -r {} \;
        echo
        echo "Directories have been removed"

      elif [ "$input" == 'no' ] || [ "$input" == 'YES' ] || [ "$input" == 'Yes'  ]; then
        echo "bye"
      fi

      #For files
      if [ "$file" == 'yes' ] || [ "$file" == 'YES' ] || [ "$file" == 'Yes'  ]; then
        echo
        #Removes the files
        find  "${files[@]}" -type f -mtime 0 -regex '.*[A-Za-z].*' -size +1k -exec rm -r {} \;
        echo "Files have been removed"

      elif [ "$file" == 'no' ] || [ "$file" == 'NO' ] || [ "$file" == 'No'  ]; then
        echo "bye"
      fi
echo

done # Ends the for loop
fi # For the first if conditional

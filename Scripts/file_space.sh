#Disk Space
Check_directory=$"/root/  /home/ /var/log/ /trash"
############## Main Script #################################
#
DATE=$(date '+%m%d%y') 
		#Date for report file
File=$exec > disk_space_$DATE.rpt 
		#Make report file STDOUT
#
echo "Top Ten Disk Space Usage" #Report header
echo "for $CHECK_DIRECTORIES Directories"
#
for DIR_CHECK in $Check_directory #Loop to du directories
do
echo ""
echo "The $DIR_CHECK Directory:" #Directory header
#
# Create a listing of top ten disk space users in this dir
du -h $DIR_CHECK 2>/dev/null |
sort -rn |
sed '{11,$D; =}' |
sed 'N; s/\n/ /' |
gawk '{printf $1 ":" "\t" $2 "\t" $3 "\n"}'
#
done #End of loop
#
echo $File
exit

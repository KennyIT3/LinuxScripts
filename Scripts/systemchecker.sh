# Written by Kenneth
# This script will return the system information: for our VMs
/sbin/mount.cifs //10.20.30.20/Departments/InformationTechnology/KenScripts /appData/newScripts/ -o username=coxNet2,password=w@lk3rp@ss,domain=Callisto
# -Hostname information:
echo -e "\e[31;43m***** HOSTNAME INFORMATION *****\e[0m"
hostname
echo ""
# -File system disk space usage:
echo -e "\e[31;43m***** FILE SYSTEM DISK SPACE USAGE *****\e[0m"
df -h
echo ""
# -Free and used memory in the system:
echo -e "\e[31;43m ***** FREE AND USED MEMORY *****\e[0m"
free
# -List of Partitions in Linux VMs
echo -e "\e[31;43m ***** Partitions *****\e[0m"
fdisk -l
echo ""
# -System uptime and load:
echo -e "\e[31;43m***** SYSTEM UPTIME AND LOAD *****\e[0m"
uptime
echo ""
# -Load:
echo -e "\e[31;43m***** Load Average *****\e[0m"
cat /proc/loadavg
echo ""
# -Logged-in users:
echo -e "\e[31;43m***** CURRENTLY LOGGED-IN USERS *****\e[0m"
who
# -Logged-in users and they are doing:
echo -e "\e[31;43m***** CURRENTLY LOGGED-IN USERS They are doing *****\e[0m"
w
echo ""
#CPU Information
echo -e "\e[31;43m***** CPU INFO *****\e[0m"
cat /proc/cpuinfo
echo ""
# -Top 5 processes as far as memory usage is concerned
echo -e "\e[31;43m***** TOP 5 MEMORY-CONSUMING PROCESSES *****\e[0m"
ps -eo %mem,%cpu,comm --sort=-%mem | head -n 6
echo ""
echo -e "\e[1;32mDone.\e[0m"
cp /root/Scripts/systemchecker.sh /appData/newScripts
umount /appData/newScripts

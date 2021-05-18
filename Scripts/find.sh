find /LinuxScripts/Scripts/* -type f -atime +1 -print | grep '.sh$' | xargs ls
echo
echo -e "Show the First Five Files"
find /LinuxScripts/Scripts/*  -type f -exec ls -s '{}' \; | sort -n -r | head -5

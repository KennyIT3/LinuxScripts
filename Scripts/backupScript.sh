# Create Mount Point To File Server
/sbin/mount.cifs //(insert IP)/Backups/ /appData/disasterRecovery/Backups/ -o username=test,password=test1,domain=testserver

# Backup OS Ticket Database
mysqldump -u root -ptestpass --routines support > /root/backupScripts/osTicketbackup.sql;

# Tar ( /appData/disasterRecovery/Backups/OSTicket/ )
tar czf /appData/disasterRecovery/Backups/OSTicket/osTicketbackup.tar.gz -C /root/backupScripts ./osTicketbackup.sql;

# Backup Snipe IT Database
mysqldump -u root -ptestpass --routines snipeit > /root/backupScripts/snipeITbackup.sql;

# Tar ( /appData/disasterRecovery/Backups/SnipeIT/ )
tar czf /appData/disasterRecovery/Backups/SnipeIT/snipeITbackup.tar.gz -C /root/backupScripts ./snipeITbackup.sql;

rm /root/backupScripts/osTicketbackup.sql;
rm /root/backupScripts/snipeITbackup.sql;

# Unmount File Server Directory
umount /appData/disasterRecovery/Backups;

# Backup Script To Capture DB Backup and File Backups To The File Server
/sbin/mount.cifs //(Insert IP)Backups/ /appData/disasterRecovery/Backups/ -o username=test,password=testp@ss,domain=testserver

# Stop Replication
mysql -u root -p3ncrypt10np@ss -e "stop slave";

# Take Replication Log Position
mysql -u root -p3ncrypt10np@ss -e "show slave status\G" > /root/backupScripts/backupLogPosition.txt;

# Backup Database
mysqldump -u root -p3ncrypt10np@ss --routines testProd_dbo > /root/backupScripts/DBOBackup.sql;
tar czf /appData/disasterRecovery/Backups/test/testSQL_dbo/dboBackup-`date +%b-%d-i%y`.tar.gz -C /root/backupScripts ./DBOBackup.sql ./backupLogPosition.txt;
rm /root/backupScripts/DBOBackup.sql;
rm /root/backupScripts/backupLogPosition.txt;

# Restart Replication
mysql -u root -p3ncrypt10np@ss -e "start slave";

# Clear Out Any Backups Older Than 30 Days (Except For Those On The First Of Each Month)
find /appData/disasterRecovery/Backups/test/testSQL_dbo/ -mtime +30 -regex '.*[A-Za-z][A-Za-z][A-Za-z]-\([0][2-9]\|[1-3][0-9]\)-[0-9][0-9].*' -exec rm {} \;

# Backup CoxNet Application Archive File
cp /home/jboss/test-ear.ear /appData/disasterRecovery/Backups/test/AppFiles/test-ear-`date +%b-%d-%y`.ear;
# Clear Out Any Backups Older Than 30 Days (Except For Those On The First Of Each Month)
find /appData/disasterRecovery/Backups/test/AppFiles/ -mtime +30 -regex '.*[A-Za-z][A-Za-z][A-Za-z]-\([0][2-9]\|[1-3][0-9]\)-[0-9][0-9].*' -exec rm {} \;
# Unmount File Server Directory
umount /appData/disasterRecovery/Backups;

# Sync Invoices
/sbin/mount.cifs //(Insert IP)/Invoices/ /appData/disasterRecovery/BackupInvoices -o username=test,password=testp@ss,domain=testserver
rsync -vur /appData/applicationFiles/invoices/ /appData/disasterRecovery/BackupInvoices;
umount /appData/disasterRecovery/BackupInvoices;

# Sync Renewals
/sbin/mount.cifs //(Insert IP)/Renewals/ /appData/disasterRecovery/BackupRenewals -o username=test,password=testp@ss,domain=testserver
rsync -vur /appData/applicationFiles/renewals/ /appData/disasterRecovery/BackupRenewals;
umount /appData/disasterRecovery/BackupRenewals;

# Sync Service Proposals
/sbin/mount.cifs //(Insert IP)/ServiceProposals/ /appData/disasterRecovery/BackupServiceProposals -o username=test,password=testp@ss,domain=testserver
rsync -vur /appData/applicationFiles/serviceProposals/ /appData/disasterRecovery/BackupServiceProposals;
umount /appData/disasterRecovery/BackupServiceProposals;

# Sync Electronic Documents
/sbin/mount.cifs //(Insert IP)/ElectronicDocuments/ /appData/disasterRecovery/BackupElectronicDocuments -o username=test,password=testp@ss,domain=testserver
rsync -vur /appData/applicationFiles/ElectronicDocuments/ /appData/disasterRecovery/BackupElectronicDocuments;
umount /appData/disasterRecovery/BackupElectronicDocuments;

# Sync External Documents
/sbin/mount.cifs //(Insert IP)/ExternalDocuments/ /appData/disasterRecovery/BackupExternalDocuments -o username=test,password=testp@ss,domain=testserver
rsync -vur /appData/applicationFiles/ExternalDocuments/ /appData/disasterRecovery/BackupExternalDocuments;
umount /appData/disasterRecovery/BackupExternalDocuments;

# Sync Web ads
/sbin/mount.cifs //(Insert IP)/webAds/ /appData/disasterRecovery/BackupWebAds -o username=test,password=testp@ss,domain=testserver
rsync -vur /appData/applicationFiles/webAds/ /appData/disasterRecovery/BackupWebAds;
umount /appData/disasterRecovery/BackupWebAds;

# Sync Batch Contents
/sbin/mount.cifs //(Insert IP)/BatchContents/ /appData/disasterRecovery/BackupBatchContents -o username=test,password=testp@ss,domain=testserver
rsync -vur /appData/applicationFiles/BatchContents/ /appData/disasterRecovery/BackupBatchContents;
umount /appData/disasterRecovery/BackupBatchContents;


#!/bin/bash

TODATE=`date +%Y%m%d`    # format date/time in YYYYMMDD format
#DATE=$(date -d yesterday '+%Y%m%d')
SERVERNAME=`hostname | cut -d '.' -f 1`
SCRIPT_DIR=/usr/scripts/backups
USER='bkpuser'
PASSWORD='test@passowrd'
#BASE_DIR=/media/backups/db_backups/$SERVERNAME
BASE_DIR=/media/backups/db_backups/ccdralmydb01
BACKUPTYPE=full
TARGET_DIR="$BASE_DIR/${TODATE}full"
#echo "TARGET_DIR = $TARGET_DIR"

#Create backup directory if it does not exist
if [ ! -e $TARGET_DIR ]; then
    echo "Creating full backup directory $TARGET_DIR"
    mkdir $TARGET_DIR
else
    echo "Backup directory exists. Exiting..."
    exit
fi

# Remove backup directories older than 28 days
cd $BASE_DIR
for d in */
do
    CURRENT_DIR=${d%/}
    DIR_LEN=${#CURRENT_DIR}
    if (( "$DIR_LEN" >= 12 )); then
        DIR_DATE=${CURRENT_DIR:0:(8)}
        DIR_DATE=$(date -d "$DIR_DATE" +%s)
		TODATE2=$(date -d "$TODATE" +%s)
        DIR_AGE=$(( (TODATE2 - DIR_DATE) / 86400 ))
        if [[ "$DIR_AGE" -gt 28 ]]
        then
            echo "Directory $CURRENT_DIR is older than 4 weeks ($DIR_AGE days) and will be deleted."
            rm -rf $CURRENT_DIR
            echo
        fi
    fi
done

echo "Running command:"
echo "xtrabackup --user=$USER --password=$PASSWORD --backup --target-dir=$TARGET_DIR"
echo
#`xtrabackup --user=$USER --password=$PASSWORD --backup --target-dir=$TARGET_DIR`
`xtrabackup --backup --target-dir=$TARGET_DIR`

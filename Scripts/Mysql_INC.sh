INC_TARGET_DIR=$BASE_DIR/$TODATE$BACKUPTYPE$DAYOFWEEK
SERVERNAME=`hostname | cut -d '.' -f 1`
#!/bin/bash
RecINC_TARGET_DIR=$BASE_DIR/$DATE$BACKUPTYPE$YESTDAYOFWEEK
FULL="$BASE_DIR/${FULLDATE}full"
FULL_TARGET_DIR="$BASE_DIR/${DATE}${BACKUPTYPE}${YESTDAYOFWEEK}"
#FULL_TARGET_DIR="$BASE_DIR/${DATE}inc[0-9]"

#Create backup directory if it does not exist
if [ ! -e $INC_TARGET_DIR ]; then
    echo "******************************************************************************************************"
    echo "Creating incremental backup directory $INC_TARGET_DIR"
    mkdir $INC_TARGET_DIR
else
    echo "Backup directory $INC_TARGET_DIR exists. Exiting..." #| mail -s " Job Failed " testemail@gmail.com
fi

echo "Running command:"
echo "xtrabackup --user=$USER --password=$PASSWORD --backup --target-dir=$INC_TARGET_DIR --incremental-basedir=$FULL_TARGET_DIR"
echo "******************************************************************************************************"
echo

# Runs backup job for either full backup or previous incremental job
if [ "$Mon" = "Mon" ];  then
        echo "******************************************************************************************************"
        echo Running incremental for Full backup
        `xtrabackup --backup --target-dir=$INC_TARGET_DIR --incremental-basedir=$FULL`
else
        echo Running incremental for previous incremental
        `xtrabackup --backup --target-dir=$INC_TARGET_DIR --incremental-basedir=$FULL_TARGET_DIR`
fi

#`xtrabackup --backup --target-dir=$INC_TARGET_DIR --incremental-basedir=$FULL_TARGET_DIR`
#`xtrabackup --user=$USER --password=$PASSWORD --backup --target-dir=$INC_TARGET_DIR --incremental-basedir=$FULL_TARGET_DIR`
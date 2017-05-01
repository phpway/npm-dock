#!/bin/bash

STATUS=$(docker inspect -f {{.State.Running}} npm-dock-db)
if [ "$STATUS" != "true" ]; then
    echo 'Aborting: It seems that npm-dock-db container is not running'
    exit 1
fi

DB_BACKUP_PATH=$(dirname $0)/../data/db-backup
TIMESTAMP_SUFFIX=`date +%FT%T%Z`
DB_FILE_NAME=$DB_BACKUP_PATH/db-dump_$TIMESTAMP_SUFFIX

mkdir -p $DB_BACKUP_PATH

docker exec -it npm-dock-db /bin/sh -c "~/db-dump.sh" > $DB_FILE_NAME
echo "Database backed up in $(realpath $DB_FILE_NAME)"

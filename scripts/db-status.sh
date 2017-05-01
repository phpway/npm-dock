#!/bin/bash

STATUS=$(docker inspect -f {{.State.Running}} npm-dock-db)
if [ "$STATUS" != "true" ]; then
    echo 'Aborting: It seems that test npm-dock-db container is not running'
    exit 1
fi

docker exec -t -i npm-dock-db service mysql status

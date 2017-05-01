#!/bin/bash

STATUS=$(docker inspect -f {{.State.Running}} npm-dock-db-test)
if [ "$STATUS" != "true" ]; then
    echo 'Aborting: It seems that test npm-dock-db-test container is not running'
    exit 1
fi

docker exec -t -i npm-dock-php phpunit --bootstrap /www/tests/TestBootstrap.php /www/tests

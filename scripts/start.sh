#!/bin/bash

CONFIG_DIR=$(dirname $0)/../config
IMAGES_DIR=$(dirname $0)/../images

# import config files necessary for building Docker images
if [ -f ${CONFIG_DIR}/web-server.conf ]; then
    SERVER_CONF_FILE=${CONFIG_DIR}/web-server.conf
else
    SERVER_CONF_FILE=${CONFIG_DIR}/web-server.conf.dist
fi

if [ -f ${CONFIG_DIR}/php.ini ]; then
    PHP_INI_FILE=${CONFIG_DIR}/php.ini
else
    PHP_INI_FILE=${CONFIG_DIR}/php.ini.dist
fi

if [ -f ${CONFIG_DIR}/composer.json ]; then
    COMPOSER_FILE=${CONFIG_DIR}/composer.json
else
    COMPOSER_FILE=${CONFIG_DIR}/composer.json.dist
fi

if [ -f ${CONFIG_DIR}/schema.json ]; then
    SQL_SCHEMA_FILE=${CONFIG_DIR}/schema.sql
else
    SQL_SCHEMA_FILE=${CONFIG_DIR}/schema.sql.dist
fi

cp -f $SERVER_CONF_FILE ${IMAGES_DIR}/nginx/web-server.conf
cp -f $PHP_INI_FILE     ${IMAGES_DIR}/php/php.ini
cp -f $COMPOSER_FILE    ${IMAGES_DIR}/php/composer.json
cp -f $SQL_SCHEMA_FILE  ${IMAGES_DIR}/db/schema.sql

# supply default html page if web folder doesn't exist
if [ ! -d $(dirname $0)/../src ]; then
    mkdir -p $(dirname $0)/../src/public
    echo "<?php echo '<html><body><h2>It Works!</h2><p>Edit <tt>src/public/index.php</tt> to start</p></body></html>';" > $(dirname $0)/../src/public/index.php
fi

# build images
${IMAGES_DIR}/build.sh

# stop and start containers
$(dirname $0)/down.sh
$(dirname $0)/up.sh

open "http://localhost:8080"
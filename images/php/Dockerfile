FROM php:7.1.2-fpm

RUN apt-get update && apt-get install -y \
    curl \
    zip \
    && docker-php-ext-install -j$(nproc) pdo_mysql opcache \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# install packages via composer
COPY composer.json /composer.json
RUN composer install --no-plugins --no-scripts --working-dir=/ --no-interaction \
    && rm /composer.json

# set php.ini file
COPY php.ini /usr/local/etc/php

# set data path for the application
ENV NPM_DOCK_PATH /data

# add vendor bin dir into path to make it easier running phpunit and other tools
ENV PATH $PATH:/vendor/bin

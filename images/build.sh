#!/bin/bash

pushd $(dirname $0)
for image in db nginx php; do
    if [ -d "./$image" ]; then
        echo "[=== Building $image image ===]";
        pushd ./$image;
        docker build -t npm-dock-${image} .
        popd;
    fi;
done
popd

docker pull phpmyadmin/phpmyadmin
docker tag phpmyadmin/phpmyadmin npm-dock-phpmyadmin
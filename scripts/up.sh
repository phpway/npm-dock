#!/bin/bash

pushd $(dirname $0)/../images
docker-compose up -d
popd

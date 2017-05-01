#!/bin/bash

pushd $(dirname $0)/../images
docker-compose -f docker-compose.yml -f docker-compose.test.yml down
popd

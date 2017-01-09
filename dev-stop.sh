#!/bin/bash

filetouse="dev-jupyter-docker-compose.yml"

echo "Stopping Composition: $filetouse"
docker-compose -f $filetouse stop
echo "Done"

docker stop redis-server jupyter >> /dev/null
docker rm redis-server jupyter >> /dev/null

exit 0

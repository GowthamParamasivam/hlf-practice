#!/usr/bin/env bash

echo "===== removing docker volumes ======"
BASEDIR=$(dirname "$0")
docker-compose -f $BASEDIR/../docker-compose-files/docker-compose.yaml down
docker volume rm $(docker volume ls)
echo "Done."
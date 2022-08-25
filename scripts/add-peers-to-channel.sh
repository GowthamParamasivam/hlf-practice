#!/usr/bin/env bash

echo "===== creating artifacts and adding peers to ageofultron channel ======"
BASEDIR=$(dirname "$0")
bash $BASEDIR/clean-artifacts.sh
bash $BASEDIR/create-genesis.sh
bash $BASEDIR/create-channel.sh

# echo "===== Executing commands inside docker container to generate application genesis block ====="
# docker exec hulk-cli /bin/bash $BASEDIR/channel-hulk.sh
echo "Done."
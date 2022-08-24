#!/usr/bin/env bash

echo "===== generating the genesis.block ======"
BASEDIR=$(dirname "$0")
# echo "$BASEDIR"
rm -Rfv $BASEDIR/../artifacts/*
configtxgen -configPath $BASEDIR/../config-files/ -outputBlock $BASEDIR/../artifacts/genesis.block -profile MarvelGenesis -channelID system-channel
echo "Done."
#!/usr/bin/env bash

echo "===== generating the genesis.block ======"
BASEDIR=$(dirname "$0")
# echo "$BASEDIR"
rm -Rfv ../artifacts/genesis.block
configtxgen -configPath ../config-files/ -outputBlock ../artifacts/genesis.block -profile MarvelGenesis -channelID system-channel
echo "Done."
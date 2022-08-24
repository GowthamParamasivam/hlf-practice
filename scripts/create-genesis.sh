#!/usr/bin/env bash

echo "===== generating the genesis.block ======"
BASEDIR=$(dirname "$0")
# echo "$BASEDIR"
rm -Rfv $BASEDIR/../artifacts/*
configtxgen generate --config $BASEDIR/../config-files/crypto-config.yaml --output $BASEDIR/../crypto-config
echo "Done."
#!/usr/bin/env bash

echo "===== generating the crypto materials ======"
BASEDIR=$(dirname "$0")
# echo "$BASEDIR"
cryptogen generate --config $BASEDIR/../config-files/crypto-config.yaml --output $BASEDIR/../crypto-config
echo "Done."
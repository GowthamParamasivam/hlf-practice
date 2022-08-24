#!/usr/bin/env bash

echo "===== generating the application channel ======"
BASEDIR=$(dirname "$0")
# echo "$BASEDIR"
rm -Rfv $BASEDIR/../artifacts/ageofultron.tx
configtxgen -configPath $BASEDIR/../config-files/ -outputCreateChannelTx $BASEDIR/../artifacts/ageofultron.tx -profile AgeOfUltronChannel -channelID ageofultron
echo "Done."
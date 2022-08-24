#!/usr/bin/env bash

echo "===== generating the application channel ======"
BASEDIR=$(dirname "$0")
CHANNEL_FILE=ageofultron.tx
rm -Rfv $BASEDIR/../artifacts/$CHANNEL_FILE
configtxgen -configPath $BASEDIR/../config-files/ -outputCreateChannelTx $BASEDIR/../artifacts/$CHANNEL_FILE -profile AgeOfUltronChannel -channelID ageofultron
echo "Done."
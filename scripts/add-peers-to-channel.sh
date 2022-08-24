#!/usr/bin/env bash

echo "===== creating artifacts and adding peers to ageofultron channel ======"
BASEDIR=$(dirname "$0")
bash $BASEDIR/clean-artifacts.sh
bash $BASEDIR/create-genesis.sh
bash $BASEDIR/create-channel.sh

# echo "===== Executing commands inside docker container to generate application genesis block ====="
# docker exec hulk-cli /bin/bash 
# peer channel create -o orderer.bx.com:7050  --ordererTLSHostnameOverride orderer.bx.com -c ageofultron -f /etc/hyperledger/artifacts/ageofultron.tx --outputBlock /etc/hyperledger/artifacts/ageofultron.block --tls --cafile "${ORDERER_TLS_CA}"
echo "Done."
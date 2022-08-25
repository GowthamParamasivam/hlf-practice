#!/usr/bin/env bash

cd /etc/hyperledger/artifacts/
peer channel create -o orderer.bx.com:7050  --ordererTLSHostnameOverride orderer.bx.com -c ageofultron -f ./ageofultron.tx --outputBlock ./ageofultron.block --tls --cafile "${ORDERER_TLS_CA}"
peer channel join -b ./ageofultron.block
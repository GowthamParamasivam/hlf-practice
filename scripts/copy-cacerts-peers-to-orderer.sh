#!/usr/bin/env bash

echo "===== Copy cacerts from peers to orderer ======"
cp ../crypto-config/peerOrganizations/hulk.bx.com/peers/peer0.hulk.bx.com/msp/cacerts/ca.hulk.bx.com-cert.pem ../crypto-config/ordererOrganizations/bx.com/orderers/orderer.bx.com/msp/cacerts/
cp ../crypto-config/peerOrganizations/ironman.bx.com/peers/peer0.ironman.bx.com/msp/cacerts/ca.ironman.bx.com-cert.pem ../crypto-config/ordererOrganizations/bx.com/orderers/orderer.bx.com/msp/cacerts
echo "Done."
# Private Data 

## Step 1: Package the chaincode

`peer lifecycle chaincode package asset_transfer.tar.gz --path ./chaincode-go/ --lang golang --label asset_transfer_1.0`

## Step 2: Create the collections_config.json file, to utilize the implicit private data and private data

## Step 3: install chaincode to the peers

`peer lifecycle chaincode install asset_transfer.tar.gz`

## Step 3: Check Installed chaincodes

`peer lifecycle chaincode queryinstalled`

## Step 4: Approving Chaincode, make sure you are giving the proper chaincode definition

`peer lifecycle chaincode approveformyorg -o orderer.bx.com:7050 --ordererTLSHostnameOverride orderer.bx.com --channelID ageofultron --name asset_transfer --version 1.0 --package-id asset_transfer_1.0:cd3cda62c6deaf26f55ec5a3cd55106f5da557ea0ddca8d99fcd1d48bc30e9d6 --sequence 1 --tls --cafile "${ORDERER_TLS_CA}" --signature-policy "AND ('HulkMSP.member','IronmanMSP.member')" --collections-config ./collections_config.json`

## Step 5: Query Approved chaincode

`peer lifecycle chaincode queryapproved -C ageofultron -n asset_transfer --sequence 1 --output json`

## Step 6: Checking commit readyness

`peer lifecycle chaincode checkcommitreadiness --channelID ageofultron --name asset_transfer --version 1.0 --sequence 1 --tls --cafile "${ORDERER_TLS_CA}" --signature-policy "AND ('HulkMSP.member','IronmanMSP.member')" --collections-config ./collections_config.json --output json`

## Step 7: Committing Chaincode

`peer lifecycle chaincode commit -o orderer.bx.com:7050 --channelID ageofultron --name asset_transfer --version 1.0 --sequence 1 --tls --cafile "${ORDERER_TLS_CA}" --signature-policy "AND ('HulkMSP.member','IronmanMSP.member')" --peerAddresses peer0.hulk.bx.com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hulk.bx.com/peers/peer0.hulk.bx.com/tls/ca.crt --peerAddresses peer0.ironman.bx.com:7052 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ironman.bx.com/peers/peer0.ironman.bx.com/tls/ca.crt --collections-config ./collections_config.json`

## Step 7: Querying commited status

`peer lifecycle chaincode querycommitted --channelID ageofultron --name asset_transfer --cafile "${ORDERER_TLS_CA}"`

## Step 8: Invoke chaincode- initialize 

`export ASSET_PROPERTIES=$(echo -n "{\"objectType\":\"asset\",\"assetID\":\"asset1\",\"color\":\"green\",\"size\":20,\"appraisedValue\":100}" | base64 | tr -d \\n)`

`peer chaincode invoke -o orderer.bx.com:7050 --tls --cafile "${ORDERER_TLS_CA}" -C ageofultron -n asset_transfer -c '{"function":"CreateAsset","Args":[]}' --transient "{\"asset_properties\":\"$ASSET_PROPERTIES\"}"`



discover --configFile discovery-conf.yaml --peerTLSCA $CORE_PEER_TLS_ROOTCERT_FILE --userKey /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hulk.bx.com/users/User1@hulk.bx.com/msp/keystore/priv_sk --userCert /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/hulk.bx.com/users/User1@hulk.bx.com/msp/signcerts/User1@hulk.bx.com-cert.pem --MSP HulkMSP saveConfig

`discover --configFile discovery-conf.yaml peers --channel ageofultron --server peer0.hulk.bx.com:7051`

`discover --configFile discovery-conf.yaml config --channel ageofultron --server peer0.hulk.bx.com:7051`
# Chaincode Deployment 
<br/>

## 1. Copy the chaincode into the proper container folder
<br/>

## 2. Package the chaincode
<br/>

```bash
peer lifecycle chaincode package mycc.tar.gz --path $CHAINCODE_DIR --lang java --label myccv1
```
## 3. Install the chaincode

```bash
peer lifecycle chaincode install mycc.tar.gz 
```

## 4. Query Installed Chaincode

```bash 
peer lifecycle chaincode queryinstalled
```

## 5. Approve Chaincode

```bash

peer lifecycle chaincode approveformyorg  -o orderer.bx.com:7050 --tls --cafile "${ORDERER_TLS_CA}" --channelID ageofultron --name mycc --version 1.0 --init-required --package-id myccv1:e3749f6c5ec86512ee491c1c4951ca40b256a563d72b8c4f2e2f2da0248cd35a --sequence 1
```

## 6. Query Approve Chaincode

```bash
peer lifecycle chaincode queryapproved -C ageofultron -n mycc --sequence 1
```

## 7. Check Commit Readiness

```bash
peer lifecycle chaincode checkcommitreadiness --channelID ageofultron --name mycc --version 1.0 --init-required --sequence 1
```
## 8. Run the command in Hulk-cli to commit the chaincode to channel

```bash
peer lifecycle chaincode commit -o orderer.bx.com:7050 --channelID ageofultron --name mycc --version 1.0 --sequence 1 --init-required --tls --cafile "${ORDERER_TLS_CA}" --peerAddresses peer0.hulk.bx.com:7051 --tlsRootCertFiles "${CORE_PEER_TLS_CERT_FILE}" --peerAddresses peer0.ironman.bx.com:7052 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ironman.bx.com/peers/peer0.ironman.bx.com/tls/server.crt
```

## 9. Query Commited Chaincodes

```bash
peer lifecycle chaincode querycommitted --channelID ageofultron --name mycc
```

## 10. Initialize the Chaincode 

```bash
peer chaincode invoke -o orderer.bx.com:7050 --tls --cafile "${ORDERER_TLS_CA}" -n mycc -c '{"Args":["InitLedger"]}' -C ageofultron --peerAddresses peer0.hulk.bx.com:7051 --tlsRootCertFiles "${CORE_PEER_TLS_CERT_FILE}" --peerAddresses peer0.ironman.bx.com:7052 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ironman.bx.com/peers/peer0.ironman.bx.com/tls/server.crt --isInit
```

## 11. Query the chaincode

```bash
peer chaincode invoke -o orderer.bx.com:7050 --tls --cafile "${ORDERER_TLS_CA}" -n mycc -c '{"Args":["GetAllAssets"]}' -C ageofultron
```
# Chaincode installation steps

## Step 1: Packaging the chaincode, executed inside cli container

`peer lifecycle chaincode package fabcar.tar.gz --path ./javascript/ --lang node --label fabcar_1.0`

## Step 2: Install the chaincode to the peer

`peer lifecycle chaincode install fabcar.tar.gz`

## Step 3: Check Installed chaincodes

`peer lifecycle chaincode queryinstalled`

## Step 4: Approving Chaincode, Package Id to be changed accordingly

`peer lifecycle chaincode approveformyorg -o orderer.bx.com:7050 --ordererTLSHostnameOverride orderer.bx.com --channelID ageofultron --name fabcar --version 1.0 --package-id fabcar_1.0:2eedd5f43075453ce6691a984967e378cacd073ca0f51756d93482f319766787 --sequence 1 --tls --cafile "${ORDERER_TLS_CA}" --init-required`

## Step 5: Checking CommitReadiness of the chaincode

`peer lifecycle chaincode checkcommitreadiness --channelID ageofultron --init-required --name fabcar --version 1.0 --sequence 1 --tls --cafile "${ORDERER_TLS_CA}" --output json`


## Step 6: Committing Chaincode

`peer lifecycle chaincode commit -o orderer.bx.com:7050 --channelID ageofultron --init-required --name fabcar --version 1.0 --sequence 1 --tls --cafile "${ORDERER_TLS_CA}"`

## Step 7: Querying commited status

`peer lifecycle chaincode querycommitted --channelID ageofultron --name fabcar --cafile "${ORDERER_TLS_CA}"`

## Step 8: Invoke chaincode - query

`peer chaincode invoke -o orderer.bx.com:7050 --tls --cafile "${ORDERER_TLS_CA}" -C ageofultron -n fabcar -c '{"function":"initLedger","Args":[]}' --isInit`

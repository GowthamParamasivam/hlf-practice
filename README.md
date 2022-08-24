### HLF Practice

Repo aimed for beginners understanding of hyperledger fabric

**Execute inside the peers cli containers**

**To Create channel Block**

`peer channel create -o orderer.bx.com:7050  --ordererTLSHostnameOverride orderer.bx.com -c ageofultron -f ./ageofultron.tx --outputBlock ./ageofultron.block --tls --cafile "${ORDERER_TLS_CA}"`

**To Add the peer to the channel**

`peer channel join -b ./ageofultron.block`
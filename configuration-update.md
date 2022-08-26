# Update Channel Configuration

## Step 1: Fetch the configuration

`peer channel fetch config config_block.pb -o orderer.bx.com:7050 -c ageofultron --tls --cafile "${ORDERER_TLS_CA}"`

## Step 2: Decode the config block to json format

`configtxlator proto_decode --input config_block.pb --type common.Block --output config_block.json`

## Step 3: Filterout the config part from the config_block.json

`jq .data.data[0].payload.data.config config_block.json > config.json`

## Step 4: Create new file for the modified config

`cp config.json modified_config.json`

## Step 5: Update the changes in the modified config

## Step 6: Encode both the files config.json and modified_config.json

`configtxlator proto_encode --input config.json --type common.Config --output config.pb`

`configtxlator proto_encode --input modified_config.json --type common.Config --output modified_config.pb`

## Step 7: Compute the difference in both the config files and generate the new one

`configtxlator compute_update --channel_id ageofultron --original config.pb --updated modified_config.pb --output config_update.pb`

## Step 8: Decoding config_udpate.pb to see what all updated

`configtxlator proto_decode --input config_update.pb --type common.ConfigUpdate --output config_update.json`

## Step 9: Removing clutter from the json file

`echo '{"payload":{"header":{"channel_header":{"channel_id":"'ageofultron'", "type":2}},"data":{"config_update":'$(cat config_update.json)'}}}' | jq . > config_update_in_envelope.json`

## Step 10: encoding the config updates

`configtxlator proto_encode --input config_update_in_envelope.json --type common.Envelope --output config_update_in_envelope.pb`

## Step 10: As per the current network configuration both the hulk and ironman should sign the config

`peer channel signconfigtx -f config_update_in_envelope.pb`

## Step 11: Publishing this to the network using peer

`peer channel update -f config_update_in_envelope.pb -c ageofultron -o orderer.bx.com:7050 --tls --cafile "${ORDERER_TLS_CA}"`
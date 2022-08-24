# To Start Initial Network 

## Step 1: Generate Crypto Assets
`bash ./scripts/generate-crypto.sh`

## Step 2: Copy the cacerts
`bash ./scripts/copy-cacerts-peers-to-orderer.sh`

## Step 3: Generate Genesis block (System orderer Channel)
`bash ./scripts/create-genesis.sh`

## Step 4: Generate Create Channel Transaction (Application Channel)
`bash ./scripts/create-channel.sh`
#!/bin/bash
export VAULT_TOKEN=$ORIGIN_TOKEN
for key in `vault kv list -address=$ORIGIN_SERVER -format json $ORIGIN_PATH | jq -r '.[]'`; do
    vault kv get -address=$ORIGIN_SERVER -format json $ORIGIN_PATH/$key | jq '.data.data' > /tmp/key.json
    export VAULT_TOKEN=$DESTINATION_TOKEN
    cat /tmp/key.json | vault kv put -address=$DESTINATION_SERVER $DESTINATION_PATH/$key -
    export VAULT_TOKEN=$ORIGIN_TOKEN
done

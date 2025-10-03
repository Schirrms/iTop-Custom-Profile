#!/bin/bash

# Sample taken from itop JSON Page:
# https://www.itophub.io/wiki/page?id=latest:advancedtopics:rest_json
# curl --location -g --request -F 'auth_token=YOURTOKEN' POST 'https://localhost/itop/Develop/webservices/rest.php?version=1.3&json_data={
# "operation": "core/get",
# "class": "Person",
# "key": "SELECT Person WHERE email LIKE '\''%.fr'\''",
# "output_fields": "friendlyname, email"
# }'
# Updated example
# curl -X POST -F 'version=1.3' -F 'auth_token=YOURTOKEN'  https://localhost/itop/webservices/rest.php -F 'json_data=@./my-json-operation.json'

# the idea is to use two system variable for the URL and the TOKEN:
# ITOP_URL
# ITOP_TOKEN

if [ "X$ITOP_URL" = "X" ]
then
    echo "$0 : it seems that the URL of the iTop server is not set in \$ITOP_URL…"
    exit 1
fi

if [ "X$ITOP_TOKEN" = "X" -o $(echo -n $ITOP_TOKEN | wc -c) -lt 100 ]
then
    echo "$0 : it seems that the Application Tokoneof the iTop server is not set or invalid in \$ITOP_TOKEN…"
    exit 1
fi

# QUEST='{ "operation": "core/get", "class": "Organization", "key": "SELECT Organization", "output_fields": "friendlyname, email" }'
QUEST='{ "operation": "core/get", "class": "Organization", "key": "SELECT Organization", "output_fields": "name, id" }'
echo "curl -L -X POST -F 'version=1.4' -F auth_token=ITOP_TOKEN_Value ${ITOP_URL}/webservices/rest.php -F json_data=\"$QUEST\""
ANS=$(curl -L -X POST -F 'version=1.4' -F auth_token=${ITOP_TOKEN} ${ITOP_URL}/webservices/rest.php -F json_data="$QUEST")
# If jq is in the path, we can parse the JSON response
if command -v jq &> /dev/null
then
    echo "$ANS" | jq .
else
    echo "$ANS"
fi

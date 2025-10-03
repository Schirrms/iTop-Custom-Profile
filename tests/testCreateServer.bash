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

# the idea is to use two system variables for the URL and the TOKEN:
# ITOP_URL
# ITOP_TOKEN

if [ "X$ITOP_URL" = "X" ]
then
    echo "$0 : it seems that the URL of the iTop server is not set in \$ITOP_URL…"
    exit 1
fi

if [ "X$ITOP_TOKEN" = "X" -o $(echo -n $ITOP_TOKEN | wc -c) -lt 100 ]
then
    echo "$0 : it seems that the Application Token to use to connect to the iTop server is not set or invalid in \$ITOP_TOKEN…"
    exit 1
fi

# To create a server, we need a name and an Organization. To be able to be reused, the org name
# should be in ITOP_ORG_NAME
if [ "X$ITOP_ORG_NAME" = "X" -o $(echo -n $ITOP_ORG_NAME | wc -c) -lt 2 ]
then
    echo "$0 : it seems that the Org Name to use to create the server in iTop is not set or invalid in \$ITOP_ORG_NAME…"
    exit 1
fi

# creation of a TestServer named 'AAAATestServer-YYYY-MM-DD--HH-MM-SS' to avoid duplicate
ITOP_SERVER_NAME=$(date "+AAAATestServer-%Y-%m-%d--%H-%M-%S")
echo "You are about to create a server '$ITOP_SERVER_NAME' into the organization '$ITOP_ORG_NAME'"
echo "Press <Enter> to continue, <CTRL> + <C> to Abort…"
read answer
FIELDS=' "org_id": "SELECT Organization WHERE name = \"'$ITOP_ORG_NAME'\"", "name": "'$ITOP_SERVER_NAME'"'
QUEST='{ "operation": "core/create", "comment": "Created by : '$(basename $0)'", "class": "Server", "output_fields": "id, name", "fields": { '$FIELDS' } }'
echo "curl -L -X POST -F 'version=1.4' -F auth_token=ITOP_TOKEN_Value ${ITOP_URL}/webservices/rest.php -F json_data=\"$QUEST\""
ANS=$(curl -L -X POST -F 'version=1.4' -F auth_token=${ITOP_TOKEN} ${ITOP_URL}/webservices/rest.php -F json_data="$QUEST")
# If jq is in the path, we can parse the JSON response
if command -v jq &> /dev/null
then
    echo "$ANS" | jq .
else
    echo "$ANS"
fi

#!/bin/bash

# Bash script to connect to the source mongodb database with the mongo cli program.
# Chris Joakim, Microsoft, July 2021

source env.sh

if [ "$1" == 'local' ]
then 
    echo 'connecting to '$MONGODB_LOCAL_URL
    mongo admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS
fi

if [ "$1" == 'azure' ]
then 
    echo 'pending target CosmosDB'
    # echo 'connecting to: '$AZURE_COSMOSDB_MONGODB_CONN_STRING
    # TODO mongo $AZURE_COSMOSDB_MONGODB_CONN_STRING --ssl
fi

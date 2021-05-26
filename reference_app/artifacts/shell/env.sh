#!/bin/bash

# This script defines environment variables used in this migration process;
# it is 'sourced' by other scripts in this repo.
# Chris Joakim, Microsoft, May 2021

export M2C_SHELL_TYPE="bash"
export M2C_ROOT_ARTIFACTS_DIR="/Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts"
export M2C_ROOT_DATA_DIR="/Users/cjoakim/github/azure-m2c-wgm/reference_app/data"

export M2C_ADF_BLOB_LINKED_SERVICE_NAME="MigrationBlobStorage"
export M2C_ADF_BLOB_LINKED_SERVICE_CONN_STR=$AZURE_STORAGE_CONNECTION_STRING
export M2C_ADF_BLOB_LINKED_SERVICE_CREDENTIAL=$AZURE_STORAGE_KEY

# "typeProperties": {
#     "connectionString": "DefaultEndpointsProtocol=https;AccountName=cjoakimstorage;EndpointSuffix=core.windows.net;",
#     "encryptedCredential": "ew0...=="
# }
#                          DefaultEndpointsProtocol=https;AccountName=cjoakimstorage;EndpointSuffix=core.windows.net

export M2C_ADF_COSMOS_LINKED_SERVICE_NAME="MigrationCosmosDB"

# "typeProperties": {
#     "connectionString": "mongodb://cjoakimcosmosmongo:@cjoakimcosmosmongo.documents.azure.com:10255/?ssl=true;replicaSet=globaldb",
#     "database": "dev",
#     "encryptedCredential": "ew0...=="
# }

export M2C_SOURCE_MONGODB_URL="localhost:27017"
export M2C_SOURCE_MONGODB_DBNAME="openflights"
export M2C_SOURCE_MONGODB_SSL="false"  # true or false
export M2C_SOURCE_MONGODB_HOST="localhost"
export M2C_SOURCE_MONGODB_PORT="27017"
export M2C_SOURCE_MONGODB_USER="exporter"
export M2C_SOURCE_MONGODB_PASS="secret"

# In mongo shell of source database:
# >  db.createUser({'user':'exporter','pwd':'secret','roles':['read']})
# Successfully added user: { "user" : "exporter", "roles" : [ "read" ] }

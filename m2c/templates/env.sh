#!/bin/bash

# This script defines environment variables used in this migration process;
# it is 'sourced' by other scripts in this repo.
# Chris Joakim, Microsoft, June 2021

# These next three directory locations currently point to WITHIN this
# GitHub repo for demonstration purposes.  For customer use, these should
# point to a location outside of the repo.
export M2C_APP_DIR=$M2C_REF_APP_DIR
export M2C_APP_ARTIFACTS_DIR=$M2C_REF_APP_DIR"/artifacts"
export M2C_APP_DATA_DIR=$M2C_REF_APP_DIR"/data"

export M2C_SHELL_TYPE="bash"

# the Azure Storage Account used in the Migration process
export M2C_STORAGE_ACCOUNT=$AZURE_M2C_STORAGE_ACCOUNT
export M2C_STORAGE_KEY=$AZURE_M2C_STORAGE_KEY
export M2C_STORAGE_CONNECTION_STRING=$AZURE_M2C_STORAGE_CONNECTION_STRING

# Source Database
export M2C_SOURCE_MONGODB_URL="localhost:27017"
export M2C_SOURCE_MONGODB_SSL="false"  # true or false
export M2C_SOURCE_MONGODB_HOST="localhost"
export M2C_SOURCE_MONGODB_PORT="27017"
export M2C_SOURCE_MONGODB_USER="root"
export M2C_SOURCE_MONGODB_PASS="rootpassword"
# The above localhost:27017 with root/rootpassword point to the
# MongoDB instance running locally in a Docker container; see
# companion repo https://github.com/cjoakim/mongodb-docker

# Alternatively, you can create and use a read-only user for the exports.
# export M2C_SOURCE_MONGODB_USER="exporter"
# export M2C_SOURCE_MONGODB_PASS="secret"
# In mongo shell of source database:
# >  db.createUser({'user':'exporter','pwd':'secret','roles':['read']})
# Successfully added user: { "user" : "exporter", "roles" : [ "read" ] }

# Resource Group for the Migration
export M2C_RG=$AZURE_M2C_RG

export M2C_COSMOS_MONGODB_ACCT=$AZURE_M2C_COSMOS_MONGO_USER
export M2C_COSMOS_MONGODB_USER=$AZURE_M2C_COSMOS_MONGO_USER
export M2C_COSMOS_MONGO_CONN_STRING=$AZURE_M2C_COSMOS_MONGO_CONN_STRING

export M2C_DOCKER_CONTAINER="cjoakim/azure-m2c-wgm-wrangle"

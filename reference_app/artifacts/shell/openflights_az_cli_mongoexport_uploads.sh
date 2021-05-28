#!/bin/bash

# Bash shell script to upload mongoexport blobs to Azure Storage with the az CLI.
#
# Database Name: openflights
# Generated on:  

source env.sh

echo 'acct: '$M2C_STORAGE_ACCOUNT
echo 'key:  '$M2C_STORAGE_KEY


echo 'uploading /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__airlines__source.json to openflights-raw ...'

az storage blob upload \
  --container-name openflights-raw \
  --file /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__airlines__source.json \
  --name  openflights__airlines__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo 'uploading /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__airports__source.json to openflights-raw ...'

az storage blob upload \
  --container-name openflights-raw \
  --file /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__airports__source.json \
  --name  openflights__airports__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo 'uploading /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__countries__source.json to openflights-raw ...'

az storage blob upload \
  --container-name openflights-raw \
  --file /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__countries__source.json \
  --name  openflights__countries__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo 'uploading /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__planes__source.json to openflights-raw ...'

az storage blob upload \
  --container-name openflights-raw \
  --file /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__planes__source.json \
  --name  openflights__planes__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo 'uploading /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__routes__source.json to openflights-raw ...'

az storage blob upload \
  --container-name openflights-raw \
  --file /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__routes__source.json \
  --name  openflights__routes__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY


echo 'done'
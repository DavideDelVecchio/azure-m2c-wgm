#!/bin/bash

# Bash shell script to upload mongoexport blobs to Azure Storage with the az CLI.
#
# Database Name: openflights
# Generated on:  2021-06-04 19:12:27 UTC
# Generated by:  artifact_generator.py gen_az_cli_uploads()
# Template:      blob_uploads_az_cli.txt

source env.sh

# Uncomment as necessary:
# echo 'acct: '$M2C_STORAGE_ACCOUNT
# echo 'key:  '$M2C_STORAGE_KEY


echo '---'
echo 'uploading reference_app/data/mongoexports/openflights/openflights__airlines__source.json to openflights-raw ...'
date 
az storage blob upload \
  --container-name openflights-raw \
  --file reference_app/data/mongoexports/openflights/openflights__airlines__source.json \
  --name  openflights__airlines__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/openflights/openflights__airports__source.json to openflights-raw ...'
date 
az storage blob upload \
  --container-name openflights-raw \
  --file reference_app/data/mongoexports/openflights/openflights__airports__source.json \
  --name  openflights__airports__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/openflights/openflights__countries__source.json to openflights-raw ...'
date 
az storage blob upload \
  --container-name openflights-raw \
  --file reference_app/data/mongoexports/openflights/openflights__countries__source.json \
  --name  openflights__countries__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/openflights/openflights__planes__source.json to openflights-raw ...'
date 
az storage blob upload \
  --container-name openflights-raw \
  --file reference_app/data/mongoexports/openflights/openflights__planes__source.json \
  --name  openflights__planes__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/openflights/openflights__routes__source.json to openflights-raw ...'
date 
az storage blob upload \
  --container-name openflights-raw \
  --file reference_app/data/mongoexports/openflights/openflights__routes__source.json \
  --name  openflights__routes__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY


date

#echo ''
#echo 'listing contents of container: openflights-raw'
#az storage blob list -c openflights-raw \
#  --auth-mode key \
#  --account-name $M2C_STORAGE_ACCOUNT \
#  --account-key $M2C_STORAGE_KEY

echo 'done'
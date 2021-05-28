#!/bin/bash

# Bash shell script to upload mongoexport blobs to Azure Storage with Python3.
#
# Database Name: openflights
# Generated on:  

source env.sh

# Uncomment, as necessary, to delete and recreate the storage container:
# python storage.py delete_blob_container openflights-raw
# sleep 10
# python storage.py create_blob_container openflights-raw
# sleep 10


python storage.py upload_blob /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__airlines__source.json openflights-raw openflights__airlines__source.json

python storage.py upload_blob /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__airports__source.json openflights-raw openflights__airports__source.json

python storage.py upload_blob /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__countries__source.json openflights-raw openflights__countries__source.json

python storage.py upload_blob /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__planes__source.json openflights-raw openflights__planes__source.json

python storage.py upload_blob /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__routes__source.json openflights-raw openflights__routes__source.json


python storage.py list_blob_container openflights-raw

echo 'done'
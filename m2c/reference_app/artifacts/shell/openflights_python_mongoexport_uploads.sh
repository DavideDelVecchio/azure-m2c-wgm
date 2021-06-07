#!/bin/bash

# Bash shell script to upload mongoexport blobs to Azure Storage with Python3.
#
# Database Name: openflights
# Generated on:  2021-06-07 16:48:15 UTC
# Generated by:  artifact_generator.py gen_python_uploads()
# Template:      blob_uploads_python.txt

source env.sh

# Uncomment, as necessary, to delete and recreate the storage container:
# python storage.py delete_blob_container openflights-raw
# sleep 10
# python storage.py create_blob_container openflights-raw
# sleep 10


echo '---'
date
python storage.py upload_blob reference_app/data/mongoexports/openflights/openflights__airlines__source.json openflights-raw openflights__airlines__source.json

echo '---'
date
python storage.py upload_blob reference_app/data/mongoexports/openflights/openflights__airports__source.json openflights-raw openflights__airports__source.json

echo '---'
date
python storage.py upload_blob reference_app/data/mongoexports/openflights/openflights__countries__source.json openflights-raw openflights__countries__source.json

echo '---'
date
python storage.py upload_blob reference_app/data/mongoexports/openflights/openflights__planes__source.json openflights-raw openflights__planes__source.json

echo '---'
date
python storage.py upload_blob reference_app/data/mongoexports/openflights/openflights__routes__source.json openflights-raw openflights__routes__source.json


date

echo ''
echo 'listing contents of container: openflights-raw'
python storage.py list_blob_container openflights-raw

echo 'done'
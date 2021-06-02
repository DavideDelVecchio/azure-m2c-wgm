#!/bin/bash

# Bash shell script to wrangle/transform a raw mongoexport file
#
# Database Name: openflights
# Generated on:  2021-06-02 14:42:20 UTC
# Template:      wrangle.txt

source env.sh

mkdir -p tmp/openflights



# download_blob(cname, blob_name, local_file_path)
python storage.py download_blob openflights-raw openflights__airlines__source.json tmp/openflights/openflights__airlines__source.json $1 $2 $3

#python wrangle.py transform \
#    --db openflights \
#    --in-container openflights-raw \
#    --blobname openflights__airports__source.json \
#    --filename tmp/openflights/openflights__airports__source.json \
#    --outfile  tmp/openflights/openflights__airports__wrangled.json \
#    --out-container openflights-adf

#python storage.py download_blob openflights-adf openflights__airports__wrangled.json tmp/downloaded_blob.json



# download_blob(cname, blob_name, local_file_path)
python storage.py download_blob openflights-raw openflights__airports__source.json tmp/openflights/openflights__airports__source.json $1 $2 $3

#python wrangle.py transform \
#    --db openflights \
#    --in-container openflights-raw \
#    --blobname openflights__airports__source.json \
#    --filename tmp/openflights/openflights__airports__source.json \
#    --outfile  tmp/openflights/openflights__airports__wrangled.json \
#    --out-container openflights-adf

#python storage.py download_blob openflights-adf openflights__airports__wrangled.json tmp/downloaded_blob.json



# download_blob(cname, blob_name, local_file_path)
python storage.py download_blob openflights-raw openflights__countries__source.json tmp/openflights/openflights__countries__source.json $1 $2 $3

#python wrangle.py transform \
#    --db openflights \
#    --in-container openflights-raw \
#    --blobname openflights__airports__source.json \
#    --filename tmp/openflights/openflights__airports__source.json \
#    --outfile  tmp/openflights/openflights__airports__wrangled.json \
#    --out-container openflights-adf

#python storage.py download_blob openflights-adf openflights__airports__wrangled.json tmp/downloaded_blob.json



# download_blob(cname, blob_name, local_file_path)
python storage.py download_blob openflights-raw openflights__planes__source.json tmp/openflights/openflights__planes__source.json $1 $2 $3

#python wrangle.py transform \
#    --db openflights \
#    --in-container openflights-raw \
#    --blobname openflights__airports__source.json \
#    --filename tmp/openflights/openflights__airports__source.json \
#    --outfile  tmp/openflights/openflights__airports__wrangled.json \
#    --out-container openflights-adf

#python storage.py download_blob openflights-adf openflights__airports__wrangled.json tmp/downloaded_blob.json



# download_blob(cname, blob_name, local_file_path)
python storage.py download_blob openflights-raw openflights__routes__source.json tmp/openflights/openflights__routes__source.json $1 $2 $3

#python wrangle.py transform \
#    --db openflights \
#    --in-container openflights-raw \
#    --blobname openflights__airports__source.json \
#    --filename tmp/openflights/openflights__airports__source.json \
#    --outfile  tmp/openflights/openflights__airports__wrangled.json \
#    --out-container openflights-adf

#python storage.py download_blob openflights-adf openflights__airports__wrangled.json tmp/downloaded_blob.json



echo 'done'
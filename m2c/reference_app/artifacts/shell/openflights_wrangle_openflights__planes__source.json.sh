#!/bin/bash

# Bash shell script to wrangle/transform a raw mongoexport file
#
# Database Name: openflights
# Generated on:  2021-06-07 16:18:28 UTC
# Template:      wrangle_one.txt

source ./env.sh

mkdir -p tmp/openflights/out
mkdir -p out/openflights

# This script does the following:
# 1) Downloads blob openflights__planes__source.json from container openflights-raw
#    to local file tmp/openflights/openflights__planes__source.json
# 2) Wrangle/transform the downloaded blob, producing local file 
#    tmp/openflights/openflights__planes__wrangled.json
# 3) Uploads the wrangled file to storage container openflights-adf
# 4) Delete the downloaded and wrangled file, as the host VM may have limited storage
#
# Note: this script is executed by script openflights_wrangle_all.sh

python wrangle.py transform_blob \
    --db openflights \
    --in-container openflights-raw \
    --blobname openflights__planes__source.json \
    --filename tmp/openflights/openflights__planes__source.json \
    --outfile  tmp/openflights/openflights__planes__wrangled.json \
    --out-container openflights-adf $1 $2 $3 

echo ''
echo 'first line of input file:'
head -1 tmp/openflights/openflights__planes__source.json

echo ''
echo 'first line of output file:'
head -1 tmp/openflights/openflights__planes__wrangled.json

# TODO - uncomment the next 3 lines after initial development
# echo 'deleting downloaded and wrangled files'
# rm tmp/openflights/openflights__planes__source.json
# rm tmp/openflights/openflights__planes__wrangled.json

echo 'done' 

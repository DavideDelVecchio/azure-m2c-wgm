#!/bin/bash

# Bash shell script to wrangle/transform a raw mongoexport file
#
# Database Name: openflights
# Generated on:  2021-06-03 22:10:05 UTC
# Template:      wrangle_one.txt

source env.sh

mkdir -p tmp/openflights/out
mkdir -p out/openflights

# This script does the following:
# 1) Downloads blob openflights__routes__source.json from container openflights-raw
#    to local file tmp/openflights/openflights__routes__source.json
# 2) Wrangle/transform the downloaded blob, producing local file 
#    tmp/openflights/openflights__routes__wrangled.json
# 3) Uploads the wrangled file to storage container openflights-adf
# 4) Delete the downloaded and wrangled file, as the host VM may have limited storage
#
# Note: this script is executed by script openflights_wrangle_all.sh

python wrangle.py transform_blob \
    --db openflights \
    --in-container openflights-raw \
    --blobname openflights__routes__source.json \
    --filename tmp/openflights/openflights__routes__source.json \
    --outfile  tmp/openflights/openflights__routes__wrangled.json \
    --out-container openflights-adf  # > out/openflights/wrangle_openflights__routes__source.json.out

echo 'first line of input file:' # > out/openflights/wrangle_openflights__routes__source.json.out
head -1 tmp/openflights/openflights__routes__source.json # > out/openflights/wrangle_openflights__routes__source.json.out

echo 'first line of output file:' # > out/openflights/wrangle_openflights__routes__source.json.out
head -1 tmp/openflights/openflights__routes__wrangled.json # > out/openflights/wrangle_openflights__routes__source.json.out

# echo 'deleting downloaded and wrangled files ...'
# rm tmp/openflights/openflights__routes__source.json
# rm tmp/openflights/openflights__routes__wrangled.json

echo 'done' 

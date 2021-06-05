#!/bin/bash

# Bash shell script to wrangle/transform a raw mongoexport file
#
# Database Name: olympics
# Generated on:  2021-06-05 20:26:27 UTC
# Template:      wrangle_one.txt

source ./env.sh

mkdir -p tmp/olympics/out
mkdir -p out/olympics

# This script does the following:
# 1) Downloads blob olympics__g1980_summer__source.json from container olympics-raw
#    to local file tmp/olympics/olympics__g1980_summer__source.json
# 2) Wrangle/transform the downloaded blob, producing local file 
#    tmp/olympics/olympics__g1980_summer__wrangled.json
# 3) Uploads the wrangled file to storage container olympics-adf
# 4) Delete the downloaded and wrangled file, as the host VM may have limited storage
#
# Note: this script is executed by script olympics_wrangle_all.sh

python wrangle.py transform_blob \
    --db olympics \
    --in-container olympics-raw \
    --blobname olympics__g1980_summer__source.json \
    --filename tmp/olympics/olympics__g1980_summer__source.json \
    --outfile  tmp/olympics/olympics__g1980_summer__wrangled.json \
    --out-container olympics-adf $1 $2 $3 

echo ''
echo 'first line of input file:'
head -1 tmp/olympics/olympics__g1980_summer__source.json

echo ''
echo 'first line of output file:'
head -1 tmp/olympics/olympics__g1980_summer__wrangled.json

# TODO - uncomment the next 3 lines after initial development
# echo 'deleting downloaded and wrangled files'
# rm tmp/olympics/olympics__g1980_summer__source.json
# rm tmp/olympics/olympics__g1980_summer__wrangled.json

echo 'done' 

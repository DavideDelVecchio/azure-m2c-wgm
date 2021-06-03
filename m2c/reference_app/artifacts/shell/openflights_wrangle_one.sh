#!/bin/bash

# Bash shell script to wrangle/transform a raw mongoexport file
#
# Database Name: openflights
# Generated on:  2021-06-03 15:47:29 UTC
# Template:      wrangle.txt

source env.sh

mkdir -p tmp/openflights


python wrangle.py transform_blob \
    --db openflights \
    --in-container openflights-raw \
    --blobname openflights__airlines__source.json \
    --outfile   \
    --out-container openflights-adf

python wrangle.py transform_blob \
    --db openflights \
    --in-container openflights-raw \
    --blobname openflights__airports__source.json \
    --outfile   \
    --out-container openflights-adf

python wrangle.py transform_blob \
    --db openflights \
    --in-container openflights-raw \
    --blobname openflights__countries__source.json \
    --outfile   \
    --out-container openflights-adf

python wrangle.py transform_blob \
    --db openflights \
    --in-container openflights-raw \
    --blobname openflights__planes__source.json \
    --outfile   \
    --out-container openflights-adf

python wrangle.py transform_blob \
    --db openflights \
    --in-container openflights-raw \
    --blobname openflights__routes__source.json \
    --outfile   \
    --out-container openflights-adf


echo 'done'
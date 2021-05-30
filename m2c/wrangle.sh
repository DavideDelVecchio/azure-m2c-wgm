#!/bin/bash

# Bash shell scripts to execute the pytest-based unit, tests with code coverage.
# Chris Joakim, Microsoft, June 2021

source env.sh

mkdir -p tmp/olympics/
mkdir -p tmp/openflights/

rm tmp/openflights/openflights__airports__source*
rm tmp/downloaded_blob.json

python wrangle.py transform \
    --db openflights \
    --in-container openflights-raw \
    --blobname openflights__airports__source.json \
    --filename tmp/openflights/openflights__airports__source.json \
    --outfile  tmp/openflights/openflights__airports__wrangled.json \
    --out-container openflights-adf

# python storage.py list_blob_container openflights-adf

# python storage.py download_blob openflights-adf openflights__airports__wrangled.json tmp/downloaded_blob.json

# python wrangle.py transform \
#     --db openflights \
#     --filename ../reference_app/data/olympics/mongoexports/olympics__2016_summer__source.json \
#     --outfile  tmp/olympics/olympics__2016_summer__source.json \
#     --out-container olympics-adf

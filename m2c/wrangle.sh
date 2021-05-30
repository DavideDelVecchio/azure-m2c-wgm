#!/bin/bash

# Bash shell scripts to execute the pytest-based unit, tests with code coverage.
# Chris Joakim, Microsoft, June 2021

source env.sh

mkdir -p tmp/openflights/
rm tmp/openflights/openflights__airlines__source*

python wrangle.py transform \
    --db openflights \
    --in-container openflights-raw \
    --blobname openflights__airlines__source.json \
    --filename tmp/openflights/openflights__airlines__source.json \
    --outfile  tmp/openflights/openflights__airlines__source_wrangled.json \
    --out-container openflights-raw 

#!/bin/bash

# Bash script to extract the metadata from the source MongoDB database(s)
# as a JSON-file per database.  This data will then be used for subsequent
# script and code generation in this migation process.
# Chris Joakim, Microsoft, May 2021

source env.sh

mkdir -p /Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts/adf
mkdir -p /Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts/shell

# format: 
# python main.py generate_artifacts <dbname> <gen-flags>

python main.py generate_artifacts openflights --all

python main.py generate_artifacts olympics --all

cp env.sh /Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts/shell
chmod 744 /Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts/shell/*.sh 

echo 'done'

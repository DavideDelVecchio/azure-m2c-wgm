#!/bin/bash

# Bash script to extract the metadata from the source MongoDB database(s)
# as a JSON-file per database.  This data will then be used for subsequent
# script and code generation in this migation process.
# Chris Joakim, Microsoft, May 2021

source env.sh

echo 'ensuring target artifact directories exist ...'
mkdir -p /Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts/adf
mkdir -p /Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts/shell

echo 'deleting previous generated artifacts ...'
rm  /Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts/adf/*.*
rm  /Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts/shell/*.*

cp env.sh     templates 
cp storage.py templates 

echo 'generating artifacts ...'
python main.py generate_artifacts openflights --all
python main.py generate_artifacts openflights --create-containers
# python main.py generate_artifacts olympics --all

# 

echo 'making generated scripts executable ...'
cp env.sh /Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts/shell
chmod 744 /Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts/shell/*.sh 


echo 'done'

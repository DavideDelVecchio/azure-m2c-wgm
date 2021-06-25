#!/bin/bash

# Bash script to extract the metadata from the source MongoDB database(s)
# as a JSON-file per database.  This data will then be used for subsequent
# script and code generation in this migation process.
#
# Generated on: 2021-06-25 18:46:48 UTC
# Generated by: artifact_generator.py generate_initial_scripts()
# Template:     extract_metadata.txt

source env.sh

# format: python main.py extract_db_metadata <login-db> <db-name>


python main.py extract_db_metadata admin olympics

python main.py extract_db_metadata admin openflights


echo 'done'
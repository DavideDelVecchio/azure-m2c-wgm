#!/bin/bash

# Bash script to extract the metadata from the source MongoDB database(s)
# as a JSON-file per database.  This data will then be used for subsequent
# script and code generation in this migation process.
# Chris Joakim, Microsoft, June 2021

# format: python main.py extract_db_metadata <login-db> <db-name>

source env.sh

python main.py extract_db_metadata admin olympics

python main.py extract_db_metadata admin openflights

echo 'done'

#!/bin/bash

# Bash script to extract the metadata from the source MongoDB database(s)
# as a JSON-file per database.  This data will then be used for subsequent
# script and code generation in this migation process.
# Chris Joakim, Microsoft, May 2021

# format: python main.py read_db_metadata <db-url> <db-name>

source env.sh

python main.py read_db_metadata $M2C_SOURCE_MONGODB_URL olympics

python main.py read_db_metadata $M2C_SOURCE_MONGODB_URL openflights

echo 'done'

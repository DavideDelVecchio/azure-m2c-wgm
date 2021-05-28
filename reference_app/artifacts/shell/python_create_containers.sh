#!/bin/bash

# Bash shell script to create, the list, the blob containers for this migration.
#
# Generated on:  

source env.sh


python storage.py create_blob_container openflights-raw

python storage.py create_blob_container openflights-adf

python storage.py create_blob_container olympics-raw

python storage.py create_blob_container olympics-adf


python storage.py list_blob_containers

echo 'done'
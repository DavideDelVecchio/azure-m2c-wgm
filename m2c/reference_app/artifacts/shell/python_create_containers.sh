#!/bin/bash

# Bash shell script to create, the list, the blob containers for this migration.
#
# Generated on: 2021-06-07 16:48:15 UTC
# Generated by: artifact_generator.py gen_python_create_containers()
# Template:     create_blob_containers.txt

source env.sh


python storage.py create_blob_container openflights-raw

python storage.py create_blob_container openflights-adf

python storage.py create_blob_container olympics-raw

python storage.py create_blob_container olympics-adf


python storage.py list_blob_containers

echo 'done'
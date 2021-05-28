#!/bin/bash

# Bash script to generate the mapping files from the extracted metadata.
# The mapping file is intended to be edited by the customer, while the
# metadata file is left untouched.
# Chris Joakim, Microsoft, May 2021

# format: python main.py generate_mapping_file <db-name>

source env.sh

python main.py generate_mapping_file olympics

python main.py generate_mapping_file openflights

echo 'done'

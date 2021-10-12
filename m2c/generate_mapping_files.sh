#!/bin/bash

# Bash script to generate the mapping files from the extracted metadata.
# The mapping file is intended to be edited by the customer, while the
# metadata file is left untouched.
#
# Generated on: 2021-10-12 18:37:44 UTC
# Generated by: artifact_generator.py generate_initial_scripts()
# Template:     generate_mapping_files.txt

source env.sh

while true; do
    echo ''
    echo 'This process will overlay the mapping files you may have edited.'
    read -p "Do you wish to proceed - regenerate and overlay? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo ''

# format: python main.py generate_mapping_file <db-name> 

python main.py generate_mapping_file olympics

python main.py generate_mapping_file openflights


echo 'done'
 
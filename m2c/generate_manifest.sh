#!/bin/bash

# Bash script to generate the "manifest" csv/Excel file.
# Chris Joakim, Microsoft, June 2021

source env.sh

echo 'generating manifest ...'

python main.py generate_manifest

echo 'done'

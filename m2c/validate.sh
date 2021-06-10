#!/bin/bash

# Execute the Validation process before ADF execution.
# Chris Joakim, Microsoft, June 2021

source env.sh

python main.py validate --source-databases openflights olympics --presence all

echo 'done'

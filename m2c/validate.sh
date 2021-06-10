#!/bin/bash

# Execute the Validation process before ADF execution.
# Chris Joakim, Microsoft, June 2021

# TODO - this script is not yet implemented, it is a work-in-progress

source env.sh

python main.py validate --source-databases openflights olympics --validations all

echo 'done'

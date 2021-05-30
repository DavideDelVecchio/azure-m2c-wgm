#!/bin/bash

# Copy/Replicate the common scripts in this directory to the other
# directories in this repo.
# Chris Joakim, Microsoft, June 2021

cp env.sh        ../reference_app/artifacts/shell/
cp compose.sh    ../reference_app/artifacts/shell/
cp mongo_cli.sh  ../reference_app/artifacts/shell/
cp requirements* ../reference_app/artifacts/shell/

cp env.sh        ../reference_app/databases/
cp compose.sh    ../reference_app/databases/
cp mongo_cli.sh  ../reference_app/databases/

#!/bin/bash

# Copy/Replicate the common scripts in this directory to the other
# directories in this repo.
# Chris Joakim, Microsoft, June 2021

source env.sh

mkdir -p $M2C_APP_DIR
mkdir -p $M2C_APP_ARTIFACTS_DIR/adf
mkdir -p $M2C_APP_ARTIFACTS_DIR/shell

echo 'copying to '$M2C_APP_ARTIFACTS_DIR'/shell ...'
cp env.sh         $M2C_APP_ARTIFACTS_DIR/shell
cp mongo_cli.sh   $M2C_APP_ARTIFACTS_DIR/shell
cp requirements*  $M2C_APP_ARTIFACTS_DIR/shell
cp storage.py     $M2C_APP_ARTIFACTS_DIR/shell

echo 'done'

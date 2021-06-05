#!/bin/bash

# Bash shell script to wrangle/transform a raw mongoexport file
#
# Database Name: openflights
# Generated on:  2021-06-05 20:26:27 UTC
# Template:      wrangle_all.txt

source ./env.sh

skip_download_flag=""  # set to "--skip-download" to bypass blob downloading


echo 'executing openflights_wrangle_openflights__airlines__source.json.sh ...'
./openflights_wrangle_openflights__airlines__source.json.sh $skip_download_flag

echo 'executing openflights_wrangle_openflights__airports__source.json.sh ...'
./openflights_wrangle_openflights__airports__source.json.sh $skip_download_flag

echo 'executing openflights_wrangle_openflights__countries__source.json.sh ...'
./openflights_wrangle_openflights__countries__source.json.sh $skip_download_flag

echo 'executing openflights_wrangle_openflights__planes__source.json.sh ...'
./openflights_wrangle_openflights__planes__source.json.sh $skip_download_flag

echo 'executing openflights_wrangle_openflights__routes__source.json.sh ...'
./openflights_wrangle_openflights__routes__source.json.sh $skip_download_flag


echo 'done'
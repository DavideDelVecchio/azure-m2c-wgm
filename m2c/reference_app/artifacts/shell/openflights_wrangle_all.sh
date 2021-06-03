#!/bin/bash

# Bash shell script to wrangle/transform a raw mongoexport file
#
# Database Name: openflights
# Generated on:  2021-06-03 13:58:23 UTC
# Template:      wrangle_all.txt

source ../env.sh

skip_download_flag=""  # set to "--skip-download" to bypass blob downloading


echo 'openflights/wrangle_openflights_airlines ...'
./openflights/wrangle_openflights_airlines.sh $skip_download_flag > tmp/openflights/wrangle_openflights_airlines.txt

echo 'openflights/wrangle_openflights_airports ...'
./openflights/wrangle_openflights_airports.sh $skip_download_flag > tmp/openflights/wrangle_openflights_airports.txt

echo 'openflights/wrangle_openflights_countries ...'
./openflights/wrangle_openflights_countries.sh $skip_download_flag > tmp/openflights/wrangle_openflights_countries.txt

echo 'openflights/wrangle_openflights_planes ...'
./openflights/wrangle_openflights_planes.sh $skip_download_flag > tmp/openflights/wrangle_openflights_planes.txt

echo 'openflights/wrangle_openflights_routes ...'
./openflights/wrangle_openflights_routes.sh $skip_download_flag > tmp/openflights/wrangle_openflights_routes.txt


echo 'done'
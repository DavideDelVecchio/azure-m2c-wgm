#!/bin/bash

# Bash shell script to wrangle/transform a raw mongoexport file
#
# Database Name: openflights
# Generated on:  2021-06-01 22:20:23 UTC
# Template:      wrangle_all.txt

source ../env.sh


echo 'openflights/wrangle_openflights_airlines ...'
./openflights/wrangle_openflights_airlines.sh > tmp/openflights/wrangle_openflights_airlines.txt
python wrangle.py cleanup openflights/wrangle_openflights_airlines

echo 'openflights/wrangle_openflights_airports ...'
./openflights/wrangle_openflights_airports.sh > tmp/openflights/wrangle_openflights_airports.txt
python wrangle.py cleanup openflights/wrangle_openflights_airports

echo 'openflights/wrangle_openflights_countries ...'
./openflights/wrangle_openflights_countries.sh > tmp/openflights/wrangle_openflights_countries.txt
python wrangle.py cleanup openflights/wrangle_openflights_countries

echo 'openflights/wrangle_openflights_planes ...'
./openflights/wrangle_openflights_planes.sh > tmp/openflights/wrangle_openflights_planes.txt
python wrangle.py cleanup openflights/wrangle_openflights_planes

echo 'openflights/wrangle_openflights_routes ...'
./openflights/wrangle_openflights_routes.sh > tmp/openflights/wrangle_openflights_routes.txt
python wrangle.py cleanup openflights/wrangle_openflights_routes


echo 'done'
#!/bin/bash

# Bash shell script to export each source collection via mongoexport.
#
# Database Name: openflights
# Generated on:  2021-05-28 14:45:31 UTC

source env.sh

mkdir -p data/source/mongoexports


mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db openflights \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection airlines \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__airlines__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db openflights \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection planes \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__planes__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db openflights \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection routes \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__routes__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db openflights \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection airports \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__airports__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db openflights \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection countries \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__countries__source.json


echo 'done'
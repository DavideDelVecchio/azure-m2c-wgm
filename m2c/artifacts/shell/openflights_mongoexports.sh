#!/bin/bash

# Bash shell script to export each source collection via mongoexport.
#
# Database Name: openflights
# Generated on:  2021-05-23 19:23:10 UTC

source env.sh

mkdir -p data/source/mongoexports


mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db openflights \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection airports \
  --out data/source/mongoexports/openflights__airports__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db openflights \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection routes \
  --out data/source/mongoexports/openflights__routes__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db openflights \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection planes \
  --out data/source/mongoexports/openflights__planes__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db openflights \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection airlines \
  --out data/source/mongoexports/openflights__airlines__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db openflights \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection countries \
  --out data/source/mongoexports/openflights__countries__source.json


echo 'done'
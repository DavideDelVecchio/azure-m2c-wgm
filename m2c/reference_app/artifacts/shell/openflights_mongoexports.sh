#!/bin/bash

# Bash shell script to export each source collection via mongoexport.
#
# Database Name: openflights
# Generated on:  2021-06-01 20:08:51 UTC
# Template:      mongoexport_script.txt

source env.sh

mkdir -p data/source/mongoexports


mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection airlines \
    --out reference_app/data/mongoexports/openflights/openflights__airlines__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection airports \
    --out reference_app/data/mongoexports/openflights/openflights__airports__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection countries \
    --out reference_app/data/mongoexports/openflights/openflights__countries__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection planes \
    --out reference_app/data/mongoexports/openflights/openflights__planes__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection routes \
    --out reference_app/data/mongoexports/openflights/openflights__routes__source.json
     # no --ssl


echo 'done'
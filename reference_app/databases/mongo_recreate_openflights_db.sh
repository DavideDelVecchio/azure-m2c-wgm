#!/bin/bash

# bash script to execute the mongoimport program to load the reference database
# with the sample data provided in this repo.
# Chris Joakim, Microsoft, May 2021
#
# Generated on: 2021-05-29 18:02:43 UTC

source env.sh

echo 'database URL: '$M2C_SOURCE_MONGODB_URL

echo 'init database ...'
mongo -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS $M2C_SOURCE_MONGODB_URL/admin < mongo/openflights_init.ddl


echo 'mongoimport airlines ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection airlines \
    --file openflights/import_json/airlines.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport airports ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection airports \
    --file openflights/import_json/airports.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport countries ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection countries \
    --file openflights/import_json/countries.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport planes ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection planes \
    --file openflights/import_json/planes.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport routes ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection routes \
    --file openflights/import_json/routes.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl


echo 'done'
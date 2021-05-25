#!/bin/bash

# bash script to execute the mongo CLI program to create and load
# the localhost openflights database.  This database is then used
# as a reference database for the migration process in this repo.
# Chris Joakim, Microsoft, May 2021

echo 'init ...'
mongo localhost:27017/openflights < mongo/openflights_init.ddl

echo 'mongoimport airports ...'
mongoimport --db openflights \
    --collection airports \
    --file openflights/import_json/airports.json \
    --numInsertionWorkers 1 \
    --batchSize 24

echo 'mongoimport airlines ...'
mongoimport --db openflights \
    --collection airlines \
    --file openflights/import_json/airlines.json \
    --numInsertionWorkers 1 \
    --batchSize 24

echo 'mongoimport routes ...'
mongoimport --db openflights \
    --collection routes \
    --file openflights/import_json/routes.json \
    --numInsertionWorkers 1 \
    --batchSize 24

echo 'mongoimport planes ...'
mongoimport --db openflights \
    --collection planes \
    --file openflights/import_json/planes.json \
    --numInsertionWorkers 1 \
    --batchSize 24

echo 'mongoimport countries ...'
mongoimport --db openflights \
    --collection countries \
    --file openflights/import_json/countries.json \
    --numInsertionWorkers 1 \
    --batchSize 24

echo 'done'

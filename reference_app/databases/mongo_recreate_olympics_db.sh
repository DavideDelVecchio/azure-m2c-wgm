#!/bin/bash

# bash script to execute the mongoimport program to load the reference database
# with the sample data provided in this repo.
# Chris Joakim, Microsoft, May 2021
#
# Generated on: 2021-05-29 18:02:43 UTC

source env.sh

echo 'database URL: '$M2C_SOURCE_MONGODB_URL

echo 'init database ...'
mongo -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS $M2C_SOURCE_MONGODB_URL/admin < mongo/olympics_init.ddl


echo 'mongoimport 1896_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1896_summer \
    --file olympics/import_json/1896_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1900_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1900_summer \
    --file olympics/import_json/1900_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1904_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1904_summer \
    --file olympics/import_json/1904_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1906_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1906_summer \
    --file olympics/import_json/1906_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1908_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1908_summer \
    --file olympics/import_json/1908_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1912_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1912_summer \
    --file olympics/import_json/1912_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1920_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1920_summer \
    --file olympics/import_json/1920_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1924_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1924_summer \
    --file olympics/import_json/1924_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1924_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1924_winter \
    --file olympics/import_json/1924_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1928_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1928_summer \
    --file olympics/import_json/1928_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1928_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1928_winter \
    --file olympics/import_json/1928_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1932_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1932_summer \
    --file olympics/import_json/1932_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1932_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1932_winter \
    --file olympics/import_json/1932_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1936_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1936_summer \
    --file olympics/import_json/1936_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1936_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1936_winter \
    --file olympics/import_json/1936_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1948_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1948_summer \
    --file olympics/import_json/1948_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1948_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1948_winter \
    --file olympics/import_json/1948_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1952_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1952_summer \
    --file olympics/import_json/1952_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1952_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1952_winter \
    --file olympics/import_json/1952_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1956_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1956_summer \
    --file olympics/import_json/1956_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1956_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1956_winter \
    --file olympics/import_json/1956_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1960_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1960_summer \
    --file olympics/import_json/1960_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1960_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1960_winter \
    --file olympics/import_json/1960_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1964_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1964_summer \
    --file olympics/import_json/1964_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1964_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1964_winter \
    --file olympics/import_json/1964_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1968_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1968_summer \
    --file olympics/import_json/1968_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1968_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1968_winter \
    --file olympics/import_json/1968_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1972_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1972_summer \
    --file olympics/import_json/1972_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1972_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1972_winter \
    --file olympics/import_json/1972_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1976_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1976_summer \
    --file olympics/import_json/1976_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1976_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1976_winter \
    --file olympics/import_json/1976_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1980_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1980_summer \
    --file olympics/import_json/1980_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1980_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1980_winter \
    --file olympics/import_json/1980_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1984_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1984_summer \
    --file olympics/import_json/1984_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1984_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1984_winter \
    --file olympics/import_json/1984_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1988_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1988_summer \
    --file olympics/import_json/1988_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1988_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1988_winter \
    --file olympics/import_json/1988_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1992_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1992_summer \
    --file olympics/import_json/1992_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1992_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1992_winter \
    --file olympics/import_json/1992_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1994_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1994_winter \
    --file olympics/import_json/1994_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1996_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1996_summer \
    --file olympics/import_json/1996_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 1998_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1998_winter \
    --file olympics/import_json/1998_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 2000_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2000_summer \
    --file olympics/import_json/2000_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 2002_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2002_winter \
    --file olympics/import_json/2002_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 2004_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2004_summer \
    --file olympics/import_json/2004_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 2006_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2006_winter \
    --file olympics/import_json/2006_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 2008_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2008_summer \
    --file olympics/import_json/2008_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 2010_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2010_winter \
    --file olympics/import_json/2010_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 2012_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2012_summer \
    --file olympics/import_json/2012_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 2014_winter ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2014_winter \
    --file olympics/import_json/2014_winter.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport 2016_summer ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2016_summer \
    --file olympics/import_json/2016_summer.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport countries ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection countries \
    --file olympics/import_json/countries.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl

echo 'mongoimport games ...'
mongoimport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection games \
    --file olympics/import_json/games.json \
    --numInsertionWorkers 1 \
    --batchSize 24  # no --ssl


echo 'done'
#!/bin/bash

# Bash shell script to export each source collection via mongoexport.
#
# Database Name: olympics
# Generated on:  2021-06-07 16:48:14 UTC
# Template:      mongoexport_script.txt

source env.sh

mkdir -p data/source/mongoexports


echo ''
echo 'mongoexporting - database: olympics container: countries'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection countries \
    --out reference_app/data/mongoexports/olympics/olympics__countries__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1896_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1896_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1896_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1900_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1900_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1900_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1904_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1904_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1904_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1906_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1906_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1906_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1908_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1908_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1908_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1912_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1912_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1912_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1920_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1920_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1920_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1924_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1924_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1924_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1924_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1924_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1924_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1928_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1928_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1928_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1928_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1928_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1928_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1932_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1932_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1932_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1932_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1932_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1932_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1936_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1936_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1936_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1936_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1936_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1936_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1948_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1948_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1948_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1948_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1948_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1948_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1952_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1952_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1952_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1952_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1952_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1952_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1956_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1956_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1956_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1956_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1956_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1956_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1960_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1960_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1960_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1960_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1960_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1960_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1964_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1964_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1964_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1964_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1964_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1964_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1968_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1968_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1968_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1968_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1968_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1968_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1972_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1972_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1972_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1972_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1972_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1972_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1976_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1976_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1976_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1976_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1976_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1976_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1980_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1980_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1980_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1980_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1980_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1980_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1984_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1984_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1984_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1984_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1984_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1984_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1988_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1988_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1988_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1988_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1988_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1988_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1992_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1992_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1992_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1992_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1992_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1992_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1994_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1994_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1994_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1996_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1996_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g1996_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g1998_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1998_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g1998_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g2000_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2000_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g2000_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g2002_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2002_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g2002_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g2004_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2004_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g2004_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g2006_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2006_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g2006_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g2008_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2008_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g2008_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g2010_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2010_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g2010_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g2012_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2012_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g2012_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g2014_winter'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2014_winter \
    --out reference_app/data/mongoexports/olympics/olympics__g2014_winter__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: g2016_summer'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2016_summer \
    --out reference_app/data/mongoexports/olympics/olympics__g2016_summer__source.json
     # no --ssl

echo ''
echo 'mongoexporting - database: olympics container: games'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection games \
    --out reference_app/data/mongoexports/olympics/olympics__games__source.json
     # no --ssl


echo 'done'
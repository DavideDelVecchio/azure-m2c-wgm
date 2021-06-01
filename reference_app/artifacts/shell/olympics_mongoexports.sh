#!/bin/bash

# Bash shell script to export each source collection via mongoexport.
#
# Database Name: olympics
# Generated on:  2021-06-01 18:19:28 UTC
# Template:      mongoexport_script.txt

source env.sh

mkdir -p data/source/mongoexports


mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1896_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1896_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1900_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1900_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1904_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1904_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1906_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1906_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1908_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1908_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1912_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1912_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1920_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1920_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1924_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1924_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1924_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1924_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1928_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1928_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1928_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1928_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1932_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1932_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1932_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1932_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1936_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1936_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1936_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1936_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1948_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1948_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1948_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1948_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1952_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1952_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1952_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1952_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1956_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1956_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1956_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1956_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1960_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1960_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1960_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1960_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1964_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1964_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1964_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1964_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1968_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1968_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1968_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1968_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1972_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1972_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1972_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1972_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1976_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1976_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1976_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1976_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1980_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1980_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1980_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1980_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1984_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1984_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1984_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1984_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1988_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1988_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1988_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1988_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1992_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1992_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1992_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1992_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1994_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1994_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1996_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1996_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 1998_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__1998_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2000_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__2000_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2002_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__2002_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2004_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__2004_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2006_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__2006_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2008_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__2008_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2010_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__2010_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2012_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__2012_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2014_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__2014_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection 2016_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__2016_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection countries \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__countries__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1896_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1896_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1900_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1900_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1904_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1904_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1906_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1906_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1908_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1908_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1912_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1912_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1920_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1920_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1924_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1924_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1924_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1924_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1928_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1928_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1928_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1928_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1932_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1932_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1932_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1932_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1936_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1936_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1936_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1936_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1948_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1948_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1948_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1948_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1952_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1952_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1952_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1952_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1956_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1956_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1956_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1956_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1960_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1960_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1960_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1960_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1964_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1964_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1964_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1964_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1968_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1968_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1968_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1968_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1972_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1972_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1972_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1972_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1976_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1976_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1976_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1976_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1980_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1980_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1980_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1980_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1984_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1984_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1984_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1984_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1988_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1988_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1988_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1988_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1992_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1992_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1992_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1992_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1994_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1994_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1996_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1996_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g1998_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1998_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2000_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2000_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2002_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2002_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2004_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2004_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2006_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2006_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2008_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2008_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2010_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2010_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2012_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2012_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2014_winter \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2014_winter__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection g2016_summer \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2016_summer__source.json
     # no --ssl

mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db olympics \
    --collection games \
    --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__games__source.json
     # no --ssl


echo 'done'
#!/bin/bash

# Bash shell script to export each source collection via mongoexport.
#
# Database Name: olympics
# Generated on:  2021-05-28 18:22:19 UTC

source env.sh

mkdir -p data/source/mongoexports


mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection countries \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__countries__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1896_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1896_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1900_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1900_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1904_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1904_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1906_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1906_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1908_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1908_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1912_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1912_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1920_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1920_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1924_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1924_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1924_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1924_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1928_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1928_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1928_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1928_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1932_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1932_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1932_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1932_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1936_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1936_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1936_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1936_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1948_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1948_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1948_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1948_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1952_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1952_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1952_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1952_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1956_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1956_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1956_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1956_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1960_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1960_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1960_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1960_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1964_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1964_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1964_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1964_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1968_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1968_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1968_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1968_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1972_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1972_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1972_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1972_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1976_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1976_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1976_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1976_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1980_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1980_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1980_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1980_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1984_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1984_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1984_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1984_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1988_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1988_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1988_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1988_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1992_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1992_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1992_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1992_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1994_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1994_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1996_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1996_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g1998_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g1998_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g2000_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2000_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g2002_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2002_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g2004_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2004_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g2006_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2006_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g2008_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2008_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g2010_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2010_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g2012_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2012_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g2014_winter \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2014_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection g2016_summer \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__g2016_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection games \
  --out /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/olympics/mongoexports/olympics__games__source.json


echo 'done'
#!/bin/bash

# Bash shell script to export each source collection via mongoexport.
#
# Database Name: olympics
# Generated on:  2021-05-23 19:23:10 UTC

source env.sh

mkdir -p data/source/mongoexports


mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1936_summer \
  --out data/source/mongoexports/olympics__1936_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1948_winter \
  --out data/source/mongoexports/olympics__1948_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1906_summer \
  --out data/source/mongoexports/olympics__1906_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 2012_summer \
  --out data/source/mongoexports/olympics__2012_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1956_winter \
  --out data/source/mongoexports/olympics__1956_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1980_winter \
  --out data/source/mongoexports/olympics__1980_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1920_summer \
  --out data/source/mongoexports/olympics__1920_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1924_winter \
  --out data/source/mongoexports/olympics__1924_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1956_summer \
  --out data/source/mongoexports/olympics__1956_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1988_summer \
  --out data/source/mongoexports/olympics__1988_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1996_summer \
  --out data/source/mongoexports/olympics__1996_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1984_winter \
  --out data/source/mongoexports/olympics__1984_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1904_summer \
  --out data/source/mongoexports/olympics__1904_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1932_winter \
  --out data/source/mongoexports/olympics__1932_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1984_summer \
  --out data/source/mongoexports/olympics__1984_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 2016_summer \
  --out data/source/mongoexports/olympics__2016_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1960_summer \
  --out data/source/mongoexports/olympics__1960_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1976_summer \
  --out data/source/mongoexports/olympics__1976_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1994_winter \
  --out data/source/mongoexports/olympics__1994_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1952_winter \
  --out data/source/mongoexports/olympics__1952_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1964_summer \
  --out data/source/mongoexports/olympics__1964_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1968_summer \
  --out data/source/mongoexports/olympics__1968_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 2014_winter \
  --out data/source/mongoexports/olympics__2014_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1964_winter \
  --out data/source/mongoexports/olympics__1964_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1972_summer \
  --out data/source/mongoexports/olympics__1972_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1932_summer \
  --out data/source/mongoexports/olympics__1932_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1948_summer \
  --out data/source/mongoexports/olympics__1948_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1900_summer \
  --out data/source/mongoexports/olympics__1900_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1936_winter \
  --out data/source/mongoexports/olympics__1936_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 2000_summer \
  --out data/source/mongoexports/olympics__2000_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 2006_winter \
  --out data/source/mongoexports/olympics__2006_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1960_winter \
  --out data/source/mongoexports/olympics__1960_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1928_summer \
  --out data/source/mongoexports/olympics__1928_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 2008_summer \
  --out data/source/mongoexports/olympics__2008_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1908_summer \
  --out data/source/mongoexports/olympics__1908_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1952_summer \
  --out data/source/mongoexports/olympics__1952_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1968_winter \
  --out data/source/mongoexports/olympics__1968_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1988_winter \
  --out data/source/mongoexports/olympics__1988_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 2010_winter \
  --out data/source/mongoexports/olympics__2010_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 2004_summer \
  --out data/source/mongoexports/olympics__2004_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1976_winter \
  --out data/source/mongoexports/olympics__1976_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1928_winter \
  --out data/source/mongoexports/olympics__1928_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1998_winter \
  --out data/source/mongoexports/olympics__1998_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1912_summer \
  --out data/source/mongoexports/olympics__1912_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection games \
  --out data/source/mongoexports/olympics__games__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1924_summer \
  --out data/source/mongoexports/olympics__1924_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1992_summer \
  --out data/source/mongoexports/olympics__1992_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1980_summer \
  --out data/source/mongoexports/olympics__1980_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1972_winter \
  --out data/source/mongoexports/olympics__1972_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1896_summer \
  --out data/source/mongoexports/olympics__1896_summer__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 1992_winter \
  --out data/source/mongoexports/olympics__1992_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection 2002_winter \
  --out data/source/mongoexports/olympics__2002_winter__source.json

mongoexport \
  --host $M2C_SOURCE_MONGODB_HOST \
  --port $M2C_SOURCE_MONGODB_PORT \
  --db olympics \
  --username $M2C_SOURCE_MONGODB_USER \
  --password $M2C_SOURCE_MONGODB_PASS \
  --collection countries \
  --out data/source/mongoexports/olympics__countries__source.json


echo 'done'
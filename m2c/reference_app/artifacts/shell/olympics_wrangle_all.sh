#!/bin/bash

# Bash shell script to wrangle/transform a raw mongoexport file
#
# Database Name: olympics
# Generated on:  2021-06-03 19:45:02 UTC
# Template:      wrangle_all.txt

source ../env.sh

skip_download_flag=""  # set to "--skip-download" to bypass blob downloading


echo 'olympics/wrangle_olympics_countries ...'
./olympics/wrangle_olympics_countries.sh $skip_download_flag > tmp/olympics/wrangle_olympics_countries.txt

echo 'olympics/wrangle_olympics_g1896_summer ...'
./olympics/wrangle_olympics_g1896_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1896_summer.txt

echo 'olympics/wrangle_olympics_g1900_summer ...'
./olympics/wrangle_olympics_g1900_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1900_summer.txt

echo 'olympics/wrangle_olympics_g1904_summer ...'
./olympics/wrangle_olympics_g1904_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1904_summer.txt

echo 'olympics/wrangle_olympics_g1906_summer ...'
./olympics/wrangle_olympics_g1906_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1906_summer.txt

echo 'olympics/wrangle_olympics_g1908_summer ...'
./olympics/wrangle_olympics_g1908_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1908_summer.txt

echo 'olympics/wrangle_olympics_g1912_summer ...'
./olympics/wrangle_olympics_g1912_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1912_summer.txt

echo 'olympics/wrangle_olympics_g1920_summer ...'
./olympics/wrangle_olympics_g1920_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1920_summer.txt

echo 'olympics/wrangle_olympics_g1924_summer ...'
./olympics/wrangle_olympics_g1924_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1924_summer.txt

echo 'olympics/wrangle_olympics_g1924_winter ...'
./olympics/wrangle_olympics_g1924_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1924_winter.txt

echo 'olympics/wrangle_olympics_g1928_summer ...'
./olympics/wrangle_olympics_g1928_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1928_summer.txt

echo 'olympics/wrangle_olympics_g1928_winter ...'
./olympics/wrangle_olympics_g1928_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1928_winter.txt

echo 'olympics/wrangle_olympics_g1932_summer ...'
./olympics/wrangle_olympics_g1932_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1932_summer.txt

echo 'olympics/wrangle_olympics_g1932_winter ...'
./olympics/wrangle_olympics_g1932_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1932_winter.txt

echo 'olympics/wrangle_olympics_g1936_summer ...'
./olympics/wrangle_olympics_g1936_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1936_summer.txt

echo 'olympics/wrangle_olympics_g1936_winter ...'
./olympics/wrangle_olympics_g1936_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1936_winter.txt

echo 'olympics/wrangle_olympics_g1948_summer ...'
./olympics/wrangle_olympics_g1948_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1948_summer.txt

echo 'olympics/wrangle_olympics_g1948_winter ...'
./olympics/wrangle_olympics_g1948_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1948_winter.txt

echo 'olympics/wrangle_olympics_g1952_summer ...'
./olympics/wrangle_olympics_g1952_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1952_summer.txt

echo 'olympics/wrangle_olympics_g1952_winter ...'
./olympics/wrangle_olympics_g1952_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1952_winter.txt

echo 'olympics/wrangle_olympics_g1956_summer ...'
./olympics/wrangle_olympics_g1956_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1956_summer.txt

echo 'olympics/wrangle_olympics_g1956_winter ...'
./olympics/wrangle_olympics_g1956_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1956_winter.txt

echo 'olympics/wrangle_olympics_g1960_summer ...'
./olympics/wrangle_olympics_g1960_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1960_summer.txt

echo 'olympics/wrangle_olympics_g1960_winter ...'
./olympics/wrangle_olympics_g1960_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1960_winter.txt

echo 'olympics/wrangle_olympics_g1964_summer ...'
./olympics/wrangle_olympics_g1964_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1964_summer.txt

echo 'olympics/wrangle_olympics_g1964_winter ...'
./olympics/wrangle_olympics_g1964_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1964_winter.txt

echo 'olympics/wrangle_olympics_g1968_summer ...'
./olympics/wrangle_olympics_g1968_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1968_summer.txt

echo 'olympics/wrangle_olympics_g1968_winter ...'
./olympics/wrangle_olympics_g1968_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1968_winter.txt

echo 'olympics/wrangle_olympics_g1972_summer ...'
./olympics/wrangle_olympics_g1972_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1972_summer.txt

echo 'olympics/wrangle_olympics_g1972_winter ...'
./olympics/wrangle_olympics_g1972_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1972_winter.txt

echo 'olympics/wrangle_olympics_g1976_summer ...'
./olympics/wrangle_olympics_g1976_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1976_summer.txt

echo 'olympics/wrangle_olympics_g1976_winter ...'
./olympics/wrangle_olympics_g1976_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1976_winter.txt

echo 'olympics/wrangle_olympics_g1980_summer ...'
./olympics/wrangle_olympics_g1980_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1980_summer.txt

echo 'olympics/wrangle_olympics_g1980_winter ...'
./olympics/wrangle_olympics_g1980_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1980_winter.txt

echo 'olympics/wrangle_olympics_g1984_summer ...'
./olympics/wrangle_olympics_g1984_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1984_summer.txt

echo 'olympics/wrangle_olympics_g1984_winter ...'
./olympics/wrangle_olympics_g1984_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1984_winter.txt

echo 'olympics/wrangle_olympics_g1988_summer ...'
./olympics/wrangle_olympics_g1988_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1988_summer.txt

echo 'olympics/wrangle_olympics_g1988_winter ...'
./olympics/wrangle_olympics_g1988_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1988_winter.txt

echo 'olympics/wrangle_olympics_g1992_summer ...'
./olympics/wrangle_olympics_g1992_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1992_summer.txt

echo 'olympics/wrangle_olympics_g1992_winter ...'
./olympics/wrangle_olympics_g1992_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1992_winter.txt

echo 'olympics/wrangle_olympics_g1994_winter ...'
./olympics/wrangle_olympics_g1994_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1994_winter.txt

echo 'olympics/wrangle_olympics_g1996_summer ...'
./olympics/wrangle_olympics_g1996_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1996_summer.txt

echo 'olympics/wrangle_olympics_g1998_winter ...'
./olympics/wrangle_olympics_g1998_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g1998_winter.txt

echo 'olympics/wrangle_olympics_g2000_summer ...'
./olympics/wrangle_olympics_g2000_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g2000_summer.txt

echo 'olympics/wrangle_olympics_g2002_winter ...'
./olympics/wrangle_olympics_g2002_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g2002_winter.txt

echo 'olympics/wrangle_olympics_g2004_summer ...'
./olympics/wrangle_olympics_g2004_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g2004_summer.txt

echo 'olympics/wrangle_olympics_g2006_winter ...'
./olympics/wrangle_olympics_g2006_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g2006_winter.txt

echo 'olympics/wrangle_olympics_g2008_summer ...'
./olympics/wrangle_olympics_g2008_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g2008_summer.txt

echo 'olympics/wrangle_olympics_g2010_winter ...'
./olympics/wrangle_olympics_g2010_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g2010_winter.txt

echo 'olympics/wrangle_olympics_g2012_summer ...'
./olympics/wrangle_olympics_g2012_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g2012_summer.txt

echo 'olympics/wrangle_olympics_g2014_winter ...'
./olympics/wrangle_olympics_g2014_winter.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g2014_winter.txt

echo 'olympics/wrangle_olympics_g2016_summer ...'
./olympics/wrangle_olympics_g2016_summer.sh $skip_download_flag > tmp/olympics/wrangle_olympics_g2016_summer.txt

echo 'olympics/wrangle_olympics_games ...'
./olympics/wrangle_olympics_games.sh $skip_download_flag > tmp/olympics/wrangle_olympics_games.txt


echo 'done'
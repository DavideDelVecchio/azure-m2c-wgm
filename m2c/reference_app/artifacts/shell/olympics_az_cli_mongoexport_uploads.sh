#!/bin/bash

# Bash shell script to upload mongoexport blobs to Azure Storage with the az CLI.
#
# Database Name: olympics
# Generated on:  2021-06-06 19:56:52 UTC
# Generated by:  artifact_generator.py gen_az_cli_uploads()
# Template:      blob_uploads_az_cli.txt

source env.sh

# Uncomment as necessary:
# echo 'acct: '$M2C_STORAGE_ACCOUNT
# echo 'key:  '$M2C_STORAGE_KEY


echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__countries__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__countries__source.json \
  --name  olympics__countries__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1896_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1896_summer__source.json \
  --name  olympics__g1896_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1900_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1900_summer__source.json \
  --name  olympics__g1900_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1904_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1904_summer__source.json \
  --name  olympics__g1904_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1906_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1906_summer__source.json \
  --name  olympics__g1906_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1908_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1908_summer__source.json \
  --name  olympics__g1908_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1912_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1912_summer__source.json \
  --name  olympics__g1912_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1920_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1920_summer__source.json \
  --name  olympics__g1920_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1924_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1924_summer__source.json \
  --name  olympics__g1924_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1924_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1924_winter__source.json \
  --name  olympics__g1924_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1928_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1928_summer__source.json \
  --name  olympics__g1928_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1928_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1928_winter__source.json \
  --name  olympics__g1928_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1932_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1932_summer__source.json \
  --name  olympics__g1932_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1932_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1932_winter__source.json \
  --name  olympics__g1932_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1936_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1936_summer__source.json \
  --name  olympics__g1936_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1936_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1936_winter__source.json \
  --name  olympics__g1936_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1948_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1948_summer__source.json \
  --name  olympics__g1948_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1948_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1948_winter__source.json \
  --name  olympics__g1948_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1952_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1952_summer__source.json \
  --name  olympics__g1952_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1952_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1952_winter__source.json \
  --name  olympics__g1952_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1956_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1956_summer__source.json \
  --name  olympics__g1956_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1956_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1956_winter__source.json \
  --name  olympics__g1956_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1960_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1960_summer__source.json \
  --name  olympics__g1960_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1960_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1960_winter__source.json \
  --name  olympics__g1960_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1964_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1964_summer__source.json \
  --name  olympics__g1964_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1964_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1964_winter__source.json \
  --name  olympics__g1964_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1968_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1968_summer__source.json \
  --name  olympics__g1968_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1968_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1968_winter__source.json \
  --name  olympics__g1968_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1972_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1972_summer__source.json \
  --name  olympics__g1972_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1972_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1972_winter__source.json \
  --name  olympics__g1972_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1976_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1976_summer__source.json \
  --name  olympics__g1976_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1976_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1976_winter__source.json \
  --name  olympics__g1976_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1980_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1980_summer__source.json \
  --name  olympics__g1980_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1980_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1980_winter__source.json \
  --name  olympics__g1980_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1984_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1984_summer__source.json \
  --name  olympics__g1984_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1984_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1984_winter__source.json \
  --name  olympics__g1984_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1988_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1988_summer__source.json \
  --name  olympics__g1988_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1988_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1988_winter__source.json \
  --name  olympics__g1988_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1992_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1992_summer__source.json \
  --name  olympics__g1992_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1992_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1992_winter__source.json \
  --name  olympics__g1992_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1994_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1994_winter__source.json \
  --name  olympics__g1994_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1996_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1996_summer__source.json \
  --name  olympics__g1996_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g1998_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g1998_winter__source.json \
  --name  olympics__g1998_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g2000_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g2000_summer__source.json \
  --name  olympics__g2000_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g2002_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g2002_winter__source.json \
  --name  olympics__g2002_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g2004_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g2004_summer__source.json \
  --name  olympics__g2004_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g2006_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g2006_winter__source.json \
  --name  olympics__g2006_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g2008_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g2008_summer__source.json \
  --name  olympics__g2008_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g2010_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g2010_winter__source.json \
  --name  olympics__g2010_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g2012_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g2012_summer__source.json \
  --name  olympics__g2012_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g2014_winter__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g2014_winter__source.json \
  --name  olympics__g2014_winter__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__g2016_summer__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__g2016_summer__source.json \
  --name  olympics__g2016_summer__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY

echo '---'
echo 'uploading reference_app/data/mongoexports/olympics/olympics__games__source.json to olympics-raw ...'
date 
az storage blob upload \
  --container-name olympics-raw \
  --file reference_app/data/mongoexports/olympics/olympics__games__source.json \
  --name  olympics__games__source.json \
  --account-name $M2C_STORAGE_ACCOUNT \
  --account-key $M2C_STORAGE_KEY


date

#echo ''
#echo 'listing contents of container: olympics-raw'
#az storage blob list -c olympics-raw \
#  --auth-mode key \
#  --account-name $M2C_STORAGE_ACCOUNT \
#  --account-key $M2C_STORAGE_KEY

echo 'done'
#!/bin/bash

# Bash script to generate file/shell/code artifacts from the
# extracted source database metadata and customed-edited mapping files.
#
# Generated on: 2021-07-30 14:55:47 UTC
# Generated by: artifact_generator.py generate_initial_scripts()
# Template:     generate_artifacts.txt

source env.sh

while true; do
    echo ''
    echo 'This process will delete all previously generated artifacts, then recreate them.'
    read -p "Do you wish to proceed - delete and regenerate? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo 'ensuring target artifact directories exist ...'
mkdir -p $M2C_APP_ARTIFACTS_DIR/adf
mkdir -p $M2C_APP_ARTIFACTS_DIR/shell
mkdir -p $M2C_APP_ARTIFACTS_DIR/shell/dotnet_mongo_loader

echo 'deleting previous generated artifacts ...'
rm  $M2C_APP_ARTIFACTS_DIR/adf/*.*
rm  $M2C_APP_ARTIFACTS_DIR/shell/*.*

echo 'copying core files to templates ...'
cp env.sh           templates 
cp storage.py       templates 
cp requirements.in  templates 
cp requirements.txt templates 

echo 'copying dotnet_mongo_loader files ...'
cp dotnet_mongo_loader/*.* $M2C_APP_ARTIFACTS_DIR/shell/dotnet_mongo_loader

# echo 'listing templates ...'
# ls -al templates

echo 'generating artifacts ...'

python main.py generate_artifacts olympics --all

python main.py generate_artifacts openflights --all


# Not needed for customer migrations
# python main.py generate_reference_db_scripts

echo 'replicating scripts'
./replicate_scripts.sh

echo 'making generated scripts executable ...'
cp env.sh $M2C_APP_ARTIFACTS_DIR/shell
chmod 744 $M2C_APP_ARTIFACTS_DIR/shell/*.sh 

echo 'done'
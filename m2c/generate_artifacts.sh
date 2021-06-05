#!/bin/bash

# Bash script to generate file/shell/code artifacts from the
# extracted source database metadata and customed-edited mapping files.
# Chris Joakim, Microsoft, June 2021

# Generated on: 2021-06-05 20:36:11 UTC
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

echo 'deleting previous generated artifacts ...'
rm  $M2C_APP_ARTIFACTS_DIR/adf/*.*
rm  $M2C_APP_ARTIFACTS_DIR/shell/*.*


cp env.sh     templates 
cp storage.py templates 

echo 'generating artifacts ...'

python main.py generate_artifacts olympics --all

python main.py generate_artifacts openflights --all


echo 'replicating scripts'
./replicate_scripts.sh

echo 'making generated scripts executable ...'
cp env.sh $M2C_APP_ARTIFACTS_DIR/shell
chmod 744 $M2C_APP_ARTIFACTS_DIR/shell/*.sh 

echo 'done'
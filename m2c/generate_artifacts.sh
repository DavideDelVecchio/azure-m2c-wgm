#!/bin/bash

# Bash script to generate file/shell/code artifacts from the
# extracted source database metadata and customed-edited mapping files.
# Chris Joakim, Microsoft, June 2021

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
python main.py generate_artifacts openflights --all
python main.py generate_artifacts olympics --all

echo 'making generated scripts executable ...'
cp env.sh reference_app/artifacts/shell
chmod 744 reference_app/artifacts/shell/*.sh 

echo 'done'

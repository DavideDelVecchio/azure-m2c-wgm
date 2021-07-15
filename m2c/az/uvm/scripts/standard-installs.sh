#!/bin/bash

# Bash script to install python3 and jq on an Ubuntu VM.
# Chris Joakim, Microsoft, July 2021

echo '=== apt install python3-pip'
sudo apt update
sudo apt install python3-pip --assume-yes
pip3 --version
pip3 --help

echo '=== apt install python3-venv'
sudo apt update
sudo apt-get install python3-dev python3-venv --assume-yes
sudo apt-get install libpq-dev 
sudo apt-get install unixodbc-dev --assume-yes

echo '=== apt install jq'
sudo apt update
sudo apt install jq --assume-yes
jq --version

# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
# https://www.liquidweb.com/kb/how-to-install-mongodb-on-ubuntu-18-04/

echo '=== install mongodb community edition'
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
cat /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
which mongo
mongo --version
which mongoimport
mongoimport --version


echo ''
echo 'todo - run sudo ./pyenv_install_part1.sh'
echo 'todo - run ./pyenv_install_part2.sh'
echo 'todo - restart shell and run: pyenv install 3.8.6'
echo 'done'

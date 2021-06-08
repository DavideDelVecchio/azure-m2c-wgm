#!/bin/bash

# Bash script to install python3 and jq on an Ubuntu VM.
# Chris Joakim, Microsoft, June 2021

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

echo ''
echo 'todo - run sudo ./pyenv_install_part1.sh'
echo 'todo - run ./pyenv_install_part2.sh'
echo 'todo - restart shell and run: pyenv install 3.8.6'
echo 'done'

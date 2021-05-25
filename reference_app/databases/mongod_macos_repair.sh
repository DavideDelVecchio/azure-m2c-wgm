#!/bin/bash

# Bash script to repair a stopped mongod installation after it crashes.
# Chris Joakim, Microsoft, May 2021

echo 'repairing ...'
mongod --config /usr/local/etc/mongod.conf --repair

echo 'displaying log ...'
cat /usr/local/var/log/mongodb/mongo.log

# Reinstall:
# $ alias | grep mongod
# $ alias mongod_start='mongod --config /usr/local/etc/mongod.conf &'
#   path:   /usr/local/var/log/mongodb/mongo.log
#   dbPath: /usr/local/var/mongodb
# $ brew uninstall mongodb-community@4.0
# $ brew cleanup
# $ rm -rf /usr/local/var/log/mongodb/ 
# $ rm -rf /usr/local/var/mongodb 
#
# $ brew tap mongodb/brew
# $ brew install mongodb-community@4.4
# ... exit shell, start a new one
#
# $ $ mongo --version
# MongoDB shell version v4.4.5

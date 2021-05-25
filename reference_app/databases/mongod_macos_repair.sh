#!/bin/bash

# Bash script to repair a stopped mongod installation after it crashes.
# Chris Joakim, Microsoft, May 2021

echo 'repairing ...'
mongod --config /usr/local/etc/mongod.conf --repair

echo 'displaying log ...'
cat /usr/local/var/log/mongodb/mongo.log

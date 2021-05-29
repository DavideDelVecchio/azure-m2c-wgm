#!/bin/bash

# Bash script to connect to the source mongodb database with the mongo cli program.
# Chris Joakim, Microsoft, May 2021

source env.sh

mongo admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS

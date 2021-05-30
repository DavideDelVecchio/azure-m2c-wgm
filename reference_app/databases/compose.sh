#!/bin/bash

# Execute 'docker-compose xxx', where the value of xxx is provided by
# the first command-line arg, or $1.  This script mostly exits for 
# documentation, and as a shortcut for docker-compose.
#
# Usage:
# $ ./compose.sh up
# $ ./compose.sh ps
# $ ./compose.sh down
#
# Chris Joakim, Microsoft, June 2021

source env.sh

docker-compose $1

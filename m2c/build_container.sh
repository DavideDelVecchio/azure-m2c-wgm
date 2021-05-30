#!/bin/bash

# Build the mongoexport file wrangler Docker container.
# Chris Joakim, Microsoft, June 2021

source env.sh

docker build -t $M2C_DOCKER_CONTAINER .

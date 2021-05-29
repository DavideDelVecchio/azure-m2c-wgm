#!/bin/bash

source bin/activate
source env.sh

# echo 'checking the source code with flake8 ...'
# flake8 cjcc --ignore F401

echo 'executing unit tests with code coverage ...'
pytest -v --cov=pysrc/ --cov-report html tests/

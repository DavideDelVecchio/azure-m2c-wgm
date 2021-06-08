#!/usr/bin/env bash

# see https://www.liquidweb.com/kb/how-to-install-pyenv-on-ubuntu-18-04/
# Chris Joakim, Microsoft, June 2021

apt update -y

apt install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
    libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl

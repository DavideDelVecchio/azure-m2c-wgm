FROM    python:3.8-slim-buster
COPY    . /app
WORKDIR /app
RUN     pip install --upgrade pip
RUN     pip install pip-tools
RUN     pip-compile
RUN     pip install -r requirements.txt
CMD     python ./wrangle.py

# docker build -t cjoakim/azure-m2c-wgm-wrangle .

# 03 - Development Computer Setup

A Developer laptop can be used to execute much of the migration process, including:

- Source Database Metadata Extraction
- Artifact Generation
- Azure Data Factory - use in Azure Portal, and Pipeline execution

However, a **Azure VMs** are recommended for most of the actual migration execution;
see [16 - Execute Migration](16_execute_migration.md).

## Software Requirements

The following software is required on your Developer Laptop computer,
as well as on the Azure Virtual Machines used for your migrations.

- **git** source control program.  See https://git-scm.com 
- **bash** shell.  Available on Linux, macOS, or Windows 10 with WSL.
- **python3**.  See https://www.python.org.  The project was developed and tested with python 3.8.6.
- **mongo client** - from MongoDB Community Edition
- **Azure CLI (az)** - See https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

**Standard Python** is recommended; **Anaconda** is not.

The following software is also strongly recommended:
- **A mongo UI client** - [Studio 3T](https://studio3t.com), etc.
- **Azure Storage Explorer** - See https://azure.microsoft.com/en-us/features/storage-explorer/
- **A Text Edior** - such as [Visual Studio Code](https://code.visualstudio.com)

## Fork or Clone this repository

Next, create **your own copy** of this repository.  There are at least two ways do
do this.  First, in GitHub, you can simply **fork** this repository.

Alternatively, choose an appropriate directory on your laptop to clone this repository to,
as follows:

```
$ git clone git@github.com:cjoakim/azure-m2c-wgm.git
$ cd azure-m2c-wgm
$ rm -rf .git/
```

Note how we execute **rm -rf .git/** to disconnect the repo from the original GitHub
cjoakim/azure-m2c-wgm.  Copy these files and add the **azure-m2c-wgm** to **YOUR repository**.

You'll be spending a lot of time in the **m2c directory** (for Mongo-to-Cosmos) within
the repo root directory, including creating a python virtual environment as described next.

## Python Virtual Environment

Though Python is a cross-platform language and runtime, there are many ways to
use and configure it.  A Python **Virtual Environment** is a sandboxed set of libraries
defined with a **requirements.txt** file, and there are multiple ways to create 
python virtual environments - venv, pyenv, etc.

For the development of this project, the [pyenv](https://github.com/pyenv/pyenv) program
is used.  You'll see several **pyenv.sh** scripts in this repo.

However, on your computer, simply create python virtual environment with your tool-of-choice,
and install the **requirements.txt** file(s) found in this repo, such as in the **m2c/** directory.

## Environment Variables

This project uses environment variables extensively.  Configuring a system using environment 
variable is generally a best-practice in IT, and is one of the tenets of 
[The Twelve Factor App](https://12factor.net).  Environment Variables are also extensively
used in Azure - such as in App Service, Azure Container Instances, and Azure Kubernetes Service.

Environment Variables are used for general configuration values, as well as for **secrets**
such as database connection strings.

A critical file in this project is **env.sh**, shown below.  This file is **sourced** by
the other scripts in this repo so as to **export** environment variables to those scripts.

**You'll need to edit the env.sh file (shown below) for your particular configuration**. 

**All of the environment variables in env.sh are critical, so please take some time to understand this file.**

```
#!/bin/bash

# This script defines environment variables used in this migration process;
# it is 'sourced' by other scripts in this repo.
# Chris Joakim, Microsoft, June 2021

# These next three directory locations currently point to where the 
# generated artifacts and data are written to; they should be external
# to this GitHub repo.
export M2C_APP_DIR=$M2C_REF_APP_DIR
export M2C_APP_ARTIFACTS_DIR=$M2C_REF_APP_DIR"/artifacts"
export M2C_APP_DATA_DIR=$M2C_REF_APP_DIR"/data"

# The generated script type; Windows PowerShell will be added in the future.
export M2C_SHELL_TYPE="bash"

# The Azure Storage Account used in the Migration process
export M2C_STORAGE_ACCOUNT=$AZURE_M2C_STORAGE_ACCOUNT
export M2C_STORAGE_KEY=$AZURE_M2C_STORAGE_KEY
export M2C_STORAGE_CONNECTION_STRING=$AZURE_M2C_STORAGE_CONNECTION_STRING

# The Source Database
export M2C_SOURCE_MONGODB_URL="localhost:27017"
export M2C_SOURCE_MONGODB_SSL="false"
export M2C_SOURCE_MONGODB_HOST="localhost"
export M2C_SOURCE_MONGODB_PORT="27017"
export M2C_SOURCE_MONGODB_USER="root"
export M2C_SOURCE_MONGODB_PASS="rootpassword"
# The above localhost:27017 with root/rootpassword point to the MongoDB
# instance running locally in a Docker container, with the reference databases.
# See companion repo https://github.com/cjoakim/mongodb-docker

# Resource Group and Azure Data Factory for the Migration
export M2C_RG=$AZURE_M2C_RG
export M2C_ADF_NAME=$AZURE_M2C_ADF_NAME

# Target CosmosDB/Mongo account
export M2C_COSMOS_MONGODB_ACCT=$AZURE_M2C_COSMOS_MONGO_USER
export M2C_COSMOS_MONGODB_USER=$AZURE_M2C_COSMOS_MONGO_USER
export M2C_COSMOS_MONGO_CONN_STRING=$AZURE_M2C_COSMOS_MONGO_CONN_STRING
```

All of the environment variables used by this project begin with **M2C_**, and it
is **required** that you set each of these with **YOUR** particular values.

Note how, for example, on my system I set the value of the M2C_ variables
with **other environment variables defined in my system**, such as 
AZURE_M2C_STORAGE_CONNECTION_STRING.

# azure-m2c-wgm

<p align="center"><img src="doc/architecture.png" width="99%"></p>

---

## This repo contains:

- The metadata-driven migration process
- A reference implementation of it, including reference databases

### Directory map of this repo:

```
├── doc
├── m2c                            <--- implementation of the migration process
│   └── templates                  <--- python Jinja2 text templates for artifacts
└── reference_app                  
    ├── artifacts                  <--- generated artifacts
    │   ├── adf                    <--- generated Azure Data Factory artifacts
    │   └── shell                  <--- generated shell scripts
    ├── data
    │   ├── metadata               <--- extracted metadata from the source 
```

---

## Implementation

The implementation of this process primarily uses **Python3**, the **mongoexport program**,
and the **Azure PaaS services** shown in the above diagram.  

The current implementation uses and generates **bash** scripts for linux and macOS
environments.  Windows **powershell** will be added in the near future.

The **mongoexport** utility, and **file format**, is a core compoment of the migration process.
**Azure Data Factory** understands this file format.

The essence of the process is to **extract source database metadata** as JSON, then
generate the many code, script, and file artifacts from this metadata.  This includes:

- Mongoexport scripts
- Blob Upload scripts
- Azure Container Instance execution scripts (optional)
- Azure Data Factory (ADF) code artifacts - Linked Services, Datasets, Pipelines
- Target Database initialization scripts (create containers, indexes)

The mongoexport files exported from the source database are typically **wrangled**
before being loaded into the target CosmosDB database, via ADF, from blob storage.
The wrangling process can add a **partition key** attribute, sometimes a **doctype**
attribute, as well as other document modifications.

In some cases the data wrangling can use logic built into the standard python program.
But in other cases that program will need ad-hoc modification per the needs of
the customer and their data.

The data wrangling process can be executed in one of several places:
- On-Prem Datacenter
- In Azure Container Instances, as shown in the above diagram
- Elsewhere in Azure, such as on a VM

The output of the wrangling process is blob files in Azure Storage, in mongoexport/mongoimport
format, and suitable for loading into the target CosmosDB database using ADF.

The generated ADF artifacts can be added to the **git repo associated to your ADF**.
Once these ADF Linked Services, Datasets, and Pipelines have been loaded into
your ADF instance, the pipelines can be executed to load the various containers
in your target CosmosDB account.

### Oplog

A future version of this migration process will leverage the mongodb **oplog**
in addition to the mongoexport utility program.

---

## The Reference Application

To demonstrate the migration process, and help you understand it, a 
**reference implementation** has been created.

You can optionally execute the migration process vs this data, or
simply observe the output artifacts from it.

### Reference Databases 

Two sample databases have been implemented, and are implemented
in a separate repository: 
**https://github.com/cjoakim/mongodb-docker**

- **openflights** (airports, airplanes, routes, etc)
- **olympics** (results of the summer and olympic games 1896-2016)


### Reference Artifacts

Similarly, this repo contains sample code/script/file artifacts that
was generated from this metadata.  See the **reference_app/artifacts/**
directory.

These artifact files were created by script **m2c/generate_artifacts.sh**
in this repo.

---

## Executing the Migration Process

### 1.0 Azure Provisioning

Provision the following:

- Azure Storage Account
- Azure Linux Virtual Machine(s)
- Azure Data Factory
- Azure CosmosDB/Mongo - the target database for the migration

### 2.0 Development Computer Setup

This process assumes that the following are installed:

- git
- python 3
- az CLI
- bash shell support 

### 2.1 Optionally Setup and run the Reference Database

See https://github.com/cjoakim/mongodb-docker

### 2.2 Clone this repo to your Development machine

```
$ git clone git@github.com:cjoakim/azure-m2c-wgm.git
$ cd azure-m2c-wgm
```

### 2.3 Create a Python Virtual Environment

In repo root directory **azure-m2c-wgm** create a **python virtual environment** using the mechanism of your choice (venv, pyenv, etc.)
and install the libraries listed in the **requirements.in** file.


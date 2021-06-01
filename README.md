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

---

### 2.0 Development Computer Setup

This process assumes that the following are installed:

- git
- python 3
- az CLI
- bash shell support 

#### 2.1 Optionally Setup and run the Reference Database

See https://github.com/cjoakim/mongodb-docker

#### 2.2 Clone this repo to your Development machine

```
$ git clone git@github.com:cjoakim/azure-m2c-wgm.git
$ cd azure-m2c-wgm
```

#### 2.3 Create a Python Virtual Environment

In repo root directory **azure-m2c-wgm** create a **python virtual environment** using the mechanism of your choice (venv, pyenv, etc.)
and install the libraries listed in the **requirements.in** file.

This repo contains and generates **pyenv.sh** scripts which create python virtual 
environments using [pyenv](https://github.com/pyenv/pyenv)

**Standard Python version 3.8 or higher is recommended.**  It has been developed with 3.8.6.

#### 2.4 Edit env.sh and set Environment Variables

See file **env.sh** and make your edits to it.

This script is **sourced** by the other scripts, and the generated scripts.

In particular, you should set these three variable to point to a filesystem
location that is **external to this repo**.  They are currently set to the
reference_app directory within this repo simply to provide easily understood
references of the process.

```
export M2C_APP_DIR="reference_app"
export M2C_APP_ARTIFACTS_DIR="reference_app/artifacts"
export M2C_APP_DATA_DIR="reference_app/data"
```

#### 2.4.1 Execute replicate_scripts.sh

Once **env.sh** is edited, execute script **replicate_scripts.sh** to copy env.sh
to several places.

---

### 3.0 Extract Database Metadata

This migration process is driven by the **metadata** extracted from the
source databases, as well an initially-generated but then user edited
**mapping** files.

#### 3.1 Extract Source Database Metadata

See **extract_metadata.sh**.  This executes a python process to connect
to your source database(s) and extract metadata as JSON files.

The output JSON files are **not edited** after initial creation.

```
$ ./extract_metadata.sh
...
file written: reference_app/data/metadata/olympics_metadata.json
file written: reference_app/data/metadata/openflights_metadata.json
```

#### 3.2 Generate Mapping Files

See **generate_mapping_files.sh**.  This generates files that are somewhat
similar to the above metadata files, but are **intended to be edited by the customer**.  

These files map source-to-target database and container mapping, as well as
data wrangling/transformation rules for items such as partition keys, document types,
and attribute pruning.

```
$ ./generate_mapping_files.sh
...
file written: reference_app/data/metadata/olympics_mapping.json
file written: reference_app/data/metadata/openflights_mapping.json
```

---

### 4.0 Generate Artifacts

This process generates the following:

- mongoexport scripts from the source database(s)
- Scripts to upload the mongoexport files to Azure Storage via the az CLI
- Scripts to upload the mongoexport files to Azure Storage via Python 3
- Data wrangling/transformation scripts
  - Wrangle/transforms the source mongoexport files to similar output files
  - Uploads the wrangled/transformed mongoexport files to Azure Storage
- Azure Data Factory (ADF)
  - Linked Services - Azure Storage and Azure CosmosDB
  - DataSets - for each wrangled/transformed Azure Storage blob
  - Pipelines - to load the target CosmosDB from the wrangled/transformed Azure Storage blobs
  - These generated artifacts can be added to the git repository used by your ADF

```
./generate_artifacts.sh
```

Sample output:
```
ensuring target artifact directories exist ...
deleting previous generated artifacts ...
generating artifacts ...
['main.py', 'generate_artifacts', 'openflights', '--all']
generate_artifacts openflights ['main.py', 'generate_artifacts', 'openflights', '--all']
file written: reference_app/artifacts/shell/openflights_mongoexports.sh
file written: reference_app/artifacts/shell/python_create_containers.sh
file written: reference_app/artifacts/shell/openflights_python_mongoexport_uploads.sh
file written: reference_app/artifacts/shell/env.sh
file written: reference_app/artifacts/shell/pyenv.sh
file written: reference_app/artifacts/shell/storage.py
file written: reference_app/artifacts/shell/requirements.in
file written: reference_app/artifacts/shell/requirements.txt
file written: reference_app/artifacts/shell/openflights_az_cli_mongoexport_uploads.sh
file written: reference_app/artifacts/adf/openflights__airlines__mongoexport.json
file written: reference_app/artifacts/adf/openflights__airports__mongoexport.json
file written: reference_app/artifacts/adf/openflights__countries__mongoexport.json
file written: reference_app/artifacts/adf/openflights__planes__mongoexport.json
file written: reference_app/artifacts/adf/openflights__routes__mongoexport.json
```

---

### 5.0 Execute the Data wrangling/transformation scripts

These can be executed in one of several locations:

- Your on-prem virtual machine(s)
- Azure virtual machine(s)

#### 5.1 Execute the mongoexport scripts

See the **shell subdirectory** within M2C_APP_ARTIFACTS_DIR.

These generated scripts end with **_mongoexports.sh**, such as **openflights_mongoexports.sh**
where **openflights** is the name of the source database.

For example:

```
$ ./openflights_mongoexports.sh

2021-06-01T16:32:10.974-0400	connected to: mongodb://[**REDACTED**]@localhost:27017
2021-06-01T16:32:11.099-0400	exported 6161 records
2021-06-01T16:32:11.134-0400	connected to: mongodb://[**REDACTED**]@localhost:27017
2021-06-01T16:32:11.333-0400	exported 7698 records
2021-06-01T16:32:11.373-0400	connected to: mongodb://[**REDACTED**]@localhost:27017
2021-06-01T16:32:11.388-0400	exported 261 records
2021-06-01T16:32:11.424-0400	connected to: mongodb://[**REDACTED**]@localhost:27017
2021-06-01T16:32:11.436-0400	exported 246 records
2021-06-01T16:32:11.471-0400	connected to: mongodb://[**REDACTED**]@localhost:27017
2021-06-01T16:32:12.474-0400	[#################.......]  openflights.routes  48000/67663  (70.9%)
2021-06-01T16:32:12.644-0400	[########################]  openflights.routes  67663/67663  (100.0%)
2021-06-01T16:32:12.644-0400	exported 67663 records
done
```

#### 5.2 Create Azure Storage Containers

First, create the necessary containers within your Azure Storage account.
This creates two containers per database to be migrated -  a xxx-raw
container, and a xxx-adf container, where xxx is your database name.

The xxx-raw containers are for your raw mongoexport files, while the
xxx-adf containers are for the wrangled/transformed blobs that will
be loaded into Azure CosmosDB by Azure Data Factory (ADF).

```
$ python_create_containers.sh

$ source env.sh ; python storage.py list_blob_containers 

1 olympics-adf
2 olympics-raw
3 openflights-adf
4 openflights-raw
```

#### 5.3 Execute the upload to Azure Storage scripts

Two similar scripts per database will be generated for you to choose from,
based on your preferences - **python** or the **az CLI** program.

These will upload your source mongoexport files to Azure Storage blobs.

The typical migration use-case is that the mongoexport process is executed
on-prem, while the subsequent wrangling/transformation is executed in 
Azure on a VM(s). 

```
$ ./olympics_az_cli_mongoexport_uploads.sh
  ... or ...
$ ./olympics_python_mongoexport_uploads.sh
```

#### 5.4 Execute the Wrangling/Transformation scripts

These transform the mongoexport files extracted in section 5.1 per the rules
you defined in the mapping files.

```
TBD
```

After transforming each input file, these scripts upload the transformed file
to Azure Storage.

---

### 6.0 Execute the Azure Data Factory Pipelines 

### 6.1 Execute Verification Process

TBD

### 6.2 Executes the ADF Pipelines 

This executes the ADF Pipelines to copy the Azure Storage data
to the target CosmosDB.

### 6.3 Execute the Verification Process

TBD ....

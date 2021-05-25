# azure-m2c-wgm

<p align="center"><img src="doc/architecture.png" width="95%"></p>

---

This repo contains:
- The metadata-driven migration process
- A reference implementation of it, including reference databases

Directory map in this repo:

```
├── doc
├── m2c
│   ├── pysrc
│   │   └── __pycache__
│   └── templates
└── reference_app
    ├── artifacts
    ├── data
    │   └── meta
    └── databases
        ├── mongo
        ├── olympics
        │   ├── import_json
        │   └── raw
        ├── openflights
        │   ├── import_json
        │   └── raw
```

## Implementation

The implementation of this process primarily uses **Python3** and the 
**Azure PaaS services** shown in the diagram above.  

The current implementation uses and generates **bash** scripts for linux and macOS
environments.  Windows **powershell** will be added soon.

The **mongoexport** utility, and **file format**, is a core compoment of the migration process.

The essence of the process is to **extract source database metadata** as JSON, then
generate the many code and file artifacts from this metadata.  This includes:

- Mongoexport scripts
- Blob Upload scripts
- Azure Container Instance execution scripts (optional)
- Azure Data Factory (ADF) code artifacts - Linked Services, Datasets, Pipelines

The mongoexport files exported from the source database are typically **wrangled**
before being loaded in the target CosmosDB database, via ADF, from blob storage.
The wrangling process can add a **partition key**, sometimes a **doctype**, 
as well as other input modification.

In some cases the data wrangling can use logic built into the python logic, but in 
other cases that python data wrangling will need modification per the needs of the
customer.

The data wrangling process can either be executed in one of several places:
- On-Prem
- In Azure Container Instances, as shown in the above diagram.
- Elsewhere in Azure, such as on a VM.

The output of the wrangling process is blob files in Azure Storage, in mongoexport/mongoimport
format, and suitable for loading into the target CosmosDB with ADF.

### Oplog

A future version of this migration process will leverage the mongodb **oplog**
in addition to the mongoexport utility program.

---

## The Reference Databases

Two sample databases have been implemented for you to execute and understand
this migration process.  They are **openflights** (airports, airplanes, routes, etc)
and **ollympics** (results of the summer and olympic games 1896-2016).

You can load this data into your dev/test database as follows:
```
$ cd reference_app/databases
./mongo_recreate_olympics_db.sh
./mongo_recreate_openflights_db.sh
```



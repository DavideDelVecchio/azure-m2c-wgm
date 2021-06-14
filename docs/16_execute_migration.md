# 16 - Execute Migration

The previous documentation pages 00 through 15 have explained the migration
process, setup various environments, and generated various artifacts.  In this page 
we finally **execute the migration process!**

The architecture diagram is repeated here:

<p align="center"><img src="img/architecture.png" width="99%"></p>

---

## mongoexports

In the **artifacts/shell** directory there will be a generated file named
**xxx_mongoexports.sh**, where xxx is the name of one of your source databases.

The contents of these files will look like this:

```
#!/bin/bash

# Bash shell script to export each source collection via mongoexport.
#
# Database Name: openflights
# Generated on:  2021-06-13 13:18:15 UTC
# Template:      mongoexport_script.txt

source env.sh

mkdir -p data/source/mongoexports


echo ''
echo 'mongoexporting - database: openflights container: airlines'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection airlines \
    --out /Users/cjoakim/github/azure-m2c-wgm-reference-app/reference_app/data/mongoexports/openflights/openflights__airlines.json
     # no --ssl

echo ''
echo 'mongoexporting - database: openflights container: airports'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection airports \
    --out /Users/cjoakim/github/azure-m2c-wgm-reference-app/reference_app/data/mongoexports/openflights/openflights__airports.json
     # no --ssl

echo ''
echo 'mongoexporting - database: openflights container: countries'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection countries \
    --out /Users/cjoakim/github/azure-m2c-wgm-reference-app/reference_app/data/mongoexports/openflights/openflights__countries.json
     # no --ssl

echo ''
echo 'mongoexporting - database: openflights container: planes'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection planes \
    --out /Users/cjoakim/github/azure-m2c-wgm-reference-app/reference_app/data/mongoexports/openflights/openflights__planes.json
     # no --ssl

echo ''
echo 'mongoexporting - database: openflights container: routes'
mongoexport --authenticationDatabase admin -u $M2C_SOURCE_MONGODB_USER -p $M2C_SOURCE_MONGODB_PASS --uri mongodb://@localhost:27017 \
    --db openflights \
    --collection routes \
    --out /Users/cjoakim/github/azure-m2c-wgm-reference-app/reference_app/data/mongoexports/openflights/openflights__routes.json
     # no --ssl

echo 'done'
```

This script will execute the **mongoexport** program for each container in your source database.

It is **recommended** that the mongoexport process executes **close to the source database**,
such as an on-prem VM near your on-prem MongoDB, or a cloud VM near your cloud provider MongoDB.

The way the script is currently implemented the exports are executed sequentially on the same VM.
The project roadmap has a high-ranking item to **parallelize** the mongoexport process; this should
be a very easy enhancement to implement additional scripts for this.

Sample output:

```
$ ./openflights_mongoexports.sh

mongoexporting - database: openflights container: airlines
2021-06-14T11:32:31.520-0400	connected to: mongodb://[**REDACTED**]@localhost:27017
2021-06-14T11:32:31.932-0400	exported 18483 records

mongoexporting - database: openflights container: airports
2021-06-14T11:32:31.967-0400	connected to: mongodb://[**REDACTED**]@localhost:27017
2021-06-14T11:32:32.596-0400	exported 23094 records

mongoexporting - database: openflights container: countries
2021-06-14T11:32:32.633-0400	connected to: mongodb://[**REDACTED**]@localhost:27017
2021-06-14T11:32:32.658-0400	exported 783 records

mongoexporting - database: openflights container: planes
2021-06-14T11:32:32.691-0400	connected to: mongodb://[**REDACTED**]@localhost:27017
2021-06-14T11:32:32.713-0400	exported 738 records

mongoexporting - database: openflights container: routes
2021-06-14T11:32:32.745-0400	connected to: mongodb://[**REDACTED**]@localhost:27017
2021-06-14T11:32:33.749-0400	[####....................]  openflights.routes  40000/202989  (19.7%)
2021-06-14T11:32:34.746-0400	[###########.............]  openflights.routes  96000/202989  (47.3%)
2021-06-14T11:32:35.747-0400	[##################......]  openflights.routes  160000/202989  (78.8%)
2021-06-14T11:32:36.286-0400	[########################]  openflights.routes  202989/202989  (100.0%)
2021-06-14T11:32:36.286-0400	exported 202989 records
done
```

---

## Uploading the Raw mongoexport blobs to Azure Storage

This step is **intended to be executed from the same location/VM as the previous step, as the mongoexport files are local to that filesystem**.

Section [12 - Create the Azure Storage Containers](12_create_the_azure_storage_containers.md)
described the process to create the necessary storage containers in your Azure Storage account.
These containers are assumed to exist at this point.

Two equivalent sets of mongoexport file upload scripts are created; one uses
**python and Azure Storage SDK** while the other uses the **az CLI**.  Either can
be used depending on your preferences.

Execute one of these generated scripts per source database:

```
olympics_az_cli_mongoexport_uploads.sh
olympics_python_mongoexport_uploads.sh
openflights_az_cli_mongoexport_uploads.sh
openflights_python_mongoexport_uploads.sh
```

The way the script is currently implemented the uploads are executed sequentially on the same VM.
The project roadmap also has a high-ranking item to **parallelize** the uploads process; this should
also be a very easy enhancement to implement additional scripts for this.

### storage.py

There is a Python script, in the same directory, for accessing your Azure Storage Account.
The following functions are available:

```
Usage:
    source env.sh ; python storage.py create_blob_container openflights-raw
    source env.sh ; python storage.py create_blob_container openflights-adf
    source env.sh ; python storage.py create_blob_container test
    source env.sh ; python storage.py delete_blob_container openflights-raw
    source env.sh ; python storage.py list_blob_containers
    source env.sh ; python storage.py list_blob_container openflights-raw
    source env.sh ; python storage.py upload_blob local_file_path cname blob_name
    source env.sh ; python storage.py upload_blob requirements.in test requirements.in
    source env.sh ; python storage.py download_blob test aaa.txt aaa-down.txt
```

---

## Wrangling for ADF

**The purpose of these scripts is to transform each raw mongexport file from the source database into the format for loading into CosmosDB via Azure Data Factory**.

**This process is expected to be executed on an Azure VM(s) in the same region as your Storage Account.**

The **artifacts/shell** directory will contain a number of generated **wrangle_** scripts;
one per source database, and one for each collection in each source database.

You can execute these all sequentially for a given source database, by executing the **_all.sh**
script.  Likewise, you can execute these scripts individually to parallelize them.

```
reference_app/artifacts/shell/wrangle_openflights_airlines.sh
reference_app/artifacts/shell/wrangle_openflights_airports.sh
reference_app/artifacts/shell/wrangle_openflights_countries.sh
reference_app/artifacts/shell/wrangle_openflights_planes.sh
reference_app/artifacts/shell/wrangle_openflights_routes.sh

reference_app/artifacts/shell/wrangle_openflights_all.sh   <-- executes each of the above
```

Each wrangling file looks like the following.  Please see the generated comment in the 
script that describes the logic.  In short: **download, wrangle, upload, cleanup**.

```
#!/bin/bash

# Bash shell script to wrangle/transform a raw mongoexport file.
#
# Database Name: olympics
# Generated on:  2021-06-13 13:18:14 UTC
# Template:      wrangle_one.txt

source ./env.sh

mkdir -p tmp/olympics/out
mkdir -p out/olympics

# This script does the following:
# 1) Downloads blob olympics__g1896_summer.json from container olympics-raw
#    to local file tmp/olympics/olympics__g1896_summer.json
# 2) Wrangle/transform the downloaded blob, producing local file 
#    tmp/olympics/olympics__g1896_summer__wrangled.json
# 3) Uploads the wrangled file to storage container olympics-adf
# 4) Delete the downloaded and wrangled file, as the host VM may have limited storage
#
# Note: this script is executed by script olympics_wrangle_all.sh

python wrangle.py transform_blob \
    --db olympics \
    --source-coll  g1896_summer \
    --in-container olympics-raw \
    --blobname olympics__g1896_summer.json \
    --filename tmp/olympics/olympics__g1896_summer.json \
    --outfile  tmp/olympics/olympics__g1896_summer__wrangled.json \
    --out-container olympics-games-adf $1 $2 $3 

echo ''
echo 'first line of input file:'
head -1 tmp/olympics/olympics__g1896_summer.json

echo ''
echo 'first line of output file:'
head -1 tmp/olympics/olympics__g1896_summer__wrangled.json

echo 'deleting the downloaded and wrangled files to save disk space...'
rm tmp/olympics/olympics__g1896_summer.json
rm tmp/olympics/olympics__g1896_summer__wrangled.json

echo 'done' 
```

It is important to note that the uploaded 
**wrangled blobs are written to the Azure Storage container that corresponds to a target CosmosDB database and collection**,
and not the source DB and container.  This design allows Azure Data Factory to read 
the one or more transofrmed files in each xxx-adf container as a single **dataset**.

Output from the above wrangling script:

```
$ ./wrangle_olympics_g1896_summer.sh
__main__ args: ['wrangle.py', 'transform_blob', '--db', 'olympics', '--source-coll', 'g1896_summer', '--in-container', 'olympics-raw', '--blobname', 'olympics__g1896_summer.json', '--filename', 'tmp/olympics/olympics__g1896_summer.json', '--outfile', 'tmp/olympics/olympics__g1896_summer__wrangled.json', '--out-container', 'olympics-games-adf']
func: transform_blob
Transformer constructor; parsed args:
  dbname:        olympics
  source_coll:   g1896_summer
  in_container:  olympics-raw
  blobname:      olympics__g1896_summer.json
  filename:      tmp/olympics/olympics__g1896_summer.json
  outfile:       tmp/olympics/olympics__g1896_summer__wrangled.json
  out_container: olympics-games-adf
load_container_mappings; cname: g1896_summer
load_container_mappings; fname: olympics_mapping.json
mappings:
{
  "name": "g1896_summer",
  "mapping": {
    "target_dbname": "olympics",
    "target_container": "games",
    "wrangling_algorithm": "standard",
    "pk_name": "pk",
    "pk_logic": [
      [
        "attribute",
        "games"
      ]
    ],
    "pk_sep": "-",
    "doctype_name": "doctype",
    "doctype_logic": [
      [
        "dynamic",
        "source_cname"
      ]
    ],
    "doctype_sep": "-",
    "additions": [
      [
        "dynamic",
        "some_id",
        "uuid"
      ]
    ],
    "excludes": [
      "id"
    ]
  },
  "source_dbname": "olympics",
  "default_target_dbname": "olympics"
}
StandardDocumentWrangler constructor:
  do_pk_wrangling:      True
  do_doctype_wrangling: True
  do_additions:         True
  do_excludes:          True
wrangling_algorithm: standard
download_blob olympics__g1896_summer.json from olympics-raw to tmp/olympics/olympics__g1896_summer.json
download_blob: olympics-raw olympics__g1896_summer.json -> tmp/olympics/olympics__g1896_summer.json
downloaded tmp/olympics/olympics__g1896_summer.json in 1.0001301765441895ms
transformed 380 lines in 0.02562713623046875
uploading tmp/olympics/olympics__g1896_summer.json at 2021-06-14 19:30:47 UTC to olympics-games-adf/olympics__g1896_summer__wrangled.json
upload_blob: tmp/olympics/olympics__g1896_summer__wrangled.json True -> olympics-games-adf olympics__g1896_summer__wrangled.json
uploaded tmp/olympics/olympics__g1896_summer.json/olympics__g1896_summer__wrangled.json at 2021-06-14 19:30:47 UTC in 0.22879409790039062
{'name': 'olympics__g1896_summer__wrangled.json', 'container': 'olympics-games-adf', 'snapshot': None, 'version_id': None, 'is_current_version': None, 'blob_type': <BlobType.BlockBlob: 'BlockBlob'>, 'metadata': {}, 'encrypted_metadata': None, 'last_modified': datetime.datetime(2021, 6, 14, 19, 30, 48, tzinfo=datetime.timezone.utc), 'etag': '"0x8D92F6AE98FA47C"', 'size': 150788, 'content_range': None, 'append_blob_committed_block_count': None, 'is_append_blob_sealed': None, 'page_blob_sequence_number': None, 'server_encrypted': True, 'copy': {'id': None, 'source': None, 'status': None, 'progress': None, 'completion_time': None, 'status_description': None, 'incremental_copy': None, 'destination_snapshot': None}, 'content_settings': {'content_type': 'application/octet-stream', 'content_encoding': None, 'content_language': None, 'content_md5': bytearray(b'v\xd4\xe4\x87\x81?MyJ\xbel\xe6|\xb9.\xe0'), 'content_disposition': None, 'cache_control': None}, 'lease': {'status': 'unlocked', 'state': 'available', 'duration': None}, 'blob_tier': 'Hot', 'rehydrate_priority': None, 'blob_tier_change_time': None, 'blob_tier_inferred': True, 'deleted': False, 'deleted_time': None, 'remaining_retention_days': None, 'creation_time': datetime.datetime(2021, 6, 14, 19, 26, 41, tzinfo=datetime.timezone.utc), 'archive_status': None, 'encryption_key_sha256': None, 'encryption_scope': None, 'request_server_encrypted': True, 'object_replication_source_properties': [], 'object_replication_destination_policy': None, 'last_accessed_on': None, 'tag_count': None, 'tags': None}
-
SUMMARY for args:  wrangle.py transform_blob --db olympics --source-coll g1896_summer --in-container olympics-raw --blobname olympics__g1896_summer.json --filename tmp/olympics/olympics__g1896_summer.json --outfile tmp/olympics/olympics__g1896_summer__wrangled.json --out-container olympics-games-adf
  status:          completed
  lines_processed: 380
  start_time:      1623699046.73406
  elapsed_time:    1.3163938522338867

first line of input file:
{"_id":{"$oid":"60c7a7e05480299daf2e2090"},"id":"4113","name":"Anastasios Andreou","sex":"m","age":"-1","height":"-1","weight":"-1","team":"greece","noc":"gre","games":"1896_summer","year":"1896","season":"summer","city":"athina","sport":"athletics","event":"athletics mens 110 metres hurdles","medal":"","medal_value":"0"}

first line of output file:
{"_id":{"$oid":"60c7a7e05480299daf2e2090"},"name":"Anastasios Andreou","sex":"m","age":"-1","height":"-1","weight":"-1","team":"greece","noc":"gre","games":"1896_summer","year":"1896","season":"summer","city":"athina","sport":"athletics","event":"athletics mens 110 metres hurdles","medal":"","medal_value":"0","pk":"1896_summer","doctype":"","some_id":"ca6e9b8b-216e-43ae-8040-7229a7479c4f"}
deleting the downloaded and wrangled files to save disk space...
done
```

Items to note:

1) Information about the files being uses, and the mappings applied, are logged. 
2) Information about the uploaded blob is logged.
3) Rows processed and processing elapses time is logged.
4) The first rows of both the input file and the output file are logged for visual verification of the transformation.

---

## Execute ADF Pipelines

The last steps of the migration process are to execute each ADF Pipeline.

This can be done either in the Azure Portal and ADF UI, or from a command-line
to execute the generated scripts.

**The purpose of these ADF Pipelines are to copy the transformed mongoexport files to the containers in your CosmosDB database.**

For example, the reference application produces these scripts.

```
adf_pipeline_copy_to_olympics_games.sh
adf_pipeline_copy_to_olympics_locations.sh
adf_pipeline_copy_to_travel_airlines.sh
adf_pipeline_copy_to_travel_airports.sh
adf_pipeline_copy_to_travel_countries.sh
adf_pipeline_copy_to_travel_planes.sh
adf_pipeline_copy_to_travel_routes.sh
```

Execute each script as follows:

```
$ ./adf_pipeline_copy_to_travel_routes.sh
Command group 'datafactory pipeline' is experimental and under development. Reference and support levels: https://aka.ms/CLI_refstatus
{
  "runId": "9512045e-cd4a-11eb-9923-acde48001122"
}
```

This gives you a **runId** that you can **then monitor in Azure Data Factory**.

Then **visit the Monitor tab of your ADF UI**, and verify that the Pipeline completes successfully.  Scroll to the right of the list of Pipeline Runs to see the **Run ID**
column.  Alternatively, enter the runID value in the search box at the top of the list.

#### ADF Monitor View with list of Pipeline Runs

<p align="center"><img src="img/adf-monitor-pipelines-list.png" width="99%"></p>

---

#### Search for Pipeline by runId

<p align="center"><img src="img/adf-pipeline-search-by-runid.png" width="99%"></p>

---

#### A completed Pipeline: travel routes

<p align="center"><img src="img/adf-completed-pipeline-travel-routes.png" width="99%"></p>

---

#### A completed Pipeline: olympics games

<p align="center"><img src="img/adf-completed-pipeline-olympics-games.png" width="99%"></p>

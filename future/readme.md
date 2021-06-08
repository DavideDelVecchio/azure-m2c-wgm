# Future

This directory contains several files that are "on the drawing board"
for potential future enhancements.

## Azure Data Factory with the az CLI

Pipeline executions with the az CLI have been implemented; retaining these
other commands to list and show items, for potential future use.

See https://docs.microsoft.com/en-us/cli/azure/datafactory?view=azure-cli-latest

```
$ az datafactory dataset list --factory-name cjoakimm2cadf1 --resource-group cjoakimm2c

$ az datafactory dataset show --factory-name cjoakimm2cadf1 --resource-group cjoakimm2c --name cosmos__olympics__games

$ az datafactory pipeline list --factory-name cjoakimm2cadf1 --resource-group cjoakimm2c

$ az datafactory pipeline show --factory-name cjoakimm2cadf1 --resource-group cjoakimm2c --name pipeline_copy_to_olympics_games
```

## Docker

These files work, but the current strategy is to execute the
migration process from GitHub code rather than a Docker container.

```
./future/build_container.sh
./future/Dockerfile
./future/compose.sh
./future/docker-compose.yml
```

## MongoDB Read-only User

In mongo shell of source database:

```
>  db.createUser({'user':'exporter','pwd':'secret','roles':['read']})
Successfully added user: { "user" : "exporter", "roles" : [ "read" ] }
```
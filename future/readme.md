# Future

This directory contains several files that are "on the drawing board"
for potential future enhancements.

## Docker

These files work, but the current strategy is to execute the
migration process from GitHub code rather than a Docker container.

```
./future/build_container.sh
./future/Dockerfile
./future/compose.sh
./future/docker-compose.yml
```

## mongoexport with --query option

--query '{"field1":"value1"}'

See https://docs.mongodb.com/v4.0/reference/program/mongoexport/#options

## mongoimport

Server Side Retry

See https://docs.microsoft.com/en-us/azure/cosmos-db/tutorial-mongotools-cosmos-db

## MongoDB, Create a "Read-Only" User

In mongo shell of source database:

```
>  db.createUser({'user':'exporter','pwd':'secret','roles':['read']})
Successfully added user: { "user" : "exporter", "roles" : [ "read" ] }
```

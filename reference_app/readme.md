# Reference Application for the M2C Project


## Creating the localhost databases

```

```

## Verifying 

```
$ mongo

> show databases
admin        0.000GB
config       0.000GB
local        0.000GB
olympics     0.028GB    <-- added
openflights  0.005GB    <-- added

> use openflights
switched to db openflights
> show collections
airlines
airports
countries
planes
routes
> db.airports.findOne()
{
	"_id" : ObjectId("60acb6992f52ba0690fd212e"),
	"airport_id" : "8",
	"name" : "Godthaab / Nuuk Airport",
	"city" : "Godthaab",
	"country" : "Greenland",
	"iata_code" : "GOH",
	"icao_code" : "BGGH",
	"latitude" : "64.19090271",
	"longitude" : "-51.6781005859",
	"altitude" : "283",
	"timezone_num" : "-3",
	"dst" : "E",
	"timezone_code" : "America/Godthab",
	"type" : "airport",
	"source" : "OurAirports"
}


> use olympics
switched to db olympics

> show collections
1896_summer
1900_summer
1904_summer
1906_summer
1908_summer
1912_summer
1920_summer
1924_summer
1924_winter
1928_summer
1928_winter
1932_summer
1932_winter
1936_summer
1936_winter
1948_summer
1948_winter
1952_summer
1952_winter
1956_summer
1956_winter
1960_summer
1960_winter
1964_summer
1964_winter
1968_summer
1968_winter
1972_summer
1972_winter
1976_summer
1976_winter
1980_summer
1980_winter
1984_summer
1984_winter
1988_summer
1988_winter
1992_summer
1992_winter
1994_winter
1996_summer
1998_winter
2000_summer
2002_winter
2004_summer
2006_winter
2008_summer
2010_winter
2012_summer
2014_winter
2016_summer
countries
games
>
```

---

## Troubleshooting 

### Deleting the databases 

```
$ mongo 

> use olympics
switched to db olympics
> db.dropDatabase()
{ "dropped" : "olympics", "ok" : 1 }
> use openflights
switched to db openflights
> db.dropDatabase()
{ "dropped" : "openflights", "ok" : 1 }
```

### Stopping mongod with kill -2

```
$ ps aux | grep mongo
cjoakim          36080   0.0  0.0  4408512    776 s000  S+    5:36AM   0:00.00 grep mongo
cjoakim          35833   0.0  0.2  5873876  52308 s000  S     5:35AM   0:01.26 mongod --config /usr/local/etc/mongod.conf

$ kill -2 35833
```

### Repairing Mongo after a Crash

See https://docs.mongodb.com/manual/tutorial/recover-data-following-unexpected-shutdown/

View the localhost log file:

```
$ cat /usr/local/var/log/mongodb/mongo.log

2021-05-25T05:26:46.858-0400 I NETWORK  [listener] connection accepted from 127.0.0.1:65417 #46 (1 connection now open)
2021-05-25T05:26:47.388-0400 E STORAGE  [conn46] WiredTiger error (24) [1621934807:388202][33852:0x700006f83000], file:index-195--2763969997278449619.wt, WT_SESSION.open_cursor: __posix_open_file, 672: /usr/local/var/mongodb/index-195--2763969997278449619.wt: handle-open: open: Too many open files Raw: [1621934807:388202][33852:0x700006f83000], file:index-195--2763969997278449619.wt, WT_SESSION.open_cursor: __posix_open_file, 672: /usr/local/var/mongodb/index-195--2763969997278449619.wt: handle-open: open: Too many open files
2021-05-25T05:26:47.388-0400 E STORAGE  [conn46] Failed to open a WiredTiger cursor: table:index-195--2763969997278449619
2021-05-25T05:26:47.388-0400 E STORAGE  [conn46] This may be due to data corruption. Please read the documentation for starting MongoDB with --repair here: http://dochub.mongodb.org/core/repair
2021-05-25T05:26:47.388-0400 F -        [conn46] Fatal Assertion 50882 at src/mongo/db/storage/wiredtiger/wiredtiger_session_cache.cpp 143
2021-05-25T05:26:47.388-0400 F -        [conn46] \n\n***aborting after fassert() failure\n\n

```

Repair mongo with the **--repair** flag.  This process will run for several seconds.
Then restart mongod as usual.

```
$ mongod --config /usr/local/etc/mongod.conf --repair &
```

### Reinstall

See https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/

```
$ cat /usr/local/etc/mongod.conf
systemLog:
  destination: file
  path: /usr/local/var/log/mongodb/mongo.log
  logAppend: true
storage:
  dbPath: /usr/local/var/mongodb
net:
  bindIp: 127.0.0.1


$ brew uninstall mongodb-community@4.0
Uninstalling /usr/local/Cellar/mongodb-community@4.0/4.0.22... (21 files, 223.1MB)
$ brew cleanup
$ rm -rf /usr/local/opt/mongodb-community@4.0/
$ rm -rf /usr/local/Cellar/mongodb-community@4.0/
$ rm -rf /usr/local/var/log/mongodb/

$ which mongo   <-- no longer installed 

$ rm -rf /usr/local/var/mongodb
$ rm -rf /usr/local/var/log/mongodb/

$ brew tap mongodb/brew
$ brew install mongodb-community@4.4
...
==> mongodb-community
To have launchd start mongodb/brew/mongodb-community now and restart at login:
  brew services start mongodb/brew/mongodb-community
Or, if you don't want/need a background service you can just run:
  mongod --config /usr/local/etc/mongod.conf

$ cat /usr/local/etc/mongod.conf
systemLog:
  destination: file
  path: /usr/local/var/log/mongodb/mongo.log
  logAppend: true
storage:
  dbPath: /usr/local/var/mongodb
net:
  bindIp: 127.0.0.1

$ ls -al /usr/local/var/ | grep mongo
drwxr-xr-x   2 cjoakim  admin   64 May 25 05:59 mongodb

$ alias | grep mongod
alias mongod_start='mongod --config /usr/local/etc/mongod.conf &'

$ mongod_start
[1] 43996

$ mongo
MongoDB shell version v4.4.5
connecting to: mongodb://127.0.0.1:27017/?compressors=disabled&gssapiServiceName=mongodb
MongoDB server version: 4.4.5


{ "ok" : 1 }
{
	"createdCollectionAutomatically" : false,
	"numIndexesBefore" : 1,
	"numIndexesAfter" : 2,
	"ok" : 1
}
{
	"ok" : 0,
	"errmsg" : "Index build failed: 6ae8f393-ad75-4a42-8329-a20bfc56c720: Collection olympics.g1998_winter ( b8ba5549-4173-4cfa-9068-2a0143c130da ) :: caused by :: index build on empty collection failed: 6ae8f393-ad75-4a42-8329-a20bfc56c720 :: caused by :: 24: Too many open files",
	"code" : 264,
	"codeName" : "TooManyFilesOpen"
}

$ ulimit -a | grep open
open files                      (-n) 256

$ mongo 
...
The server generated these startup warnings when booting:
        2021-05-25T06:11:14.637-04:00: Access control is not enabled for the database. Read and write access to data and configuration is unrestricted
        2021-05-25T06:11:14.637-04:00: Soft rlimits too low
        2021-05-25T06:11:14.637-04:00:         currentValue: 256
        2021-05-25T06:11:14.637-04:00:         recommendedMinimum: 64000


$ ulimit -n
256
$ launchctl limit maxfiles
	maxfiles    256            unlimited

$ launchctl limit maxfiles
$ launchctl limit maxfiles 65536 200000
$ sudo ulimit -n 65536 200000
$ ulimit -n
65536
$ launchctl limit maxfiles
	maxfiles    65536          200000
```
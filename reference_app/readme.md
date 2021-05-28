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
	"_id" : ObjectId("60acf1dd6fdd876b893ef2c6"),
	"airport_id" : "4",
	"name" : "Nadzab Airport",
	"city" : "Nadzab",
	"country" : "Papua New Guinea",
	"iata_code" : "LAE",
	"icao_code" : "AYNZ",
	"latitude" : "-6.569803",
	"longitude" : "146.725977",
	"altitude" : "239",
	"timezone_num" : "10",
	"dst" : "U",
	"timezone_code" : "Pacific/Port_Moresby",
	"type" : "airport",
	"source" : "OurAirports"
}


> use olympics
switched to db olympics

> use olympics
switched to db olympics
> show collections
countries
g1896_summer
g1900_summer
g1904_summer
g1906_summer
g1908_summer
g1912_summer
g1920_summer
g1924_summer
g1924_winter
g1928_summer
g1928_winter
g1932_summer
g1932_winter
g1936_summer
g1936_winter
g1948_summer
g1948_winter
g1952_summer
g1952_winter
g1956_summer
g1956_winter
g1960_summer
g1960_winter
g1964_summer
g1964_winter
g1968_summer
g1968_winter
g1972_summer
g1972_winter
g1976_summer
g1976_winter
g1980_summer
g1980_winter
g1984_summer
g1984_winter
g1988_summer
g1988_winter
g1992_summer
g1992_winter
g1994_winter
g1996_summer
g1998_winter
g2000_summer
g2002_winter
g2004_summer
g2006_winter
g2008_summer
g2010_winter
g2012_summer
g2014_winter
g2016_summer
games

> db.games.findOne()
{
	"_id" : ObjectId("60acf23412e246542c89f236"),
	"games" : "1924_summer",
	"city" : "paris"
}
```

---

## Mongod Administration 

### Adding the exporter user

```
$ mongo

> use olympics
db.createUser({'user':'exporter','pwd':'secret','roles':['read']})

> use openflights
> db.createUser({'user':'exporter','pwd':'secret','roles':['read']})

> db.getUsers()
[
	{
		"_id" : "openflights.exporter",
		"userId" : UUID("7ec46724-9cd4-4fee-a9c0-34e4d3f71a25"),
		"user" : "exporter",
		"db" : "openflights",
		"roles" : [
			{
				"role" : "read",
				"db" : "openflights"
			}
		],
		"mechanisms" : [
			"SCRAM-SHA-1",
			"SCRAM-SHA-256"
		]
	}
]

```

### Stopping mongod

```
$ mongo

> use admin
switched to db admin

> db.shutdownServer()      <---
server should be down...
>
```

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

### Repairing a mongod database on macOS

See [mongod_repair_macos](databases/mongod_macos_repair.sh)

### Docker 

https://medium.com/@foxjstephen/tutorial-mongodb-local-development-environment-on-macos-5f9b0ead4dc5

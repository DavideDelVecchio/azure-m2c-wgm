// MongoDB "DDL" initialize the "openflights" database and its collections.
// No indexes are added since this DB is simply used as a database migration source.
// Chris Joakim, Microsoft, June 2021

use openflights

db.airports.drop()
db.createCollection("airports")

db.airlines.drop()
db.createCollection("airlines")

db.routes.drop()
db.createCollection("routes")

db.planes.drop()
db.createCollection("planes")

db.countries.drop()
db.createCollection("countries")

show collections

# 00 - Purpose

The purpose of this project is to provide a **high-quality, highly automated, and repeatable process for migrating MongoDB databases to Azure CosmosDB**. The focus is on **data migration**.

The project provides both an architecture, and working implementation, of the process.
The process is flexible to allow customization on a case-by-case basis.

Migration aspects that are not addressed by this project include:
- Application Code Modification
- CosmosDB/Mongo API Database Design - databases, containers, partition keys, RU settings, etc
- CosmosDB/Mongo API Indexing - this depends on your specific application and query patterns

The Microsoft team will work with you to address these aspects of each migration.

In the following pages, pages 01 through 15 describe the migration process and its
setup.  Only in step 16 do you actually execute the migration.

# 17 - Roadmap

The initial version of this project was created in June 2021.

The following enhancements are on the **Project Roadmap**, in approximate
chronological order.

- Implement a **Validation Process**
  - Validate the presence of Storage Containers
  - Validate the presence of Storage Blobs
  - Validate the presence of Target CosmosDB Containers
  - Validate the presence of Azure Data Factory Artifacts
  - Validate approximate document counts; Source vs Target DB
- Implement **PowerShell Scripts for Windows**
- **Parallelize** the mongoexport process
- **Parallelize** the raw mongoexport upload process
- Implement Wrangling Logic in **Other Programming Languages**
  - C# and DotNet 5
  - Java 8+
- **Partition Key Analysis**
  - Cardinality and Distribution of pk values in the wrangled blobs
  - Do this analysis before loading CosmosDB
- Explore **Apache Spark** (i.e. - Synapse or Databricks) for Wrangling and/or Loading
- Explore the MongoDB **oplog** as a potential datasource

# 17 - Roadmap

The initial version of this project was created in June 2021.

The following enhancements are on the **Project Roadmap**, in approximate
chronological order.

- Implement a **Validation Process**
  - Validate the presence of Storage Containers - DONE
  - Validate the presence of Storage Blobs - WIP
  - Validate the presence of Target CosmosDB Containers
  - Validate the presence of Azure Data Factory Artifacts
  - Validate approximate document counts; Source vs Target DB
- Implement **PowerShell Scripts for Windows**
- Implement Wrangling Logic in **Other Programming Languages**
  - C# and net5.0
  - Java 8+
- **Partition Key Analysis**
  - Cardinality and Distribution of pk values in the wrangled blobs
  - Do this analysis before loading CosmosDB
- Explore the MongoDB **oplog** as a potential datasource

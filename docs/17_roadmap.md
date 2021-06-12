# 17 - Roadmap

The initial version of this project was created in June 2021.

The following enhancements are on the **Project Roadmap**, in approximate
chronological order.

- Revisit the Unit tests, achieve 100% code coverage on certain classes
- Implement a Validation process
  - Validate the presence of Storage Containers
  - Validate the presence of Storage Blobs
  - Validate the presence of Target CosmosDB Containers
  - Validate the presence of Azure Data Factory Artifacts
  - Validate approximate document counts; Source vs Target DB
- Implement PowerShell Scripts for Windows
- Implement Wrangling Logic in other Programming Languages
  - C# and DotNet 5
  - Java 8+
- Partition Key Analysis
  - Cardinality and Distribution of pk values in the wrangled blobs
- Explore Spark for Wrangling and/or Loading

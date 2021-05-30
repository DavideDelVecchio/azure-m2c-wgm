## Development TODO List

---

- TODO Quality Control - file sizes
- TODO File Map Excel Report?

- TODO ADF/git integration and testing

- TODO Automate VM Provisioning and Setup

- TODO Implement Wrangling; wrangle.py  enable blobs, externalized rules  

---

- Done Implement Wrangling IO processing
  - download, transform, upload, logging, list and download result blob

- Done Explore ACI; use a VM instead.
  - Simplicity, streams, subscription limits, VM sizes

- Done Create Dockerfile and Container

- Done mongoexports for Docker DB

- Done Modifify DB loading for Docker DB
- Done Run MongoDB with a Docker container

- Done Enhance unit tests, with env vars, to 100% coverage of AppConfig
- Done Add pytest, pytest-cov, and first tests of AppConfig

- Done File Uploads - az CLI 
- Done File Uploads - Python 

- Done Generate Customer-Edited Mapping File
  - source container to target container mapping
  - pk attr and logic
  - doctype attr attr and logic
  - transformations
```
    {
      "name": "airports",
      "mapping": {
        "target_db_container": "ddd/ccc",
        "pk_attr_name": "aaa",
        "pk_attr_logic": [],
        "excludes": []
      }
    },
```
---

- Done Recreate Local DB, load, export
- Done Mongo Reinstall Script

- Done Add Storage.py
- Done Create new Dedicated Repo
  - https://github.com/cjoakim/azure-m2c-wgm
- Done ADF generation 

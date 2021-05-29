## Development TODO List

- TODO Quality Control - file sizes
- TODO File Map Excel Report?
- TODO Run MongoDB with a Docker container?

- TODO ADF/git integration and testing

- TODO ACI Script Testing
- TODO ACI Script Generation
- TODO Create Dockerfile and Container

- TODO Implement Wrangling.  With externalized rules?  wrangle.py

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

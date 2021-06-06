## Development TODO List

---

- TODO Automate VM Provisioning and Setup; see uvm repo

- TODO Manifest Excel File

- TODO ADF/git integration and testing

---

- Done Manifest Excel and JSON Manifest Files

- Done Refactor class AppConfig to Config
- Done Refactor ArtifactGenerator to use common method render_template

- Done Implement StandardDocumentWrangler Unit test

- Done Generate Wrangling Shell Scripts - for each collection

- Done Generate Wrangling Shell Scripts - for each database
  - app_config wrangle_script_basename

- Done Refine AppConfig Unit test
- Done Refactor data/xxx/mongoexports/ to data/mongoexports/xxx

- Done Extract Reference Database to a separate repo
  - https://github.com/cjoakim/mongodb-docker

- Done Implement Wrangling
  - wrangle.py  enable blobs, externalized rules  
  - standard_doc_wrangler.py using mapping json

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

#!/bin/bash

# Bash shell script to upload blobs to Azure Storage with Python3.
# See https://docs.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10
#
# Database Name: openflights
# Generated on:  

source env.sh



# python uploader.py upload_blob local_file_path cname blob_name
python uploader.py upload_blob /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__airlines__source.json airlines bbb

# python uploader.py upload_blob local_file_path cname blob_name
python uploader.py upload_blob /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__airports__source.json airports bbb

# python uploader.py upload_blob local_file_path cname blob_name
python uploader.py upload_blob /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__countries__source.json countries bbb

# python uploader.py upload_blob local_file_path cname blob_name
python uploader.py upload_blob /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__planes__source.json planes bbb

# python uploader.py upload_blob local_file_path cname blob_name
python uploader.py upload_blob /Users/cjoakim/github/azure-m2c-wgm/reference_app/data/openflights/mongoexports/openflights__routes__source.json routes bbb


echo 'done'
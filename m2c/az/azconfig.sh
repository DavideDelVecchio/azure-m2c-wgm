#!/bin/bash

# Bash shell that defines parameters and environment variables used in
# this app, and is "sourced" by the other scripts in this directory.
# Chris Joakim, Microsoft, 2021/06/08

# environment variables for provisioning:

export subscription=$AZURE_SUBSCRIPTION_ID
export user=$USER
export primary_region="eastus"
export primary_rg="cjoakimm2c"

# adf1 is intended to be the "production" ADF with git integration
# adf2 is intended to be the "ad-hoc, exploration" ADF with no git integration
export adf_region=$primary_region
export adf_rg=$primary_rg
export adf1_name="cjoakimm2cadf1"
export adf2_name="cjoakimm2cadf2"
#
export cosmos_mongo_region=$primary_region
export cosmos_mongo_rg=$primary_rg
export cosmos_mongo_acct_name="cjoakimm2ccosmosmongo"
export cosmos_mongo_acct_consistency="Session"    # {BoundedStaleness, ConsistentPrefix, Eventual, Session, Strong}
export cosmos_mongo_version="4.0"
#
export storage_region=$primary_region
export storage_rg=$primary_rg
export storage_name="cjoakimm2cstorage"
export storage_kind="BlobStorage"     # {BlobStorage, BlockBlobStorage, FileStorage, Storage, StorageV2}]
export storage_sku="Standard_LRS"     # {Premium_LRS, Premium_ZRS, Standard_GRS, Standard_GZRS, , Standard_RAGRS, Standard_RAGZRS, Standard_ZRS]
export storage_access_tier="Hot"      # Cool, Hot

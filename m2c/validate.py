"""
Usage:
    source env.sh ; python validate.py storage_containers
    source env.sh ; python validate.py raw_blobs
    source env.sh ; python validate.py wrangled_blobs
    source env.sh ; python validate.py target_cosmos_db
    source env.sh ; python validate.py adf_objects
    source env.sh ; python validate.py approx_source_to_target_doc_counts
    source env.sh ; python validate.py all
"""

__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "July 2021"

import json
import os
import subprocess
import sys
import traceback
import uuid

from operator import itemgetter
from pymongo import MongoClient

from pysrc.config import Config
from pysrc.manifest import Manifest
from storage import StorageUtil


class Validator(object):

    def __init__(self, args):
        self.args = args
        self.config = Config()
        self.manifest = Manifest()
        self.stor = StorageUtil()
        self.verbose = False
        for arg in args:
            if arg == '--verbose':
                self.verbose = True

    def validate_storage_containers(self):
        print('validate_storage_containers ...')
        actual_container_names = dict()
        actual_containers = self.stor.list_containers()
        for actual in actual_containers:
            name = actual['name']
            actual_container_names[name] = actual

        for expected_cname in self.manifest.storage_container_names():
            if expected_cname in actual_container_names.keys():
                print('OK, container present:   {}'.format(expected_cname))
            else:
                print('ERROR, container absent: {}'.format(expected_cname))

    def validate_raw_blobs(self):
        print('validate_raw_blobs ...')
        for item in self.manifest.items:
            container = item["raw_storage_container"]
            blob_name = item["blob_name"]
            try:
                properties = self.stor.blob_properties(container, blob_name)
                size = properties['size']
                print('OK, blob present; container: {} blob: {} size: {}'.format(
                    container, blob_name, size))
            except:
                print('ERROR, blob absent: {} {}'.format(container, blob_name))

    def validate_wrangled_blobs(self):
        print('validate_wrangled_blobs ...')
        for item in self.manifest.items:
            container = item["adf_storage_container"]
            blob_name = item["wrangled_blob_name"]
            try:
                properties = self.stor.blob_properties(container, blob_name)
                size = properties['size']
                print('OK, blob present; container: {} blob: {} size: {}'.format(
                    container, blob_name, size))
            except:
                print('ERROR, blob absent: {} {}'.format(container, blob_name))

    def validate_target_cosmos_db(self):
        print('validate_target_cosmos_db ...')
        conn_str = os.environ['M2C_COSMOS_MONGO_CONN_STRING']
        #print('conn_str: {}'.format(conn_str))

        client = MongoClient(conn_str)
        print('client: {}'.format(client))

        dbs = sorted(client.list_databases(), key = itemgetter('name'))
        for db_obj in dbs:        
            dbname = db_obj['name']
            print('dbname: {}'.format(dbname))
            db = client[dbname]
            coll_names = db.list_collection_names()
            db_metadata = dict()
            db_metadata['dbname'] = dbname
            db_metadata['collections'] = list() 

            for coll_name in sorted(coll_names):
                print('dbname: {}  coll: {}'.format(dbname, coll_name))
                coll_obj = db[coll_name]
       

    def validate_adf_objects(self):
        print('validate_adf_objects ...')

    def validate_approx_source_to_target_doc_counts(self):
        print('validate_approx_source_to_target_doc_counts ...')

    def print_exception(self, msg=None):
        print('*** exception in storage.py - {}'.format(msg))
        exc_type, exc_value, exc_traceback = sys.exc_info()
        print("*** traceback:")
        traceback.print_tb(exc_traceback, limit=2, file=sys.stderr)
        print("*** exception:")
        traceback.print_exception(
            exc_type, exc_value, exc_traceback, limit=2, file=sys.stderr)

    # Manifest items loOK like this:
    # {
    #   "source_db": "olympics",
    #   "source_coll": "countries",
    #   "doc_count": "230",
    #   "avg_doc_size": "69",
    #   "target_db": "olympics",
    #   "target_coll": "locations",
    #   "partition_key": "pk",
    #   "blob_name": "olympics__countries.json",
    #   "raw_storage_container": "olympics-raw",
    #   "adf_storage_container": "olympics-locations-adf",
    #   "adf_blob_doc_count": "-1",
    #   "adf_blob_dataset_name": "blob__olympics__locations",
    #   "adf_cosmos_dataset_name": "cosmos__olympics__locations",
    #   "adf_pipeline_name": "pipeline_copy_to_olympics_locations",
    #   "mongoexports_dir": "/Users/cjoakim/github/azure-m2c-wgm-reference-app/reference_app/data/mongoexports/olympics",
    #   "mongoexport_file": "/Users/cjoakim/github/azure-m2c-wgm-reference-app/reference_app/data/mongoexports/olympics/olympics__countries.json",
    #   "wrangle_script_name": "wrangle_olympics_countries.sh",
    #   "wrangled_outfile": "tmp/olympics/olympics__countries__wrangled.json",
    #   "local_file_path": "tmp/olympics/olympics__countries.json"
    # },

if __name__ == "__main__":
    #print(sys.argv)
    if len(sys.argv) > 1:
        func = sys.argv[1].lower()
        validator = Validator(sys.argv)

        if func == 'all':
            validator.validate_storage_containers()
            validator.validate_raw_blobs()
            validator.validate_wrangled_blobs()
            validator.validate_target_cosmos_db()
            validator.validate_adf_objects()
            validator.validate_approx_source_to_target_doc_counts()

        elif func == 'storage_containers':
            validator.validate_storage_containers()

        elif func == 'raw_blobs':
            validator.validate_raw_blobs()

        elif func == 'wrangled_blobs':
            validator.validate_wrangled_blobs()

        elif func == 'target_cosmos_db':
            validator.validate_target_cosmos_db()

        elif func == 'adf_objects':
            validator.validate_adf_objects()

        elif func == 'approx_source_to_target_doc_counts':
            validator.validate_approx_source_to_target_doc_counts()
        else:
            print_options('Error: invalid function: {}'.format(func))
    else:
            print_options('Error: no command-line args entered')

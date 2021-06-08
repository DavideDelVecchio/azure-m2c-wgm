__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021/06/07"

import json
import os
import pprint
import sys
import time
import uuid

import arrow
import jinja2

from operator import itemgetter
from pysrc.config import Config

# {
# "source_db": "olympics",
# "source_coll": "g1896_summer",
# "doc_count": "380",
# "avg_doc_size": "323",
# "target_db": "olympics",
# "target_coll": "games",
# "blob_name": "olympics__g1896_summer.json",
# "raw_storage_container": "olympics-raw",
# "adf_storage_container": "olympics-games-adf",
# "adf_blob_doc_count": "-1",
# "adf_blob_dataset_name": "blob__olympics__games",
# "adf_cosmos_dataset_name": "cosmos__olympics__games",
# "adf_pipeline_name": "pipeline_copy_to_olympics_games",
# "mongoexports_dir": "/Users/cjoakim/github/azure-m2c-wgm-reference-app/reference_app/data/mongoexports/olympics",
# "mongoexport_file": "/Users/cjoakim/github/azure-m2c-wgm-reference-app/reference_app/data/mongoexports/olympics/olympics__g1896_summer__source.json",
# "wrangle_script_name": "olympics_wrangle_g1896_summer.sh",
# "wrangled_outfile": "tmp/olympics/olympics__g1896_summer__wrangled.json"
# },

class Manifest(object):    

    def __init__(self):
        self.config = Config()
        infile = self.config.manifest_json_file()
        data   = self.load_json_file(infile)
        self.items = data['items']
        self.pipelines = data['pipelines']

    def source_database_names(self):
        uniques = dict()
        for item in self.items:
            db = item['source_db']
            uniques[db] = 0
        return sorted(uniques.keys())

    def target_database_names(self):
        uniques = dict()
        for item in self.items:
            db = item['target_db']
            uniques[db] = 0
        return sorted(uniques.keys())

    def storage_container_names(self):
        uniques = dict()
        for item in self.items:
            raw = item['raw_storage_container']
            adf = item['adf_storage_container']
            uniques[raw] = 0
            uniques[adf] = 0
        return sorted(uniques.keys())

    def adf_blob_datasets(self):
        datasets = dict()
        for item in self.items:
            name = item['adf_blob_dataset_name']
            datasets[name] = item['adf_storage_container']
        return datasets

    def cosmos_target_datasets(self):
        datasets = dict()
        for item in self.items:
            name = item['adf_cosmos_dataset_name']
            target_db = item['target_db']
            target_coll = item['target_coll']
            info = dict()
            info['dataset_name'] = name
            info['target_db']    = target_db
            info['target_coll']  = target_coll
            info['linked_svc']   = self.config.cosmos_linked_service_name(target_db)
            datasets[name] = info
        return datasets

    def items_for_source_db(self, source_db):
        db_items = list()
        for item in self.items:
            if item['source_db'] == source_db:
                db_items.append(item)
        return db_items

    def wrangle_script_names_for_source_db(self, source_db):
        uniques = dict()
        for item in self.items:
            if item['source_db'] == source_db:
                script = item['wrangle_script_name']
                uniques[script] = 0
        return sorted(uniques.keys())

    def cosmos_source_db_coll_tuples(self):
        uniques, tuples = dict(), list()
        for item in self.items:
            key = '{}:{}'.format(item['source_db'], item['source_coll'])
            uniques[key] = ( item['source_db'], item['source_coll'] )
        for key in sorted(uniques.keys()):
            tuples.append(uniques[key])
        return tuples

    def cosmos_target_db_coll_tuples(self):
        uniques, tuples = dict(), list()
        for item in self.items:
            key = '{}:{}'.format(item['target_db'], item['target_coll'])
            uniques[key] = ( item['target_db'], item['target_coll'] )
        for key in sorted(uniques.keys()):
            tuples.append(uniques[key])
        return tuples

    def get_pipelines(self):
        return self.pipelines
        
    def load_json_file(self, infile):
        with open(infile) as json_file:
            return json.load(json_file)

    def read_migrated_databases_list_file(self):
        infile = self.config.migrated_databases_list_file()
        databases = list()
        with open(infile, 'rt') as f:
            for line in f:
                stripped = line.strip()
                if stripped.startswith('#'):
                    pass
                else:
                    if len(stripped) > 0:
                        databases.append(stripped)
        return databases

    def write_obj_as_json_file(self, outfile, obj):
        txt = json.dumps(obj, sort_keys=False, indent=2)
        with open(outfile, 'wt') as f:
            f.write(txt)
        print("file written: " + outfile)

    def write(self, outfile, s, verbose=True):
        with open(outfile, 'w') as f:
            f.write(s)
            if verbose:
                print('file written: {}'.format(outfile))

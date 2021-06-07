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
#   "source_db": "olympics",
#   "source_coll": "countries",
#   "doc_count": "230",
#   "avg_doc_size": "69",
#   "target_db": "olympics",
#   "target_coll": "locations",
#   "raw_mongoexport_blob": "olympics-raw/olympics__countries__source.json",
#   "raw_blob_doc_count": "-1",
#   "wrangled_adf_blob": "olympics-adf/olympics__countries__wrangled.json",
#   "adf_blob_doc_count": "-1",
#   "adf_dataset_name": "blob__olympics__countries",
#   "adf_pipeline_name": "pipeline_copy_to_olympics_locations"
# },

class Manifest(object):    

    def __init__(self):
        self.config = Config()
        infile = self.config.manifest_json_file()
        self.items = self.load_json_file(infile)['items']

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

        # Returns a sorted list of tuples like this:
        # ('olympics', 'games')
        # ('olympics', 'locations')
        # ('travel', 'airlines')
        # ('travel', 'airports')
        # ('travel', 'countries')
        # ('travel', 'planes')
        # ('travel', 'routes')

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

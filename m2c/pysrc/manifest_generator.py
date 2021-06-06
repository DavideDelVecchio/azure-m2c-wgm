__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021/06/05"

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


class ManifestGenerator(object):    

    def __init__(self):
        self.config = Config()

    def generate_manifest_files(self):
        databases_list = self.read_migrated_databases_list_file()
        print('databases_list: {}'.format(databases_list))
        manifest_rows = list()
        columns = list()
        columns.append('Source DB')
        columns.append('Source Coll')
        columns.append('Doc Count')
        columns.append('Avg Doc Size')
        columns.append('Target DB')
        columns.append('Target Coll')
        columns.append('Raw mongoexport Blob')
        columns.append('Raw Blob Doc Count')
        columns.append('Wrangled ADF Blob')
        columns.append('ADF Blob Doc Count')
        columns.append('ADF Dataset Name')
        columns.append('ADF Pipeline Name')
        manifest_rows.append(','.join(columns))

        for dbname in sorted(databases_list):
            mappings = self.load_json_file(self.config.db_mapping_file(dbname))
            metadata = self.load_json_file(self.config.db_metadata_file(dbname))
            raw_blob_container = self.config.blob_raw_container_name(dbname)
            adf_blob_container = self.config.blob_adf_container_name(dbname)

            for coll in sorted(mappings['collections'], key = itemgetter('name')):
                coll_name   = coll['name']
                target_db   = coll['mapping']['target_dbname']
                target_coll = coll['mapping']['target_container']
                doc_count   = self.doc_count(metadata, coll_name)
                doc_size    = self.avg_doc_size(metadata, coll_name)
                local_file  = self.config.mongoexport_file(dbname, coll_name)
                raw_blob    = os.path.basename(local_file)
                adf_blob    = self.config.wrangled_file_name(dbname, coll_name)
                raw_blob_name = '{}/{}'.format(raw_blob_container, raw_blob)
                adf_blob_name = '{}/{}'.format(adf_blob_container, adf_blob)
                adf_dataset   = self.config.blob_dataset_name(dbname, coll_name)
                adf_pipeline  = self.config.adf_pipeline_name(target_db, target_coll) 

                row = '{},{},{},{},{},{},{},{},{},{},{},{}'.format(
                    dbname, coll_name, doc_count, doc_size, target_db, target_coll,
                    raw_blob_name, -1, adf_blob_name, -1, adf_dataset, adf_pipeline)
                manifest_rows.append(row)

        self.write(self.config.manifest_csv_file(), "\n".join(manifest_rows))
        self.save_manifest_as_json(columns, manifest_rows)

    def save_manifest_as_json(self, columns, manifest_rows):
        manifest, items = dict(), list()
        manifest['generated_on'] = self.config.timestamp()
        manifest['manifest'] = items

        for row in manifest_rows:
            item = dict()
            values = row.split(',')
            for idx, value in enumerate(values):
                attr_name = columns[idx].lower().replace(' ', '_').strip()
                item[attr_name] = value
            items.append(item)

        self.write_obj_as_json_file(self.config.manifest_json_file(), manifest)

    def doc_count(self, metadata, coll_name):
        try:
            for coll in metadata['collections']:
                if coll['name'] == coll_name:
                    return coll['metadata']['stats']['count']
            return -1
        except:
            return -1

    def avg_doc_size(self, metadata, coll_name):
        try:
            for coll in metadata['collections']:
                if coll['name'] == coll_name:
                    return coll['metadata']['stats']['avgObjSize']
            return -1
        except:
            return -1

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

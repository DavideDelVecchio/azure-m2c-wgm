"""
Usage:
    source env.sh ; python storage.py upload_blob local_file_path cname blob_name
"""

__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021.05.28"

import json
import os
import pprint
import sys
import time
import uuid

import arrow
import jinja2

from docopt import docopt
from operator import itemgetter
from pymongo import MongoClient

from pysrc.app_config import AppConfig
from pysrc.artifact_generator import ArtifactGenerator
from pysrc.storage import Storage

app_config = AppConfig()


def extract_db_metadata(conn_str, dbname):
    print('conn_str: {}'.format(conn_str))
    print('dbname:   {}'.format(dbname))

    client = MongoClient(conn_str)
    print('client: {}'.format(client))

    db = client[dbname]
    print('db: {}'.format(db))

    coll_names = db.list_collection_names()  # api for newer versions of mongo
    #coll_names = db.collection_names()        # deprecated in version 3.7.0

    db_metadata = dict()
    db_metadata['dbname'] = dbname
    db_metadata['utc_datetime'] = str(arrow.utcnow())
    db_metadata['collections'] = list() 

    for coll_name in coll_names:
        coll_obj = db[coll_name]
        coll_info = dict()
        coll_meta = dict()
        coll_info['name'] = coll_name 
        coll_info['metadata'] = coll_meta
        coll_meta['doc_count'] = coll_obj.count_documents({})
        coll_meta['indexes'] = list()

        for index in coll_obj.list_indexes():
            coll_meta['indexes'].append(index)
        cmd = { 'collStats' : coll_name, 'verbose' : False }
        stats = db.command(cmd)
        coll_meta['stats'] = prune_coll_stats(stats)
        db_metadata['collections'].append(coll_info)

    db_metadata['dbstats'] = db.command('dbstats')

    jstr = json.dumps(db_metadata, sort_keys=False, indent=2)
    outfile = app_config.db_metadata_file(dbname)
    write(outfile, jstr)

def prune_coll_stats(stats):
    exclude_keys = 'wiredTiger,indexDetails'.split(',')
    for key in exclude_keys:
        if key in stats.keys():
            del stats[key]
    return stats

def generate_mapping_file(dbname):
    print('generate_mapping_file; dbname {}'.format(dbname))
    infile = app_config.db_metadata_file(dbname)
    print('generate_mapping_file; infile:  {}'.format(infile))
    metadata = load_json_file(infile)
    data = dict()
    data['dbname'] = dbname
    coll_data = list()

    for coll in metadata['collections']:
        coll_info = dict()
        coll_info['name'] = coll['name']
        mapping = dict()
        mapping['target_db_container'] = 'ddd/ccc' 
        mapping['pk_attr_name'] = 'aaa' 
        mapping['pk_attr_logic'] = list()
        mapping['excludes'] = list()
        coll_info['mapping'] = mapping
        coll_data.append(coll_info)

    data['collections'] = sorted(coll_data, key = itemgetter('name'))

    jstr = json.dumps(data, sort_keys=False, indent=2)
    outfile = app_config.db_mapping_file(dbname)
    write(outfile, jstr)

def generate_artifacts(dbname):
    print('generate_artifacts {} {}'.format(dbname, sys.argv))
    infile = app_config.db_metadata_file(dbname)
    db_metadata = load_json_file(infile)
    generator = ArtifactGenerator(dbname, db_metadata)

    if (gen_artifact('--mongoexports')):
        generator.gen_mongoexports()

    if (gen_artifact('--blob-uploads')):
        generator.gen_blob_uploads() 

    if (gen_artifact('--file-wrangle-script')):
        generator.gen_aci_wrangle_script() 

    if (gen_artifact('--file-wrangle-script')):
        generator.gen_file_wrangle_script() 

    if (gen_artifact('--adf-datasets')):
        generator.gen_adf_datasets() 

    if (gen_artifact('--adf-pipelines')):
        generator.gen_adf_pipelines() 

def gen_artifact(name):
    for arg in sys.argv:
        if arg == '--all':
            return True
        elif arg == name:
            return True 
    return False 

def list_blob_containers():
    stor = Storage()
    containers = stor.list_containers()
    for idx, c in enumerate(containers):
        # print(str(type(c))) # <class 'azure.storage.blob._models.ContainerProperties'>
        print('{} {}'.format(idx + 1, c.name))

def create_blob_container(cname):
    print('create_blob_container; cname: {}'.format(cname))
    stor = Storage()
    stor.create_container(cname)

def delete_blob_container(cname):
    print('delete_blob_container; cname: {}'.format(cname))
    stor = Storage()
    stor.delete_container(cname)

def upload_blob(local_file_path, cname, blob_name):
    print('upload_blob; {} {} {}'.format(local_file_path, cname, blob_name))
    stor = Storage()
    stor.upload_blob(local_file_path, cname, blob_name)

def download_blob(cname, blob_name, local_file_path):
    print('download_blob; {} {} {}'.format(cname, blob_name, local_file_path))
    stor = Storage()
    stor.download_blob(cname, blob_name, local_file_path)


def load_json_file(infile):
    with open(infile) as json_file:
        return json.load(json_file)

def write_obj_as_json_file(outfile, obj):
    txt = json.dumps(obj, sort_keys=False, indent=2)
    with open(outfile, 'wt') as f:
        f.write(txt)
    print("file written: " + outfile)

def write(outfile, s, verbose=True):
    with open(outfile, 'w') as f:
        f.write(s)
        if verbose:
            print('file written: {}'.format(outfile))

def print_options(msg):
    print(msg)
    arguments = docopt(__doc__, version=__version__)
    print(arguments)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        func = sys.argv[1].lower()

        if func == 'extract_db_metadata':
            conn_str_env_var = sys.argv[2]
            dbname = sys.argv[3]
            extract_db_metadata(conn_str_env_var, dbname)

        elif func == 'generate_mapping_file':
            dbname = sys.argv[2]
            generate_mapping_file(dbname)

        elif func == 'generate_artifacts':
            dbname = sys.argv[2]
            generate_artifacts(dbname)

        elif func == 'list_blob_containers':
            list_blob_containers()

        elif func == 'create_blob_container':
            cname = sys.argv[2]
            create_blob_container(cname)

        elif func == 'delete_blob_container':
            cname = sys.argv[2]
            delete_blob_container(cname)

        elif func == 'upload_blob':
            print(len(sys.argv))
            local_file_path = sys.argv[2]
            cname = sys.argv[3]
            if len(sys.argv) > 4:
                blob_name = sys.argv[4]
            else:
                blob_name = os.path.basename(local_file_path) 
            upload_blob(local_file_path, cname, blob_name)

        elif func == 'download_blob':
            print(len(sys.argv))
            cname = sys.argv[2]
            blob_name = sys.argv[3]
            local_file_path = sys.argv[4]
            download_blob(cname, blob_name, local_file_path)

        else:
            print_options('Error: invalid function: {}'.format(func))
    else:
            print_options('Error: no command-line args entered')

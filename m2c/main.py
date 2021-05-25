"""
Usage:
    python main.py read_db_metadata <conn-str-env-var> <db-name>
    python main.py read_db_metadata localhost:27017 olympics
    python main.py read_db_metadata localhost:27017 openflights
    -
    python main.py generate_artifacts olympics --all
    python main.py generate_artifacts openflights --mongoexports
"""

__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021.05.25"

import json
import os
import pprint
import sys
import time
import uuid

import arrow
import jinja2

from docopt import docopt

from pymongo import MongoClient

from pysrc.generator import Generator

def db_metadata_file(dbname):
    data_dir = os.environ['M2C_ROOT_DATA_DIR']
    outdir = '{}/meta'.format(data_dir)
    ensure_directory_path(outdir)
    return '{}/{}_metadata.json'.format(outdir, dbname)

def ensure_directory_path(dir_path):
    try:
        if not os.path.exists(dir_path):
            os.makedirs(dir_path)
    except:
        pass

def read_db_metadata(conn_str, dbname):
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
        wrangling = dict()
        coll_info['name'] = coll_name 
        coll_info['wrangling'] = wrangling
        coll_info['metadata'] = coll_meta

        wrangling['pk_attr_name'] = 'pk' 
        wrangling['pk_attr_logic'] = list()
        wrangling['excludes'] = list()

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
    outfile = db_metadata_file(dbname)
    write(outfile, jstr)

def prune_coll_stats(stats):
    exclude_keys = 'wiredTiger,indexDetails'.split(',')
    for key in exclude_keys:
        if key in stats.keys():
            del stats[key]
    return stats

def gen_artifact(name):
    for arg in sys.argv:
        if arg == '--all':
            return True
        elif arg == name:
            return True 
    return False 

def generate_artifacts(dbname):
    print('generate_artifacts {} {}'.format(dbname, sys.argv))
    infile = db_metadata_file(dbname)
    db_metadata = load_json_file(infile)
    generator = Generator(dbname, db_metadata)

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
        if func == 'read_db_metadata':
            conn_str_env_var = sys.argv[2]
            dbname = sys.argv[3]
            read_db_metadata(conn_str_env_var, dbname)
        elif func == 'generate_artifacts':
            dbname = sys.argv[2]
            generate_artifacts(dbname)
        else:
            print_options('Error: invalid function: {}'.format(func))
    else:
            print_options('Error: no command-line args entered')

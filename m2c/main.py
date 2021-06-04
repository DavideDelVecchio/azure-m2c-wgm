"""
Usage:
    source env.sh ; python main.py extract_db_metadata <login-db> <db-name>
    source env.sh ; python main.py extract_db_metadata admin olympics
    source env.sh ; python main.py extract_db_metadata admin openflights
    -
    source env.sh ; python main.py generate_mapping_file olympics
    source env.sh ; python main.py generate_mapping_file openflights
    -
    source env.sh ; python main.py generate_artifacts olympics --all
    source env.sh ; python main.py generate_artifacts openflights --mongoexports
    -
    source env.sh ; python main.py generate_reference_db_scripts
"""

__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021/06/04"

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
from pysrc.standard_mapping_generator import StandardMappingGenerator

app_config = AppConfig()


def generate_initial_scripts():
    generator = ArtifactGenerator('', {})
    generator.generate_initial_scripts()

def extract_db_metadata(login_db, dbname):
    conn_str = app_config.pymongo_conn_string(login_db)  # login to the admin database
    print('dbname:   {}'.format(dbname))
    print('conn_str: {}'.format(conn_str))

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
    generator = StandardMappingGenerator(dbname)
    generator.generate()

def generate_artifacts(dbname):
    print('generate_artifacts {} {}'.format(dbname, sys.argv))
    infile = app_config.db_mapping_file(dbname)
    mapping_data = load_json_file(infile)
    generator = ArtifactGenerator(dbname, mapping_data)
    generator.generate()

def generate_reference_db_scripts():
    generator = ArtifactGenerator('', {})
    generator.generate_reference_db_scripts()

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
    #print(sys.argv)
    if len(sys.argv) > 1:
        func = sys.argv[1].lower()

        if func == 'generate_initial_scripts':
            generate_initial_scripts()

        elif func == 'extract_db_metadata':
            login_db = sys.argv[2]
            dbname = sys.argv[3]
            extract_db_metadata(login_db, dbname)

        elif func == 'generate_mapping_file':
            dbname = sys.argv[2]
            generate_mapping_file(dbname)

        elif func == 'generate_artifacts':
            dbname = sys.argv[2]
            generate_artifacts(dbname)

        elif func == 'generate_reference_db_scripts':
            generate_reference_db_scripts()
        else:
            print_options('Error: invalid function: {}'.format(func))
    else:
            print_options('Error: no command-line args entered')

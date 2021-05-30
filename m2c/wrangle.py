"""
This Python script reads a "source" mongoexport file and transforms it into
the format required for loading into the "target" database.

Usage:
    python wrangle_mongoexports.py transform <doctype> <infile> <outfile>
    python wrangle_mongoexports.py transform name_basics  data/mongo/name_basics_small_source.json  data/mongo/name_basics_small_target.json
    python wrangle_mongoexports.py transform title_basics data/mongo/title_basics_small_source.json data/mongo/title_basics_small_target.json
"""

__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com,christopher.joakim@gmail.com"
__license__ = "MIT"
__version__ = "2021.05.30"

import json
import os
import pprint
import sys
import time
import uuid

import arrow
from docopt import docopt
from os.path import abspath
from operator import itemgetter
from bson.objectid import ObjectId

from pysrc.app_config import AppConfig

def transform(doctype, infile, outfile):
    print('transform: {} -> {} -> {}'.format(doctype, infile, outfile))
    start_time = time.time()
    it = text_file_iterator(infile)

    with open(outfile, 'wt') as out:
        for i, line in enumerate(it):
            doc = json.loads(line)
            #del doc['_id']  # a new ObjectId will/can be generated in the target database

            # Reformatting logic; delete the _id, add pk, convert two attributes to arrays

            if doctype == 'name_basics':
                xform_name_basics(doc, doctype)
            elif doctype == 'title_basics':
                xform_title_basics(doc, doctype)
            else:
                pass  # no transformation needed

            out.write(json.dumps(doc))
            out.write("\n")

    print('doctype:  {}'.format(doctype))
    print('infile:   {}'.format(infile))
    print('outfile:  {}'.format(outfile))
    print('elapsed:  {}'.format(time.time() - start_time))

def xform_name_basics(doc, doctype):
    # add pk, convert two attributes to arrays
    doc['pk'] = doc['nconst']
    doc['doctype'] = doctype
    doc['primaryProfession'] = doc['primaryProfession'].split(',')
    doc['knownForTitles'] = doc['knownForTitles'].split(',')

def xform_title_basics(doc, doctype):
    doc['pk'] = doc['tconst']
    doc['doctype'] = doctype
    doc['genres'] = doc['genres'].split(',')

def text_file_iterator(infile):
    # return a line generator that can be iterated with iterate()
    with open(infile, 'rt') as f:
        for line in f:
            yield line.strip()

def print_options(msg):
    print(msg)
    arguments = docopt(__doc__, version=__version__)
    print(arguments)

def get_program_args():
    # get the program args from either the command-line or the CLI_ARGS
    # environment variable if running in a Docker container.
    args = list()
    if len(sys.argv) > 1:
        args = sys.argv
    else:
        cli_arg_str = os.environ['CLI_ARGS']
        print('CLI_ARGS: {}'.format(cli_arg_str))
        args = cli_arg_str.split()
    return args


if __name__ == "__main__":
    args = get_program_args()
    print('__main__ args: {}'.format(args))
    if len(args) > 0:
        func = args[1].lower()
        if func == 'transform':
            doctype = sys.argv[2]
            infile  = sys.argv[3]
            outfile = sys.argv[4]
            transform(doctype, infile, outfile)
        else:
            print_options('Error: invalid function: {}'.format(func))
    else:
            print_options('Error: no command-line args entered')

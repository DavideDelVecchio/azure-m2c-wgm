"""
This Python script reads a "source" mongoexport file and transforms it into
the format required for loading into the "target" database.

Usage:
    source env.sh ; python wrangle.py transform --db openflights --in-container openflights-raw --blobname openflights__airlines__source.json --out-container openflights-raw
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
import traceback
import uuid

import arrow
from docopt import docopt
from os.path import abspath
from operator import itemgetter
from bson.objectid import ObjectId

from pysrc.app_config import AppConfig
from storage import StorageUtil


class Transformer(object):

    def __init__(self, args):
        self.args = args
        self.app_config = AppConfig()
        self.stor = StorageUtil()
        self.infile = None
        self.status = 'constructor'
        self.messages = list()

        self.dbname   = self.cli_arg('--db')
        self.filename = self.cli_arg('--filename')
        self.outfile  = self.cli_arg('--outfile')
        self.out_container = self.cli_arg('--out-container')
        self.mappings = self.load_mappings()

        self.start_time = time.time()
        self.finish_time = 0
        self.verbose = self.flag_arg('--verbose')

        if self.dbname == None:
            raise Exception("Error: no --db specified")
        if self.filename == None:
            raise Exception("Error: no --filename specified")
        if self.outfile == None:
            raise Exception("Error: no --outfile specified")
        if self.out_container == None:
            raise Exception("Error: no --out-container specified")

    def transform(self):
        self.download_blob()
        self.transform_file()
        self.upload_transformed_blob()
        self.elapsed_time = time.time() - self.start_time
        self.status = 'completed'

    def download_blob(self):
        cname = self.cli_arg('--in-container') 
        bname = self.cli_arg('--blobname') 
        fname = self.cli_arg('--filename') 
        if (cname != None) and (bname != None):
            start = time.time()
            self.add_message('downloading {} at {} from {}'.format(self.filename, self.timestamp(), cname))
            self.stor.download_blob(cname, bname, self.filename)
            elapsed = time.time() - start
            self.add_message('downloaded  {} at {} in {}'.format(self.filename, self.timestamp(), elapsed))
        else:
            if (fname == None):
                raise Exception("Error: no --filename specified")
            else:
                self.filename = fname
                self.add_message('using local file {}'.format(self.filename))

    def transform_file(self):
        start = time.time()
        it = text_file_iterator(self.filename)
        line_count = 0

        with open(self.outfile, 'wt') as out:
            for i, line in enumerate(it):
                line_count = line_count + 1
                if self.verbose:
                    print(line)
                doc = json.loads(line)
                out.write(json.dumps(doc))
                out.write("\n")

        elapsed = time.time() - start
        self.add_message('transformed {} lines in {}'.format(
            line_count, elapsed))

    def upload_transformed_blob(self):
        bname = os.path.basename(self.outfile)
        start = time.time()
        self.add_message('uploading {} at {} to {}/{}'.format(
            self.filename, self.timestamp(), self.out_container, bname))
        self.stor.upload_blob(self.outfile, self.out_container, bname, overwrite=True)
        elapsed = time.time() - start
        self.add_message('uploaded {}/{} at {} in {}'.format(
            self.filename, bname, self.timestamp(), elapsed))

        properties = self.stor.blob_properties(self.out_container, bname)
        print(properties)

    def add_message(self, msg):
        self.messages.append(msg)

    def print_summary(self):
        print('-')
        print('SUMMARY for args: {}'.format(" ".join(self.args))) 
        print('  status:       {}'.format(self.status)) 
        print('  start_time:   {}'.format(self.start_time)) 
        print('  elapsed_time: {}'.format(self.elapsed_time))
        print('  verbose:      {}'.format(str(self.verbose).lower())) 
        print('  processing messages:') 
        for msg in self.messages:
            print('    {}'.format(msg))

    def cli_arg(self, flag):
        for idx, arg in enumerate(self.args):
            if arg == flag:
                return args[idx + 1]
        return None

    def flag_arg(self, flag):
        for idx, arg in enumerate(self.args):
            if arg == flag:
                return True
        return False

    def timestamp(self):
        return arrow.utcnow().format('YYYY-MM-DD HH:mm:ss UTC')

    def is_successful(self):
        return self.status == 'successful'

    def load_mappings(self):
        f = self.app_config.db_metadata_file(self.dbname)
        return self.load_json_file(f)

    def load_json_file(self, infile):
        with open(infile) as json_file:
            return json.load(json_file)

def transform_original(doctype, infile, outfile):
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
            # transform --db openflights --in-container openflights-raw --blobname openflights__airlines__source.json --out-container openflights-raw

            try:
                t = Transformer(args)
                t.transform()
                t.print_summary()
            except:
                t.print_summary()
                print("ERROR: TRANSFORMATION_FAILED for args {}".format(args))
                traceback.print_exc(file=sys.stdout)
        else:
            print_options('Error: invalid function: {}'.format(func))
    else:
            print_options('Error: no command-line args entered')

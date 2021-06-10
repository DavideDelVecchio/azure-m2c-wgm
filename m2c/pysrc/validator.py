__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "June 2021"

import os
import sys
import traceback
import uuid

from pysrc.config import Config
from pysrc.manifest import Manifest
from storage import StorageUtil


class Validator(object):

    def __init__(self, args):
        # The command-line args look like this:
        # python main.py validate --source-databases openflights olympics --presence all
        self.args = args
        self.source_databases = list()
        self.presence_validations = list()
        self.count_validations = list()  # TODO - implement later after presence
        in_databases, in_presence, in_counts = False, False, False

        # scan the cli args and set the above database and validation lists
        for arg in self.args:
            if arg.startswith('--'):
                if arg == '--source-databases':
                    in_databases = True
                    in_presence  = False
                    in_counts    = False
                    continue
                elif arg == '--presence':
                    in_databases = False
                    in_presence  = True
                    in_counts    = False
                    continue
                elif arg == '--counts':
                    in_databases = False
                    in_presence  = False
                    in_counts    = True
                    continue
                else:
                    in_databases = False
                    in_presence  = False
                    in_counts    = False
                    continue
            else:
                if in_databases == True:
                    self.source_databases.append(arg)
                elif in_presence == True:
                    self.presence_validations.append(arg)



        self.manifest = Manifest()

    def validate(self):
        print('validate:')
        print('  source databases:     {}'.format(self.source_databases))
        print('  presence_validations: {}'.format(self.presence_validations))
        try:
            for dbname in self.dbnames():
                if self.validate_db(dbname) == True:
                    if opts.has_key('--storage-containers'):
                        validate_storage_containers()
                    if opts.has_key('--mongoexport-blobs'):
                        validate_mongoexport_blobs()
                    if opts.has_key('-adf-blobs'):
                        validate_adf_blobs()
                    if opts.has_key('--cosmosdb-collections'):
                        validate_cosmosdb_collections()
                    if opts.has_key('--adf-datasets'):
                        validate_adf_datasets()
                    if opts.has_key('--adf-pipelines'):
                        validate_adf_pipelines()
        except:
            self.print_exception('validate {}'.format(self.args))

    def dbnames(self):
        return []

    def validate_db(self, dbname):
        return True

    def validate_storage_containers(self):
        pass

    def validate_mongoexport_blobs(self):
        pass

    def validate_adf_blobs(self):
        pass

    def validate_cosmosdb_collections(self):
        pass

    def validate_adf_datasets(self):
        pass

    def validate_adf_pipelines(self):
        pass

    def print_exception(self, msg=None):
        print('*** exception in storage.py - {}'.format(msg))
        exc_type, exc_value, exc_traceback = sys.exc_info()
        print("*** traceback:")
        traceback.print_tb(exc_traceback, limit=2, file=sys.stderr)
        print("*** exception:")
        traceback.print_exception(
            exc_type, exc_value, exc_traceback, limit=2, file=sys.stderr)

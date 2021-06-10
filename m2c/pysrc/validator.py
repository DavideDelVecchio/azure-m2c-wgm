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
        self.args = args
        self.manifest = Manifest()

    def validate(self):
        print('validate: {}'.format(self.args))
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

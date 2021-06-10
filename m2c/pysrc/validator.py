__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "June 2021"

# TODO - this class is not yet implemented, it is a work-in-progress

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
        # python main.py validate --source-databases openflights olympics --validations all
        self.args = args
        self.source_databases = list()
        self.validation_types = list()
        in_databases, in_validations = False, False
        self.manifest = Manifest()
        self.stor = StorageUtil()

        # scan the cli args and set the above database and validation lists
        for arg in self.args:
            if arg.startswith('--'):
                if arg == '--source-databases':
                    in_databases = True
                    in_validations = False
                    continue
                elif arg == '--validations':
                    in_databases = False
                    in_validations = True
                    continue
                else:
                    in_databases = False
                    in_presence  = False
                    continue
            else:
                if in_databases == True:
                    self.source_databases.append(arg)
                elif in_validations == True:
                    self.validation_types.append(arg)

    def validate(self):
        print('validate:')
        print('  source databases:     {}'.format(self.source_databases))
        print('  validation_types: {}'.format(self.validation_types))
        try:
            for source_db in self.source_databases:
                if self.do_validation('storage-containers'):
                    self.validate_storage_containers(source_db)
                if self.do_validation('mongoexport-blobs'):
                    self.validate_mongoexport_blobs(source_db)
                if self.do_validation('adf-blobs'):
                    self.validate_adf_blobs(source_db)
                if self.do_validation('adf-datasets'):
                    self.validate_adf_datasets(source_db)
                if self.do_validation('adf-pipelines'):
                    self.validate_adf_pipelines(source_db)
                if self.do_validation('cosmosdb-collections'):
                    self.validate_cosmosdb_collections(source_db)
        except:
            self.print_exception('validate {}'.format(self.args))

    def do_validation(self, validation_name):
        if 'all' in self.validation_types:
            return True
        else:
            return validation_name in self.validation_types

    def validate_storage_containers(self, source_db):
        actual_containers_dict = dict()
        for c in self.stor.list_containers():
            name = c.name
            actual_containers_dict[name] = 1
        actual_container_names = sorted(actual_containers_dict.keys())

        for container_name in self.manifest.storage_container_names():
            if container_name.startswith(source_db):
            exists = container_name in actual_container_names
            print('blob container: {}  exists: {}'.format(container_name, exists))

    def validate_mongoexport_blobs(self, source_db):
        pass

    def validate_adf_blobs(self, source_db):
        pass

    def validate_adf_datasets(self, source_db):
        print('TODO: implement validate_adf_datasets')
        # use the az cli

    def validate_adf_pipelines(self, source_db):
        print('TODO: implement validate_adf_pipelines')
        # use the az cli

    def validate_cosmosdb_collections(self, source_db):
        print('TODO: implement validate_cosmosdb_collections')
        # use pymongo

    def print_exception(self, msg=None):
        print('*** exception in storage.py - {}'.format(msg))
        exc_type, exc_value, exc_traceback = sys.exc_info()
        print("*** traceback:")
        traceback.print_tb(exc_traceback, limit=2, file=sys.stderr)
        print("*** exception:")
        traceback.print_exception(
            exc_type, exc_value, exc_traceback, limit=2, file=sys.stderr)

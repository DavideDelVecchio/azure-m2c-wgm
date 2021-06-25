"""
Usage:
    source env.sh ; python validate.py storage_containers
    source env.sh ; python validate.py raw_blobs
    source env.sh ; python validate.py wrangled_blobs
    source env.sh ; python validate.py target_cosmos_db
    source env.sh ; python validate.py adf_objects
    source env.sh ; python validate.py approx_source_to_target_doc_counts
    source env.sh ; python validate.py all
"""

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
        self.args = args
        self.manifest = Manifest()
        self.stor = StorageUtil()

    def validate_storage_containers(self):
        print('validate_storage_containers ...')
        actual_container_names = dict()
        actual_containers = self.stor.list_containers()
        for actual in actual_containers:
            name = actual['name']
            actual_container_names[name] = actual

        for expected_cname in self.manifest.storage_container_names():
            if expected_cname in actual_container_names.keys():
                print('ok, container present:   {}'.format(expected_cname))
            else:
                print('error, container absent: {}'.format(expected_cname))

    def validate_raw_blobs(self):
        print('validate_raw_blobs ...')

    def validate_wrangled_blobs(self):
        print('validate_wrangled_blobs ...')

    def validate_target_cosmos_db(self):
        print('validate_target_cosmos_db ...')

    def validate_adf_objects(self):
        print('validate_adf_objects ...')

    def validate_approx_source_to_target_doc_counts(self):
        print('validate_approx_source_to_target_doc_counts ...')

    def print_exception(self, msg=None):
        print('*** exception in storage.py - {}'.format(msg))
        exc_type, exc_value, exc_traceback = sys.exc_info()
        print("*** traceback:")
        traceback.print_tb(exc_traceback, limit=2, file=sys.stderr)
        print("*** exception:")
        traceback.print_exception(
            exc_type, exc_value, exc_traceback, limit=2, file=sys.stderr)


if __name__ == "__main__":
    #print(sys.argv)
    if len(sys.argv) > 1:
        func = sys.argv[1].lower()
        validator = Validator(sys.argv)

        if func == 'all':
            validator.validate_storage_containers()
            validator.validate_raw_blobs()
            validator.validate_wrangled_blobs()
            validator.validate_target_cosmos_db()
            validator.validate_adf_objects()
            validator.validate_approx_source_to_target_doc_counts()

        elif func == 'storage_containers':
            validator.validate_storage_containers()

        elif func == 'raw_blobs':
            validator.validate_raw_blobs()

        elif func == 'wrangled_blobs':
            validator.validate_wrangled_blobs()

        elif func == 'target_cosmos_db':
            validator.validate_target_cosmos_db()

        elif func == 'adf_objects':
            validator.validate_adf_objects()

        elif func == 'approx_source_to_target_doc_counts':
            validator.validate_approx_source_to_target_doc_counts()
        else:
            print_options('Error: invalid function: {}'.format(func))
    else:
            print_options('Error: no command-line args entered')

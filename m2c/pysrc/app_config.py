__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021.05.28"

import os
import sys
import traceback
import uuid


class AppConfig(object):

    def __init__(self):
        pass

    def db_metadata_file(self, dbname):
        data_dir = os.environ['M2C_ROOT_DATA_DIR']
        outdir = '{}/meta'.format(data_dir)
        self.ensure_directory_path(outdir)
        return '{}/{}_metadata.json'.format(outdir, dbname)

    def db_mapping_file(self, dbname):
        data_dir = os.environ['M2C_ROOT_DATA_DIR']
        outdir = '{}/meta'.format(data_dir)
        self.ensure_directory_path(outdir)
        return '{}/{}_mapping.json'.format(outdir, dbname)

    def ensure_directory_path(self, dir_path):
        try:
            if not os.path.exists(dir_path):
                os.makedirs(dir_path)
        except:
            pass

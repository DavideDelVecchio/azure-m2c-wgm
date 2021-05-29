__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021.05.28"

import arrow
import glob
import os
import sys
import traceback
import uuid


class AppConfig(object):

    def __init__(self):
        self.shell_type        = self.env_var('M2C_SHELL_TYPE', 'bash')
        self.ssl               = self.boolean_env_var('M2C_SOURCE_MONGODB_SSL', True)
        self.artifacts_dir     = self.env_var('M2C_ROOT_ARTIFACTS_DIR', 'artifacts')
        self.data_dir          = self.env_var('M2C_ROOT_DATA_DIR', 'data')  # reference_app/data
        self.blob_linked_svc   = self.env_var('M2C_ADF_BLOB_LINKED_SERVICE_NAME', 'MigrationBlobStorage')
        self.cosmos_linked_svc = self.env_var('M2C_ADF_COSMOS_LINKED_SERVICE', 'MigrationCosmosDB')

    def metadata_dir(self):
        return '{}/metadata'.format(self.data_dir)

    def metadata_files(self):
        pattern = '{}/*_metadata.json'.format(self.metadata_dir())
        return glob.glob(pattern)

    def db_metadata_file(self, dbname):
        outdir = self.metadata_dir()
        self.ensure_directory_path(outdir)
        return '{}/{}_metadata.json'.format(outdir, dbname)

    def db_mapping_file(self, dbname):
        outdir = self.metadata_dir()
        self.ensure_directory_path(outdir)
        return '{}/{}_mapping.json'.format(outdir, dbname)

    def mongoexports_dir(self, dbname):
        return '{}/{}/mongoexports'.format(self.data_dir, dbname)

    def mongoexport_file(self, dbname, cname):
        return '{}/{}/mongoexports/{}__{}__source.json'.format(
            self.data_dir, dbname, dbname, cname)

    def artifact_dir(self, artifact_type):
        return '{}/{}'.format(self.artifacts_dir, artifact_type)

    def ensure_directory_path(self, dir_path):
        try:
            if not os.path.exists(dir_path):
                os.makedirs(dir_path)
                return 'created'
            else:
                return 'exists'
        except:
            return 'except'

    def timestamp(self):
        return arrow.utcnow().format('YYYY-MM-DD HH:mm:ss UTC')

    def env_var(self, name, default_value=''):
        try:
            return os.environ[name]
        except:
            return default_value

    def boolean_env_var(self, name, default_value):
        try:
            v = os.environ[name].lower()
            if (v.lower() == 'true') or (v.lower() == 't'):
                return True
            return False
        except:
            return default_value

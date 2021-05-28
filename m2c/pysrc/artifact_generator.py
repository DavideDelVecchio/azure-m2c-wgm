__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021.05.28"

import json
import os
import pprint
import sys
import time
import uuid

import arrow
import jinja2


class ArtifactGenerator(object):    

    def __init__(self, dbname, db_metadata):
        self.dbname = dbname
        self.db_metadata = db_metadata
        self.collections = db_metadata['collections']
        self.shell_type = self.env_var('M2C_SHELL_TYPE', 'bash')
        self.ssl = self.boolean_env_var('M2C_SOURCE_MONGODB_SSL', True)
        self.artifacts_dir = self.env_var('M2C_ROOT_ARTIFACTS_DIR', 'artifacts')
        self.data_dir = self.env_var('M2C_ROOT_DATA_DIR', 'data')
        self.blob_linked_service = self.env_var('M2C_ADF_BLOB_LINKED_SERVICE_NAME', 'MigrationBlobStorage')
        self.cosmos_linked_service = self.env_var('M2C_ADF_COSMOS_LINKED_SERVICE', 'MigrationCosmosDB')

    # public methods

    def gen_mongoexports(self):
        print('gen_mongoexports')
        script_lines = self._shell_script_lines()
        template_name = 'mongoexport_script_ssl_{}.txt'.format(self.ssl).lower()
        print('template_name: {}'.format(template_name))

        outdata_dir = '{}/{}/mongoexports'.format(self.data_dir, self.dbname)
        self._ensure_directory_path(outdata_dir)

        template_data = dict()
        template_data['dbname'] = self.dbname
        template_data['gen_timestamp'] = self._timestamp()
        template_data['collections'] = self.collections
        template_data['outdir'] = outdata_dir

        t = self._get_template(os.getcwd(), template_name)
        s = t.render(template_data)

        artifact_dir = '{}/{}'.format(self.artifacts_dir, 'shell')
        self._ensure_directory_path(artifact_dir)

        outfile = '{}/{}_mongoexports.sh'.format(artifact_dir, self.dbname)
        self._write(outfile, s)

    def gen_blob_uploads(self):
        print('gen_blob_uploads - not yet implemented')

    def gen_aci_wrangle_script(self):
        print('gen_aci_wrangle_script - not yet implemented')

    def gen_file_wrangle_script(self):
        print('gen_file_wrangle_script - not yet implemented')

    def gen_adf_datasets(self):
        print('gen_adf_datasets')

        outdata_dir = '{}/adf'.format(self.data_dir, self.dbname)
        self._ensure_directory_path(outdata_dir)

        for coll in self.collections:
            coll_name = coll['name']
            dataset_name = '{}__{}__mongoexport.json'.format(self.dbname, coll_name)
            blob_name    = '{}__mongoexport.json'.format(coll_name)

            template_data = dict()
            template_data['dataset_name'] = dataset_name
            template_data['blob_linked_service'] = self.blob_linked_service
            template_data['blob_name'] = blob_name
            template_data['blob_container'] = self.dbname

            t = self._get_template(os.getcwd(), 'adf_copy_input_blob_dataset.txt')
            s = t.render(template_data)

            dataset_dir = '{}/{}'.format(self.artifacts_dir, 'adf')
            self._ensure_directory_path(dataset_dir)

            outfile = '{}/{}'.format(dataset_dir, dataset_name)
            self._write(outfile, s)

    def gen_adf_pipelines(self):
        print('gen_adf_pipelines - not yet implemented')



# def generate_scripts(dbname):
#     print('generate_scripts, dbname: {}'.format(dbname))
#     infile = 'data/meta/{}_metadata.json'.format(dbname)
#     metadata = read_json(infile)
#     metadata['gen_timestamp'] = arrow.utcnow().to('US/Eastern').format('YYYY-MM-DD HH:mm:ss ')

#     t = get_template(os.getcwd(), 'mongoexport_script.sh')
#     s = t.render(metadata)
#     outfile = 'generated/{}_db_mongoexport.sh'.format(dbname)
#     write(outfile, s)

#     t = get_template(os.getcwd(), 'transform_script.sh')
#     s = t.render(metadata)
#     outfile = 'generated/{}_db_transform.sh'.format(dbname)
#     write(outfile, s)

    # private methods

    def _shell_script_lines(self):
        lines = list()
        if self.shell_type == 'bash':
            lines.append('#!/bin/bash')
            lines.append('')
            lines.append('# generated on: {}'.format(self._timestamp()))
            lines.append('')
        else:
            lines.append('')
            lines.append('# generated on: {}'.format(self._timestamp()))
            lines.append('')

    def _timestamp(self):
        return arrow.utcnow().format('YYYY-MM-DD HH:mm:ss UTC')

    def env_var(self, name, default_value=''):
        try:
            return os.environ[name]
        except:
            return default_value

    def boolean_env_var(self, name, default_value):
        try:
            v = os.environ[name].lower()
            if v == 'true':
                return True
            return False
        except:
            return default_value

    def _source_collection_names(self):
        names = list()
        for coll in self.collections:
            names.append(coll['name'])
        return names

    def _get_template(self, root_dir, name):
        filename = 'templates/{}'.format(name)
        return self._get_jinja2_env(root_dir).get_template(filename)

    def _render(self, template, values):
        return template.render(values)

    def _get_jinja2_env(self, root_dir):
        return jinja2.Environment(
            loader = jinja2.FileSystemLoader(
                root_dir), autoescape=True)

    def _load_json_file(self, infile):
        with open(infile) as json_file:
            return json.load(json_file)

    def _ensure_directory_path(self, dir_path):
        try:
            if not os.path.exists(dir_path):
                os.makedirs(dir_path)
        except:
            pass

    def _write_obj_as_json_file(self, outfile, obj):
        txt = json.dumps(obj, sort_keys=False, indent=2)
        with open(outfile, 'wt') as f:
            f.write(txt)
        print("file written: " + outfile)

    def _write(self, outfile, s, verbose=True):
        with open(outfile, 'w') as f:
            f.write(s)
            if verbose:
                print('file written: {}'.format(outfile))

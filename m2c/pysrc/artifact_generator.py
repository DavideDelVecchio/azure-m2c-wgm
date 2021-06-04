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

from operator import itemgetter
from pysrc.app_config import AppConfig

# Class ArtifactGenerator is used to generate all script and code
# artifacts in this application, by using the extracted source database
# metadata as well as a customer-edited mapping file.

class ArtifactGenerator(object):    

    def __init__(self, dbname, mapping_data):
        self.dbname = dbname
        self.mapping_data = mapping_data
        if 'collections' in mapping_data.keys():
            self.collections = mapping_data['collections']

        self.app_config = AppConfig()
        self.shell_type          = self.app_config.shell_type
        self.ssl                 = self.app_config.ssl
        self.artifacts_dir       = self.app_config.artifacts_dir
        self.adf_artifacts_dir   = self.app_config.artifact_dir('adf')
        self.shell_artifacts_dir = self.app_config.artifact_dir('shell')
        self.mongoexports_dir    = self.app_config.mongoexports_dir(dbname)
        self.data_dir            = self.app_config.data_dir
        self.blob_linked_svc     = self.app_config.blob_linked_svc
        self.cosmos_linked_svc   = self.app_config.cosmos_linked_svc

    def generate_initial_scripts(self):
        print('generate_initial_scripts') 
        databases_list = self.read_migrated_databases_list_file()
        print('databases_list: {}'.format(databases_list))

        template_data = dict()
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py generate_initial_scripts()'
        template_data['databases'] = databases_list

        self.generate_extract_metadata_script(template_data)
        self.generate_generate_mapping_files_script(template_data)
        self.generate_generate_artifacts_script(template_data)

    def generate_extract_metadata_script(self, template_data):
        template = 'extract_metadata.txt'
        t = self.get_template(os.getcwd(), template)
        s = t.render(template_data)
        self.write('extract_metadata.sh', s)

    def generate_generate_mapping_files_script(self, template_data):
        template = 'generate_mapping_files.txt'
        t = self.get_template(os.getcwd(), template)
        s = t.render(template_data)
        self.write('generate_mapping_files.sh', s)

    def generate_generate_artifacts_script(self, template_data):
        template = 'generate_artifacts.txt'
        t = self.get_template(os.getcwd(), template)
        s = t.render(template_data)
        self.write('generate_artifacts.sh', s)

    def generate(self):
        if (self.gen_artifact('--mongoexports')):
            self.gen_mongoexports()

        if (self.gen_artifact('--create-containers')):
            self.gen_python_create_containers() 

        if (self.gen_artifact('--py-uploads')):
            self.gen_python_uploads() 

        if (self.gen_artifact('--az-cli-uploads')):
            self.gen_az_cli_uploads() 

        if (self.gen_artifact('--wrangle-scripts-for-db')):
            self.gen_wrangle_scripts_for_db() 

        if (self.gen_artifact('--wrangle-scripts-individual')):
            self.gen_wrangle_scripts_individual() 

        if (self.gen_artifact('--adf-linked-services')):
            self.gen_adf_linked_services() 

        if (self.gen_artifact('--adf-datasets')):
            self.gen_adf_datasets() 

        if (self.gen_artifact('--adf-pipelines')):
            self.gen_adf_pipelines() 

    def gen_artifact(self, name):
        for arg in sys.argv:
            if arg == '--all':
                return True
            elif arg == name:
                return True 
        return False 

    def gen_mongoexports(self):
        #script_lines = self.shell_script_lines()
        self.ensure_directory_path(self.mongoexports_dir)
        self.ensure_directory_path(self.shell_artifacts_dir)
        template = 'mongoexport_script.txt'
        template_data = dict()
        template_data['dbname'] = self.dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py gen_mongoexports()'
        template_data['uri']  = 'mongodb://@{}:{}'.format(
            self.app_config.source_mongodb_host, self.app_config.source_mongodb_port)
        template_data['url']  = self.app_config.source_mongodb_url
        template_data['host'] = self.app_config.source_mongodb_host 
        template_data['post'] = self.app_config.source_mongodb_port
        template_data['user'] = self.app_config.source_mongodb_user 
        template_data['pass'] = self.app_config.source_mongodb_pass
        template_data['ssl']  = ' # no --ssl' # self.app_config.source_mongodb_ssl 
        template_data['collections'] = self.collections
        template_data['outdir'] = self.mongoexports_dir

        t = self.get_template(os.getcwd(), template)
        s = t.render(template_data)
        outfile = '{}/{}_mongoexports.sh'.format(self.shell_artifacts_dir, self.dbname)
        self.write(outfile, s)

    def gen_python_create_containers(self):
        metadata_files = self.app_config.metadata_files()
        template_data = dict()
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py gen_python_create_containers()'

        container_names = list()
        for metadata_file in metadata_files:
            meta = self.load_json_file(metadata_file)
            dbname = meta['dbname']
            container_names.append('{}-raw'.format(dbname))
            container_names.append('{}-adf'.format(dbname))
        template_data['container_names'] = container_names

        t = self.get_template(os.getcwd(), 'create_blob_containers.txt')
        s = t.render(template_data)
        self.ensure_directory_path(self.shell_artifacts_dir)
        outfile = '{}/python_create_containers.sh'.format(self.shell_artifacts_dir)
        self.write(outfile, s)

    def gen_python_uploads(self):
        mongoexports_dir = self.app_config.mongoexports_dir(self.dbname)
        template = 'blob_uploads_python.txt'
        template_data = dict()
        collection_data = list()
        template_data['dbname'] = self.dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py gen_python_uploads()'
        template_data['collections'] = collection_data
        template_data['container'] = '{}-raw'.format(self.dbname)

        for c in self.collections:
            cname = c['name']
            local_file = self.app_config.mongoexport_file(self.dbname, cname)
            coll_dict = dict()
            coll_dict['local_file_path'] = local_file
            coll_dict['blob_name'] = os.path.basename(local_file)
            collection_data.append(coll_dict)

        t = self.get_template(os.getcwd(), template)
        s = t.render(template_data)

        self.ensure_directory_path(self.shell_artifacts_dir)

        outfile = '{}/{}_python_mongoexport_uploads.sh'.format(self.shell_artifacts_dir, self.dbname)
        self.write(outfile, s)

        for tname in 'env.sh,pyenv.sh,storage.py,requirements.in,requirements.txt'.split(','):
            t = self.get_template(os.getcwd(), tname)
            s = t.render(template_data)
            outfile = '{}/{}'.format(self.shell_artifacts_dir, tname)
            self.write(outfile, s)

    def gen_az_cli_uploads(self):
        mongoexports_dir = self.app_config.mongoexports_dir(self.dbname)
        template = 'blob_uploads_az_cli.txt'
        template_data = dict()
        collection_data = list()
        template_data['dbname'] = self.dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py gen_az_cli_uploads()'
        template_data['collections'] = collection_data
        template_data['container'] = '{}-raw'.format(self.dbname)

        for c in self.collections:
            cname = c['name']
            local_file = self.app_config.mongoexport_file(self.dbname, cname)
            coll_dict = dict()
            coll_dict['local_file_path'] = local_file
            coll_dict['blob_name'] = os.path.basename(local_file)
            collection_data.append(coll_dict)

        t = self.get_template(os.getcwd(), template)
        s = t.render(template_data)

        self.ensure_directory_path(self.shell_artifacts_dir)

        outfile = '{}/{}_az_cli_mongoexport_uploads.sh'.format(self.shell_artifacts_dir, self.dbname)
        self.write(outfile, s)

    def gen_wrangle_scripts_for_db(self):
        mongoexports_dir = self.app_config.mongoexports_dir(self.dbname)
        template = 'wrangle_all.txt'
        template_data = dict()
        collection_data = list()
        template_data['dbname'] = self.dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py gen_wrangle_scripts_for_db()'
        template_data['collections'] = collection_data
        template_data['container'] = '{}-raw'.format(self.dbname)

        for c in self.collections:
            cname = c['name']
            script_basename = self.app_config.wrangle_script_basename(self.dbname, cname)
            coll_dict = dict()
            # openflights_wrangle_openflights__routes__source.json.sh
            blob_name = self.app_config.blob_name(self.dbname, cname)
            script_name = '{}_wrangle_{}.sh'.format(
                self.dbname, blob_name)
            coll_dict['blob_name'] = blob_name
            coll_dict['script_name'] = script_name
            collection_data.append(coll_dict)

        t = self.get_template(os.getcwd(), template)
        s = t.render(template_data)
        self.ensure_directory_path(self.shell_artifacts_dir)
        outfile = '{}/{}_wrangle_all.sh'.format(self.shell_artifacts_dir, self.dbname)
        self.write(outfile, s)

    def gen_wrangle_scripts_individual(self):
        mongoexports_dir = self.app_config.mongoexports_dir(self.dbname)
        template = 'wrangle_one.txt'

        for c in self.collections:
            template_data = dict()
            collection_data = list()
            template_data['dbname'] = self.dbname
            template_data['gen_timestamp'] = self.timestamp()
            template_data['gen_by'] = 'artifact_generator.py gen_wrangle_scripts_individual()'
            template_data['collections'] = collection_data
            template_data['container'] = '{}-raw'.format(self.dbname)
            cname = c['name']
            script_basename = self.app_config.wrangle_script_basename(
                self.dbname, cname)
            blob_name = self.app_config.blob_name(self.dbname, cname)
            local_file_path = self.app_config.wrangling_blob_download_file(
                self.dbname, cname)
            wrangled_outfile_path = self.app_config.wrangled_outfile(
                self.dbname, cname)
            outfile = '{}/{}_wrangle_{}.sh'.format(
                self.shell_artifacts_dir, self.dbname, blob_name)
            redirect = 'out/{}/wrangle_{}.out'.format(self.dbname, blob_name)

            template_data['cname'] = cname
            template_data['blob_name'] = blob_name
            template_data['local_file_path'] = local_file_path
            template_data['wrangled_outfile_path'] = wrangled_outfile_path
            template_data['script_basename'] = script_basename
            template_data['redirect'] = redirect

            t = self.get_template(os.getcwd(), template)
            s = t.render(template_data)
            self.ensure_directory_path(self.shell_artifacts_dir)

            self.write(outfile, s)

    def gen_adf_linked_services(self):
        outdata_dir = '{}/adf/linkedService'.format(self.data_dir, self.dbname)
        self.ensure_directory_path(outdata_dir)


    def gen_adf_datasets(self):
        outdata_dir = '{}/adf/dataset'.format(self.data_dir, self.dbname)
        self.ensure_directory_path(outdata_dir)

        for coll in self.collections:
            coll_name = coll['name']
            dataset_name = '{}__{}__mongoexport.json'.format(self.dbname, coll_name)
            blob_name    = '{}__mongoexport.json'.format(coll_name)

            template_data = dict()
            template_data['dataset_name'] = dataset_name
            template_data['blob_linked_svc'] = self.blob_linked_svc
            template_data['blob_name'] = blob_name
            template_data['blob_container'] = self.dbname

            t = self.get_template(os.getcwd(), 'adf_copy_input_blob_dataset.txt')
            s = t.render(template_data)

            dataset_dir = '{}/{}'.format(self.artifacts_dir, 'adf')
            self.ensure_directory_path(dataset_dir)

            outfile = '{}/{}'.format(dataset_dir, dataset_name)
            self.write(outfile, s)

    def gen_adf_pipelines(self):
        outdata_dir = '{}/adf/pipeline'.format(self.data_dir, self.dbname)
        self.ensure_directory_path(outdata_dir)

    def generate_reference_db_scripts(self):
        self.generate_openflights_reference_db_scripts()
        self.generate_olympics_reference_db_scripts()

    def generate_openflights_reference_db_scripts(self):
        dbname = 'openflights'
        template = 'mongo_recreate_db.txt'
        template_data = dict()
        template_data['dbname'] = dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py generate_openflights_reference_db_scripts()'
        template_data['uri']  = 'mongodb://@{}:{}'.format(
            self.app_config.source_mongodb_host, self.app_config.source_mongodb_port)
        template_data['url']  = self.app_config.source_mongodb_url
        template_data['host'] = self.app_config.source_mongodb_host 
        template_data['post'] = self.app_config.source_mongodb_port
        template_data['user'] = self.app_config.source_mongodb_user 
        template_data['pass'] = self.app_config.source_mongodb_pass
        template_data['ssl']  = ' # no --ssl' # self.app_config.source_mongodb_ssl 
        coll_names = self.openflights_collection_names()
        coll_list = list()
        for coll_name in coll_names:
            coll_info = dict()
            coll_info['name'] = coll_name
            coll_info['infile'] = '{}.json'.format(coll_name)
            coll_list.append(coll_info)
        template_data['collections'] = sorted(coll_list, key = itemgetter('name'))

        t = self.get_template(os.getcwd(), template)
        s = t.render(template_data)
        outfile = '{}/databases/mongo_recreate_{}_db.sh'.format(
            self.app_config.app_dir, dbname)
        self.write(outfile, s)

    def openflights_collection_names(self):
        return 'airports,airlines,routes,planes,countries'.split(',')

    def generate_olympics_reference_db_scripts(self):
        dbname = 'olympics'
        template = 'mongo_recreate_db.txt'
        template_data = dict()
        template_data['dbname'] = dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py generate_olympics_reference_db_scripts()'
        template_data['uri']  = self.app_config.source_mongodb_uri()
        template_data['url']  = self.app_config.source_mongodb_url
        template_data['host'] = self.app_config.source_mongodb_host 
        template_data['post'] = self.app_config.source_mongodb_port
        template_data['user'] = self.app_config.source_mongodb_user 
        template_data['pass'] = self.app_config.source_mongodb_pass
        template_data['ssl']  = ' # no --ssl' # self.app_config.source_mongodb_ssl 
        coll_names = self.olympics_collection_names()
        coll_list = list()
        for coll_name in coll_names:
            coll_info = dict()
            coll_info['name'] = coll_name
            coll_info['infile'] = '{}.json'.format(coll_name)
            coll_list.append(coll_info)
        template_data['collections'] = sorted(coll_list, key = itemgetter('name'))

        t = self.get_template(os.getcwd(), template)
        s = t.render(template_data)
        outfile = '{}/databases/mongo_recreate_{}_db.sh'.format(
            self.app_config.app_dir, dbname)
        self.write(outfile, s)

    def olympics_collection_names(self):
        names = list()
        names.append('countries')
        names.append('games')
        infile = '../reference_app/databases/olympics/import_json/games.json'

        with open(infile, 'r') as f:
            lines = f.readlines()
            for line in lines:  # {"games":"1896_summer","city":"athina"}
                doc = json.loads(line.strip())
                cname = 'g{}'.format(doc['games'])
                names.append(cname)
        return names

    # standard private methods

    def shell_script_lines(self):
        lines = list()
        if self.shell_type == 'bash':
            lines.append('#!/bin/bash')
            lines.append('')
            lines.append('# generated on: {}'.format(self.timestamp()))
            lines.append('')
        else:
            lines.append('')
            lines.append('# generated on: {}'.format(self.timestamp()))
            lines.append('')

    def timestamp(self):
        return arrow.utcnow().format('YYYY-MM-DD HH:mm:ss UTC')

    def env_var(self, name, default_value=''):
        try:
            return os.environ[name]
        except:
            return default_value

    def _source_collection_names(self):
        names = list()
        for coll in self.collections:
            names.append(coll['name'])
        return names

    def get_template(self, root_dir, name):
        filename = 'templates/{}'.format(name)
        return self.get_jinja2_env(root_dir).get_template(filename)

    def render(self, template, values):
        return template.render(values)

    def get_jinja2_env(self, root_dir):
        return jinja2.Environment(
            loader = jinja2.FileSystemLoader(
                root_dir), autoescape=True)

    def load_json_file(self, infile):
        with open(infile) as json_file:
            return json.load(json_file)

    def ensure_directory_path(self, dir_path):
        try:
            if not os.path.exists(dir_path):
                os.makedirs(dir_path)
        except:
            pass

    def write_obj_as_json_file(self, outfile, obj):
        txt = json.dumps(obj, sort_keys=False, indent=2)
        with open(outfile, 'wt') as f:
            f.write(txt)
        print("file written: " + outfile)

    def write(self, outfile, s, verbose=True):
        with open(outfile, 'w') as f:
            f.write(s)
            if verbose:
                print('file written: {}'.format(outfile))

    def read_migrated_databases_list_file(self):
        infile = self.app_config.migrated_databases_list_file()
        databases = list()
        with open(infile, 'rt') as f:
            for line in f:
                stripped = line.strip()
                if stripped.startswith('#'):
                    pass
                else:
                    if len(stripped) > 0:
                        databases.append(stripped)
        return databases

    def read_lines(self, infile):
        lines = list()
        with open(infile, 'rt') as f:
            for line in f:
                lines.append(line)
        return lines

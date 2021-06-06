__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021/06/05"

import json
import os
import pprint
import sys
import time
import uuid

import arrow
import jinja2

from operator import itemgetter
from pysrc.config import Config

# Class ArtifactGenerator is used to generate all script and code
# artifacts in this application, by using the extracted source database
# metadata as well as a customer-edited mapping file.

class ArtifactGenerator(object):    

    def __init__(self, dbname, mapping_data):
        self.dbname = dbname
        self.mapping_data = mapping_data
        if 'collections' in mapping_data.keys():
            self.collections = mapping_data['collections']
        else:
            self.collections = list()

        self.config = Config()
        self.shell_type          = self.config.shell_type
        self.ssl                 = self.config.ssl
        self.artifacts_dir       = self.config.artifacts_dir
        self.shell_artifacts_dir = self.config.shell_artifacts_dir()
        self.mongoexports_dir    = self.config.mongoexports_dir(dbname)
        self.data_dir            = self.config.data_dir

    def generate_initial_scripts(self):
        self.ensure_output_directories_exist()
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
        template_name = 'extract_metadata.txt'
        self.render_template(template_name, template_data, 'extract_metadata.sh')

    def generate_generate_mapping_files_script(self, template_data):
        template_name = 'generate_mapping_files.txt'
        self.render_template(template_name, template_data, 'generate_mapping_files.sh')

    def generate_generate_artifacts_script(self, template_data):
        template_name = 'generate_artifacts.txt'
        self.render_template(template_name, template_data, 'generate_artifacts.sh')

    def generate(self):
        self.ensure_output_directories_exist()

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

        if (self.gen_artifact('--adf-blob-datasets')):
            self.gen_adf_blob_datasets() 

        if (self.gen_artifact('--adf-cosmos-mongo-datasets')):
            self.gen_adf_cosmos_mongo_datasets() 

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

        template_name = 'mongoexport_script.txt'
        outfile = '{}/{}_mongoexports.sh'.format(self.shell_artifacts_dir, self.dbname)
        template_data = dict()
        template_data['dbname'] = self.dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py gen_mongoexports()'
        template_data['uri']  = self.config.source_mongodb_uri()
        template_data['url']  = self.config.source_mongodb_url
        template_data['host'] = self.config.source_mongodb_host 
        template_data['post'] = self.config.source_mongodb_port
        template_data['user'] = self.config.source_mongodb_user 
        template_data['pass'] = self.config.source_mongodb_pass
        template_data['ssl']  = ' # no --ssl' # self.config.source_mongodb_ssl 
        template_data['collections'] = self.collections
        template_data['outdir'] = self.mongoexports_dir
        self.render_template(template_name, template_data, outfile)

    def gen_python_create_containers(self):
        metadata_files = self.config.metadata_files()
        template_name = 'create_blob_containers.txt'
        outfile = '{}/python_create_containers.sh'.format(self.shell_artifacts_dir)
        template_data = dict()
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py gen_python_create_containers()'

        container_names = list()
        for metadata_file in metadata_files:
            meta = self.load_json_file(metadata_file)
            dbname = meta['dbname']
            container_names.append(self.config.blob_raw_container_name(dbname))
            container_names.append(self.config.blob_adf_container_name(dbname))
        template_data['container_names'] = container_names
        self.render_template(template_name, template_data, outfile)

    def gen_python_uploads(self):
        mongoexports_dir = self.config.mongoexports_dir(self.dbname)
        template_name = 'blob_uploads_python.txt'
        outfile = '{}/{}_python_mongoexport_uploads.sh'.format(
            self.shell_artifacts_dir, self.dbname)
        template_data = dict()
        collection_data = list()
        template_data['dbname'] = self.dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py gen_python_uploads()'
        template_data['collections'] = collection_data
        template_data['container'] = self.config.blob_raw_container_name(self.dbname)

        for c in self.collections:
            cname = c['name']
            local_file = self.config.mongoexport_file(self.dbname, cname)
            coll_dict = dict()
            coll_dict['local_file_path'] = local_file
            coll_dict['blob_name'] = os.path.basename(local_file)
            collection_data.append(coll_dict)
        self.render_template(template_name, template_data, outfile)

        for template_name in 'env.sh,pyenv.sh,storage.py,requirements.in,requirements.txt'.split(','):
            outfile = '{}/{}'.format(self.shell_artifacts_dir, template_name)
            self.render_template(template_name, template_data, outfile)

    def gen_az_cli_uploads(self):
        mongoexports_dir = self.config.mongoexports_dir(self.dbname)
        template_name = 'blob_uploads_az_cli.txt'
        outfile = '{}/{}_az_cli_mongoexport_uploads.sh'.format(
            self.shell_artifacts_dir, self.dbname)
        template_data = dict()
        collection_data = list()
        template_data['dbname'] = self.dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py gen_az_cli_uploads()'
        template_data['collections'] = collection_data
        template_data['container'] = self.config.blob_raw_container_name(self.dbname)

        for c in self.collections:
            cname = c['name']
            local_file = self.config.mongoexport_file(self.dbname, cname)
            coll_dict = dict()
            coll_dict['local_file_path'] = local_file
            coll_dict['blob_name'] = os.path.basename(local_file)
            collection_data.append(coll_dict)
        
        self.render_template(template_name, template_data, outfile)

    def gen_wrangle_scripts_for_db(self):
        mongoexports_dir = self.config.mongoexports_dir(self.dbname)
        template_name = 'wrangle_all.txt'
        outfile = '{}/{}_wrangle_all.sh'.format(self.shell_artifacts_dir, self.dbname)
        template_data = dict()
        collection_data = list()
        template_data['dbname'] = self.dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py gen_wrangle_scripts_for_db()'
        template_data['collections'] = collection_data
        template_data['container'] = self.config.blob_raw_container_name(self.dbname)

        for c in self.collections:
            cname = c['name']
            script_basename = self.config.wrangle_script_basename(self.dbname, cname)
            coll_dict = dict()
            # openflights_wrangle_openflights__routes__source.json.sh
            blob_name = self.config.blob_name(self.dbname, cname)
            script_name = self.config.wrangle_script_name(self.dbname, blob_name)
            coll_dict['blob_name'] = blob_name
            coll_dict['script_name'] = script_name
            collection_data.append(coll_dict)

        self.render_template(template_name, template_data, outfile)

    def gen_wrangle_scripts_individual(self):
        mongoexports_dir = self.config.mongoexports_dir(self.dbname)
        template_name = 'wrangle_one.txt'

        for c in self.collections:
            template_data = dict()
            collection_data = list()
            template_data['dbname'] = self.dbname
            template_data['gen_timestamp'] = self.timestamp()
            template_data['gen_by'] = 'artifact_generator.py gen_wrangle_scripts_individual()'
            template_data['collections'] = collection_data
            template_data['container'] = self.config.blob_raw_container_name(self.dbname)
            cname = c['name']
            script_basename = self.config.wrangle_script_basename(
                self.dbname, cname)
            blob_name = self.config.blob_name(self.dbname, cname)
            local_file_path = self.config.wrangling_blob_download_file(
                self.dbname, cname)
            wrangled_outfile_path = self.config.wrangled_outfile(
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

            self.render_template(template_name, template_data, outfile)

    def target_databases_list(self):
        target_databases = dict()
        for c in self.collections:
            source = self.mapping_data['source_dbname']
            target = c['mapping']['target_dbname']
            target_databases[target] = source
        return sorted(target_databases.keys())

    def gen_adf_linked_services(self):
        outdir = self.config.adf_linked_svc_artifacts_dir()
        template_data = dict()

        # One Storage Blob Linked Service
        template_name = 'adf_blob_linked_service.txt'
        name = self.config.blob_linked_service_name()
        outfile = '{}/{}.json'.format(outdir, name)
        template_data = dict()
        template_data['name'] = name
        self.render_template(template_name, template_data, outfile)

        # One CosmosMongo Linked Service per target database
        for target_db in self.target_databases_list():
            template_name = 'adf_cosmos_mongo_linked_service.txt'
            name = self.config.cosmos_linked_service_name(target_db)
            outfile = '{}/{}.json'.format(outdir, name)
            template_data = dict()
            template_data['name'] = name
            template_data['dbname'] = target_db
            self.render_template(template_name, template_data, outfile)

    def gen_adf_blob_datasets(self):
        outdir = self.config.adf_dataset_artifacts_dir()
        template_data = dict()

        for coll in self.collections:
            coll_name = coll['name']
            blob_name = self.config.wrangled_file_name(
                self.dbname, coll_name)
            base_part = os.path.basename(blob_name).split('.')[0]
            dataset_name = self.config.blob_dataset_name(self.dbname, coll_name)
            outfile = '{}/blob__{}'.format(outdir, blob_name)
            template_name = 'adf_blob_dataset.txt'
            template_data = dict()
            template_data['dataset_name']   = dataset_name
            template_data['blob_name']      = blob_name
            template_data['blob_container'] = self.config.blob_adf_container_name(self.dbname)
            self.render_template(template_name, template_data, outfile)

    def gen_adf_cosmos_mongo_datasets(self):
        outdir = self.config.adf_dataset_artifacts_dir()

        unique_combinations_dict = dict()
        for coll in self.collections:
            target_dbname = coll['mapping']['target_dbname']
            target_container = coll['mapping']['target_container']
            key = '{}:{}'.format(target_dbname, target_container)
            unique_combinations_dict[key] = ''

        for key in sorted(unique_combinations_dict.keys()):
            tokens = key.split(':')
            target_db, target_coll = tokens[0], tokens[1]
            linked_svc_name = self.config.cosmos_linked_service_name(target_db)
            dataset_name = self.config.cosmos_dataset_name(target_db, target_coll)
            outfile = '{}/{}.json'.format(outdir, dataset_name)
            template_name = 'adf_cosmos_mongo_dataset.txt'
            template_data = dict()
            template_data['dataset_name'] = dataset_name
            template_data['linked_service_name'] = linked_svc_name
            template_data['target_collection'] = target_coll
            self.render_template(template_name, template_data, outfile)

    def gen_adf_pipelines(self):
        manifest = self.load_json_file(self.config.manifest_json_file())
        pipelines = manifest['pipelines']
        outdir = self.config.adf_pipeline_artifacts_dir()
        template_name = 'adf_copy_pipeline.txt'

        for pidx, pipeline in enumerate(pipelines):
            pipeline_name = pipeline['name']
            pipeline_last_idx = len(pipeline['items']) - 1

            outfile = '{}/{}.json'.format(outdir, pipeline_name)
            template_data = dict()
            template_data['pipeline_name'] = pipeline_name
            template_data['items'] = list()

            prev_activity_name = ''
            for idx, item in enumerate(pipeline['items']):
                dataset = item['from_dataset']
                activity_name = 'copy_{}'.format(dataset)
                template_item_data = dict()
                template_item_data['activity_name'] = activity_name
                template_item_data['input_dataset']  = item['from_dataset']
                template_item_data['output_dataset'] = item['to_dataset']
                template_item_data['has_dependency'] = len(prev_activity_name) > 0
                template_item_data['dependent_activity'] = prev_activity_name
                if idx == pipeline_last_idx:
                    template_item_data['activity_sep'] = ''
                else:
                    template_item_data['activity_sep'] = ','
                template_data['items'].append(template_item_data)
                prev_activity_name = str(activity_name)

            debugfile = 'tmp/pipeline_{}_{}_templatedata.json'.format(pidx, pipeline_name)
            self.write_obj_as_json_file(debugfile, template_data)

            self.render_template(template_name, template_data, outfile)

				# {% if len(item['dependent_activity]) > 0 %}
				# 	hell yeah
				# {% endif %}

    # def adf_copy_depends_on_json(self, prev_activity_name):
    #     # {
    #     #     "activity": "xxxx",
    #     #     "dependencyConditions": [
    #     #         "Succeeded"
    #     #     ]
    #     # }
    #     if prev_activity_name == '':
    #         return ''
    #     else:
    #         depends = dict()
    #         depends['activity'] = prev_activity_name
    #         depends['dependencyConditions'] = 'Succeeded'
    #         return depends  # json.dumps(depends, sort_keys=False, indent=2)

    def generate_reference_db_scripts(self):
        self.generate_openflights_reference_db_scripts()
        self.generate_olympics_reference_db_scripts()

    def generate_openflights_reference_db_scripts(self):
        dbname = 'openflights'
        outfile = '{}/databases/mongo_recreate_{}_db.sh'.format(
            self.config.app_dir, dbname)
        template_name = 'mongo_recreate_db.txt'
        template_data = dict()
        template_data['authored_year_month'] = self.config.authored_year_month()
        template_data['dbname'] = dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py generate_openflights_reference_db_scripts()'
        template_data['uri']  = self.config.source_mongodb_uri()
        template_data['url']  = self.config.source_mongodb_url
        template_data['host'] = self.config.source_mongodb_host 
        template_data['post'] = self.config.source_mongodb_port
        template_data['user'] = self.config.source_mongodb_user 
        template_data['pass'] = self.config.source_mongodb_pass
        template_data['ssl']  = ' # no --ssl' # self.config.source_mongodb_ssl 
        coll_names = self.openflights_collection_names()
        coll_list = list()
        for coll_name in coll_names:
            coll_info = dict()
            coll_info['name'] = coll_name
            coll_info['infile'] = '{}.json'.format(coll_name)
            coll_list.append(coll_info)
        template_data['collections'] = sorted(coll_list, key = itemgetter('name'))
        self.render_template(template_name, template_data, outfile)

    def openflights_collection_names(self):
        return 'airports,airlines,routes,planes,countries'.split(',')

    def generate_olympics_reference_db_scripts(self):
        dbname = 'olympics'
        template_name = 'mongo_recreate_db.txt'
        outfile = '{}/databases/mongo_recreate_{}_db.sh'.format(
            self.config.app_dir, dbname)
        template_data = dict()
        template_data['authored_year_month'] = self.config.authored_year_month()
        template_data['dbname'] = dbname
        template_data['gen_timestamp'] = self.timestamp()
        template_data['gen_by'] = 'artifact_generator.py generate_olympics_reference_db_scripts()'
        template_data['uri']  = self.config.source_mongodb_uri()
        template_data['url']  = self.config.source_mongodb_url
        template_data['host'] = self.config.source_mongodb_host 
        template_data['post'] = self.config.source_mongodb_port
        template_data['user'] = self.config.source_mongodb_user 
        template_data['pass'] = self.config.source_mongodb_pass
        template_data['ssl']  = ' # no --ssl' # self.config.source_mongodb_ssl 
        coll_names = self.olympics_collection_names()
        coll_list = list()
        for coll_name in coll_names:
            coll_info = dict()
            coll_info['name'] = coll_name
            coll_info['infile'] = '{}.json'.format(coll_name)
            coll_list.append(coll_info)
        template_data['collections'] = sorted(coll_list, key = itemgetter('name'))

        self.render_template(template_name, template_data, outfile)

    def olympics_collection_names(self):
        return [
            "countries",
            "g1896_summer",
            "g1900_summer",
            "g1904_summer",
            "g1906_summer",
            "g1908_summer",
            "g1912_summer",
            "g1920_summer",
            "g1924_summer",
            "g1924_winter",
            "g1928_summer",
            "g1928_winter",
            "g1932_summer",
            "g1932_winter",
            "g1936_summer",
            "g1936_winter",
            "g1948_summer",
            "g1948_winter",
            "g1952_summer",
            "g1952_winter",
            "g1956_summer",
            "g1956_winter",
            "g1960_summer",
            "g1960_winter",
            "g1964_summer",
            "g1964_winter",
            "g1968_summer",
            "g1968_winter",
            "g1972_summer",
            "g1972_winter",
            "g1976_summer",
            "g1976_winter",
            "g1980_summer",
            "g1980_winter",
            "g1984_summer",
            "g1984_winter",
            "g1988_summer",
            "g1988_winter",
            "g1992_summer",
            "g1992_winter",
            "g1994_winter",
            "g1996_summer",
            "g1998_winter",
            "g2000_summer",
            "g2002_winter",
            "g2004_summer",
            "g2006_winter",
            "g2008_summer",
            "g2010_winter",
            "g2012_summer",
            "g2014_winter",
            "g2016_summer",
            "games"
        ]

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

    def load_json_file(self, infile):
        with open(infile) as json_file:
            return json.load(json_file)

    def ensure_output_directories_exist(self):
        self.ensure_directory_path(self.artifacts_dir)
        self.ensure_directory_path(self.config.adf_artifacts_dir())
        self.ensure_directory_path(self.config.adf_linked_svc_artifacts_dir())
        self.ensure_directory_path(self.config.adf_dataset_artifacts_dir())
        self.ensure_directory_path(self.config.adf_pipeline_artifacts_dir())
        self.ensure_directory_path(self.shell_artifacts_dir)
        self.ensure_directory_path(self.mongoexports_dir)
        self.ensure_directory_path(self.config.reference_app_databases_dir())

    def ensure_directory_path(self, dir_path):
        try:
            if not os.path.exists(dir_path):
                os.makedirs(dir_path)
        except:
            pass

    def render_template(self, template_name, template_data, outfile):
        t = self.get_template(os.getcwd(), template_name)
        s = t.render(template_data)
        self.write(outfile, s)

    def get_template(self, root_dir, name):
        filename = 'templates/{}'.format(name)
        return self.get_jinja2_env(root_dir).get_template(filename)

    def get_jinja2_env(self, root_dir):
        return jinja2.Environment(
            loader = jinja2.FileSystemLoader(
                root_dir), autoescape=True)

    def write(self, outfile, s, verbose=True):
        with open(outfile, 'w') as f:
            f.write(s)
            if verbose:
                print('file written: {}'.format(outfile))

    def write_obj_as_json_file(self, outfile, obj):
        txt = json.dumps(obj, sort_keys=False, indent=2)
        with open(outfile, 'wt') as f:
            f.write(txt)
        print("file written: " + outfile)

    def read_migrated_databases_list_file(self):
        infile = self.config.migrated_databases_list_file()
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

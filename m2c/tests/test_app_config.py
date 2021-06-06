__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021/06/05"

import arrow
import os
import time
import pytest

from pysrc.app_config import AppConfig

# This file implements unit tests of class AppConfig, using
# the pytest framework.

def test_instance_variables():
    app_config = AppConfig()
    print(app_config.shell_type)
    assert(app_config.shell_type == 'bash')
    assert(app_config.ssl == False)
    assert(app_config.artifacts_dir == 'reference_app/artifacts')
    assert(app_config.data_dir == 'reference_app/data')
    assert(app_config.app_dir == 'reference_app')
    assert(app_config.source_mongodb_url  == 'localhost:27017')
    assert(app_config.source_mongodb_host == 'localhost')
    assert(app_config.source_mongodb_port == '27017')
    assert(app_config.source_mongodb_user == 'root')
    assert(app_config.source_mongodb_pass == 'rootpassword')
    assert(app_config.source_mongodb_ssl  == False)

def test_migrated_databases_list_file():
    app_config = AppConfig()
    expected = 'reference_app/data/metadata/migrated_databases_list.txt'
    assert(app_config.migrated_databases_list_file() == expected)

def test_source_mongodb_uri():
    app_config = AppConfig()
    assert(app_config.source_mongodb_uri() == 'mongodb://@localhost:27017')

def test_pymongo_conn_string():
    app_config = AppConfig()
    expected = 'mongodb://root:rootpassword@localhost:27017/admin'
    assert(app_config.pymongo_conn_string('admin') == expected)

def test_metadata_dir():
    app_config = AppConfig()
    expected = 'reference_app/data/metadata'
    print(app_config.metadata_dir())
    assert(app_config.metadata_dir() == expected)

def test_metadata_file():
    app_config = AppConfig()
    expected = 'reference_app/data/metadata/olympics_metadata.json'
    f = app_config.db_metadata_file('olympics')
    print(f)
    assert(f == expected)

def test_metadata_files():
    app_config = AppConfig()
    expected = sorted([
        'reference_app/data/metadata/openflights_metadata.json',
        'reference_app/data/metadata/olympics_metadata.json'
    ])
    print(app_config.metadata_files())
    assert(sorted(app_config.metadata_files()) == expected)

def test_mapping_file():
    app_config = AppConfig()
    expected =  'reference_app/data/metadata/olympics_mapping.json'
    f = app_config.db_mapping_file('olympics')
    print(f)
    assert(f == expected)

def test_mongoexports_dir():
    app_config = AppConfig()
    expected = 'reference_app/data/mongoexports/olympics'
    f = app_config.mongoexports_dir('olympics')
    print(f)
    assert(f == expected)

def test_mongoexports_file():
    app_config = AppConfig()
    expected = 'reference_app/data/mongoexports/olympics/olympics__countries__source.json'
    f = app_config.mongoexport_file('olympics', 'countries')
    print(f)
    assert(f == expected)

def test_blob_raw_container_name():
    app_config = AppConfig()
    expected = 'olympics-raw'
    f = app_config.blob_raw_container_name('olympics')
    print(f)
    assert(f == expected)

def test_blob_adf_container_name():
    app_config = AppConfig()
    expected = 'olympics-adf'
    f = app_config.blob_adf_container_name('olympics')
    print(f)
    assert(f == expected)

def test_blob_download_dir():
    app_config = AppConfig()
    expected = 'reference_app/data/downloads/olympics'
    f = app_config.blob_download_dir('olympics')
    print(f)
    assert(f == expected)

def test_wrangling_blob_download_file():
    app_config = AppConfig()
    expected = 'tmp/olympics/olympics__countries__source.json'
    f = app_config.wrangling_blob_download_file('olympics', 'countries')
    print(f)
    assert(f == expected)

def test_wrangle_script_basename():
    app_config = AppConfig()
    expected = 'olympics/wrangle_olympics_countries'
    s = app_config.wrangle_script_basename('olympics', 'countries')
    print(s)
    assert(s == expected)

def test_wrangle_script_name():
    app_config = AppConfig()
    expected = 'olympics_wrangle_countries.sh'
    s = app_config.wrangle_script_name('olympics', 'countries')
    print(s)
    assert(s == expected)

def test_wrangled_file_name():
    app_config = AppConfig()
    expected = 'olympics__countries__wrangled.json'
    s = app_config.wrangled_file_name('olympics', 'countries')
    print(s)
    assert(s == expected)

def test_wrangled_outfile():
    app_config = AppConfig()
    expected = 'tmp/olympics/olympics__countries__wrangled.json'
    s = app_config.wrangled_outfile('olympics', 'countries')
    print(s)
    assert(s == expected)

def test_shell_artifacts_dir():
    app_config = AppConfig()
    expected = 'reference_app/artifacts/shell'
    f = app_config.shell_artifacts_dir()
    print(f)
    assert(f == expected)

def test_adf_artifacts_dir():
    app_config = AppConfig()
    expected = 'reference_app/artifacts/adf'
    f = app_config.adf_artifacts_dir()
    print(f)
    assert(f == expected)

def test_adf_linked_svc_artifacts_dir():
    app_config = AppConfig()
    expected = 'reference_app/artifacts/adf/linkedService'
    f = app_config.adf_linked_svc_artifacts_dir()
    print(f)
    assert(f == expected)

def test_adf_dataset_artifacts_dir():
    app_config = AppConfig()
    expected = 'reference_app/artifacts/adf/dataset'
    f = app_config.adf_dataset_artifacts_dir()
    print(f)
    assert(f == expected)

def test_adf_pipeline_artifacts_dir():
    app_config = AppConfig()
    expected = 'reference_app/artifacts/adf/pipeline'
    s = app_config.adf_pipeline_artifacts_dir()
    print(s)
    assert(s == expected)

def test_blob_linked_service_name():
    app_config = AppConfig()
    assert(app_config.blob_linked_service_name() == 'M2CMigrationBlobStorage')

def test_blob_dataset_name():
    app_config = AppConfig()
    expected = 'blob__openflights__routes'
    s = app_config.blob_dataset_name('openflights', 'routes')
    print(s)
    assert(s == expected)

def test_cosmos_linked_service_name():
    app_config = AppConfig()
    expected = 'M2CMigrationCosmosDB_openflights'
    s = app_config.cosmos_linked_service_name('openflights')
    print(s)
    assert(s == expected)

def test_cosmos_dataset_name():
    app_config = AppConfig()
    expected = 'cosmos__openflights__routes'
    s = app_config.cosmos_dataset_name('openflights', 'routes')
    print(s)
    assert(s == expected)

def test_ensure_directory_path():
    app_config = AppConfig()
    dirname = 'tmp/{}'.format(int(time.time()))
    result = app_config.ensure_directory_path(dirname)
    assert(result == 'created')
    result = app_config.ensure_directory_path(dirname)
    assert(result == 'exists')
    result = app_config.ensure_directory_path(None)
    assert(result == 'except')

def test_timestamp():
    app_config = AppConfig()
    ts = app_config.timestamp()  # '2021-05-29 10:44:39 UTC'
    assert(ts.startswith('2021-')) 
    assert(ts.endswith(' UTC'))
    assert(len(ts) == 23)
    assert(len(ts.split()) == 3)

def test_env_var():
    app_config = AppConfig()
    assert(len(app_config.env_var('HOME', '')) > 0)
    assert(app_config.env_var('ARE_YOU_THERE', 'no') == 'no')

def test_boolean_env_var():
    app_config = AppConfig()
    assert(app_config.boolean_env_var('HOME', False) == False)
    assert(app_config.boolean_env_var('HOME', True) == False)
    assert(app_config.boolean_env_var('ABSENT', False) == False)
    assert(app_config.boolean_env_var('ABSENT', True) == True)

    os.environ['AUTOMATED'] = 'TRUE'
    os.environ['MANUAL'] = 'FALSE'
    assert(app_config.boolean_env_var('AUTOMATED', False) == True)
    assert(app_config.boolean_env_var('MANUAL', True) == False)

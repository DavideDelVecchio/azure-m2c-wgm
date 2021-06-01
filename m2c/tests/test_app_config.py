__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021/06/01"

import arrow
import os
import time
import pytest

from pysrc.app_config import AppConfig

def test_instance_variables():
    app_config = AppConfig()
    print(app_config.shell_type)
    assert(app_config.shell_type == 'bash')
    assert(app_config.ssl == False)
    assert(app_config.artifacts_dir == filename('reference_app/artifacts'))
    assert(app_config.data_dir == filename('reference_app/data'))
    assert(app_config.blob_linked_svc == 'MigrationBlobStorage')
    assert(app_config.cosmos_linked_svc == 'MigrationCosmosDB')

    assert(app_config.app_dir == filename('reference_app'))
    assert(app_config.source_mongodb_url  == 'localhost:27017')
    assert(app_config.source_mongodb_host == 'localhost')
    assert(app_config.source_mongodb_port == '27017')
    assert(app_config.source_mongodb_user == 'root')
    assert(app_config.source_mongodb_pass == 'rootpassword')
    assert(app_config.source_mongodb_ssl  == False)

def test_source_mongodb_uri():
    app_config = AppConfig()
    assert(app_config.source_mongodb_uri() == 'mongodb://@localhost:27017')

def test_pymongo_conn_string():
    app_config = AppConfig()
    expected = 'mongodb://root:rootpassword@localhost:27017/admin'
    assert(app_config.pymongo_conn_string('admin') == expected)

def test_metadata_dir():
    app_config = AppConfig()
    expected = filename('reference_app/data/metadata')
    print(app_config.metadata_dir())
    assert(app_config.metadata_dir() == expected)

def test_metadata_file():
    app_config = AppConfig()
    expected = filename('reference_app/data/metadata/olympics_metadata.json')
    f = app_config.db_metadata_file('olympics')
    print(f)
    assert(f == expected)

def test_metadata_files():
    app_config = AppConfig()
    expected = sorted([
        filename('reference_app/data/metadata/openflights_metadata.json'),
        filename('reference_app/data/metadata/olympics_metadata.json')
    ])
    print(app_config.metadata_files())
    assert(sorted(app_config.metadata_files()) == expected)

def test_mapping_file():
    app_config = AppConfig()
    expected =  filename('reference_app/data/metadata/olympics_mapping.json')
    f = app_config.db_mapping_file('olympics')
    print(f)
    assert(f == expected)

def test_mongoexports_dir():
    app_config = AppConfig()
    expected = filename('reference_app/data/mongoexports/olympics')
    f = app_config.mongoexports_dir('olympics')
    print(f)
    assert(f == expected)

def test_mongoexports_file():
    app_config = AppConfig()
    expected = filename('reference_app/data/mongoexports/olympics/olympics__countries__source.json')
    f = app_config.mongoexport_file('olympics', 'countries')
    print(f)
    assert(f == expected)

def test_artifact_dir():
    app_config = AppConfig()
    expected = filename('reference_app/artifacts/shell')
    f = app_config.artifact_dir('shell')
    print(f)
    assert(f == expected)

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

def filename(path):
    # placeholder method; may eventualy return the absolute filename
    return path

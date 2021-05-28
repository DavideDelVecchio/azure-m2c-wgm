__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021.05/28"

import pytest

from pysrc.app_config import AppConfig

def test_instance_variables():
    app_config = AppConfig()
    print(app_config.shell_type)
    assert(app_config.shell_type == 'bash')
    assert(app_config.ssl == False)
    assert(app_config.artifacts_dir == '/Users/cjoakim/github/azure-m2c-wgm/reference_app/artifacts')
    assert(app_config.data_dir == '/Users/cjoakim/github/azure-m2c-wgm/reference_app/data')
    assert(app_config.blob_linked_svc == 'MigrationBlobStorage')
    assert(app_config.cosmos_linked_svc == 'MigrationCosmosDB')

def test_metadata_dir():
    app_config = AppConfig()
    expected = '/Users/cjoakim/github/azure-m2c-wgm/reference_app/data/metadata'
    print(app_config.metadata_dir())
    assert(app_config.metadata_dir() == expected)

def test_metadata_dir():
    app_config = AppConfig()
    expected = '/Users/cjoakim/github/azure-m2c-wgm/reference_app/data/metadata/olympics_metadata.json'
    f = app_config.db_metadata_file('olympics')
    print(f)
    assert(f == expected)

def test_metadata_files():
    app_config = AppConfig()
    expected = sorted([
        '/Users/cjoakim/github/azure-m2c-wgm/reference_app/data/metadata/openflights_metadata.json',
        '/Users/cjoakim/github/azure-m2c-wgm/reference_app/data/metadata/olympics_metadata.json'
    ])
    print(app_config.metadata_files())
    assert(sorted(app_config.metadata_files()) == expected)

__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021.05.28"

import os
import sys
import traceback
import uuid

from azure.storage.blob import BlobServiceClient, BlobClient, ContainerClient

from azure.core.exceptions import ResourceExistsError
from azure.core.exceptions import ResourceNotFoundError

# Class Storage implements all operations in this application which interact
# with Azure Storage.  For example, uploading, downloading, and listing blobs.
#
# References:
# - https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-python
# - https://pypi.org/project/azure-storage-blob/
# - https://github.com/Azure/azure-sdk-for-python/tree/master/sdk/storage/azure-storage-blob
# - https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits#storage-limits
# - https://github.com/Azure/azure-sdk-for-python/blob/master/sdk/storage/azure-storage-blob/azure/storage/blob/_blob_client.py

class Storage(object):

    def __init__(self):
        self.blob_service_client = BlobServiceClient.from_connection_string(
            self.connection_string())

    def list_containers(self):
        try:
            return self.blob_service_client.list_containers()
            # a list of <class 'azure.storage.blob._models.ContainerProperties'>
        except:
            self.print_exception('list_containers, returning empty list')
            return list()

    def create_container(self, cname):
        try:
            container_client = self.blob_service_client.get_container_client(cname)
            container_client.create_container()
            print('create_container: {}'.format(cname))
        except:
            self.print_exception('create_container {}'.format(cname))

    def delete_container(self, cname):
        try:
            container_client = self.blob_service_client.get_container_client(cname)
            container_client.delete_container()
            print('delete_container: {}'.format(cname))
        except:
            self.print_exception('delete_container {}'.format(cname))

    def list_container(self, cname):
        try:
            container_client = self.blob_service_client.get_container_client(cname)
            return container_client.list_blobs()
        except:
            self.print_exception('list_container {}'.format(cname))
            return list()

    def upload_blob(self, local_file_path, cname, blob_name, overwrite=True):
        try:
            blob_client = self.blob_service_client.get_blob_client(container=cname, blob=blob_name)
            with open(local_file_path, "rb") as data:
                blob_client.upload_blob(data, overwrite=overwrite)
            print('upload_blob: {} {} -> {} {}'.format(local_file_path, overwrite, cname, blob_name))
        except:
            msg = 'local_file_path: {}  cname: {}  blob_name: {}'.format(
                local_file_path, cname, blob_name)
            self.print_exception('upload_blob {}'.format(msg))

    def download_blob(self, cname, blob_name, local_file_path):
        try:
            blob_client = self.blob_service_client.get_blob_client(container=cname, blob=blob_name)
            with open(local_file_path, "wb") as download_file:
                download_file.write(blob_client.download_blob().readall())
            print('download_blob: {} {} -> {}'.format(cname, blob_name, local_file_path))
        except:
            msg = 'cname: {}  blob_name: {}  local_file_path: {}'.format(
                cname, blob_name, local_file_path)
            self.print_exception('upload_blob {}'.format(msg))

    def connection_string(self):
        return os.environ['M2C_STORAGE_CONNECTION_STRING']

    def print_exception(self, msg=None):
        print('*** exception in storage.py - {}'.format(msg))
        exc_type, exc_value, exc_traceback = sys.exc_info()
        print("*** traceback:")
        traceback.print_tb(exc_traceback, limit=2, file=sys.stderr)
        print("*** exception:")
        traceback.print_exception(
            exc_type, exc_value, exc_traceback, limit=2, file=sys.stderr)

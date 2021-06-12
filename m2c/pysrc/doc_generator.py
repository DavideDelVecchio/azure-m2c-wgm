__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "June 2021"

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
from pysrc.manifest import Manifest

# Class DocGenerator was used to generate the initial set of documentation
# markdown files.

class DocGenerator(object):    

    def __init__(self):
        pass

    def generate(self):
        print('grrr')

        # template_data = dict()
        # template_data['gen_timestamp'] = self.timestamp()
        # template_data['gen_by'] = 'artifact_generator.py generate_initial_scripts()'
        # template_data['databases'] = databases_list

        # template_name = 'extract_metadata.txt'
        # self.render_template(template_name, template_data, 'extract_metadata.sh')

    def olympics_collection_names(self):
        return [
            "g1976_winter",
            "games"
        ]

    def timestamp(self):
        return arrow.utcnow().format('YYYY-MM-DD HH:mm:ss UTC')

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

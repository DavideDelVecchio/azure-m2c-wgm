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


# {
#     "name": "airports",
#     "mapping": {
#     "target_dbname": "",
#     "target_container": "",
#     "wrangling_algorithm": "standard",
#     "pk_name": "pk",
#     "pk_logic": [ {"type": "attr", "value": "name" }, {"type": "literal", "value": "xxx" } ],
#     "pk_sep": "-",
#     "doctype_name": "doctype",
#     "doctype_logic": [ {"type": "literal", "value": "airport" } ],
#     "doctype_sep": "-",
#     "excludes": [ "airport_id", "source", "type" ]
#     }
# },

class StandardDocumentWrangler(object):

    def __init__(self, mappings):
        self.mappings = mappings
        self.pk_name  = self.mappings['mapping']['pk_name'].strip().lower()
        self.pk_sep   = self.mappings['mapping']['pk_sep'].strip().lower()
        self.pk_logic = self.mappings['mapping']['pk_logic']
        self.do_pk_wrangling = len(self.pk_name) > 0

        self.doctype_name  = self.mappings['mapping']['doctype_name'].strip().lower()
        self.doctype_sep   = self.mappings['mapping']['doctype_sep'].strip().lower()
        self.doctype_logic = self.mappings['mapping']['doctype_logic']
        self.do_doctype_wrangling = len(self.doctype_name) > 0

        self.excludes = self.mappings['mapping']['excludes']
        self.do_excludes = len(self.excludes) > 0

    def wrangle(self, doc):
        self.wrangle_pk(doc)
        self.wrangle_doctype(doc)
        self.wrangle_excludes(doc)

    def wrangle_pk(self, doc):
        if self.do_pk_wrangling:
            values = list()
            for logic in self.pk_logic:
                if logic['type'] == 'literal':
                    values.append(logic['value'])
                elif logic['type'] == 'attr':
                    attr = logic['value']
                    if attr in doc.keys():
                        values.append(doc[attr])
            doc[self.pk_name] = self.doctype_sep.join(values)

    def wrangle_doctype(self, doc):
        if self.do_doctype_wrangling:
            values = list()
            for logic in self.doctype_logic:
                if logic['type'] == 'literal':
                    values.append(logic['value'])
            doc[self.doctype_name] = self.pk_sep.join(values)

    def wrangle_excludes(self, doc):
        if self.do_excludes:
            keys = doc.keys()
            for attr in self.excludes:
                if attr in keys:
                    del doc[attr]

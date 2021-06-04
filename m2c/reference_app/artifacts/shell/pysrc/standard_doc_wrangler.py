__author__  = 'Chris Joakim'
__email__   = "chjoakim@microsoft.com"
__license__ = "MIT"
__version__ = "2021.06.02"

import glob
import json
import os
import sys
import time
import traceback
import uuid

from bson.objectid import ObjectId

# Class StandardDocumentWrangler implements the "built-in" data wrangling,
# or transformation logic.  It transforms raw input mongoexport files into
# a similar but transformed format per the given mappings.
#
# The "wrangle(self, doc)" method takes a python dict object, which is the
# parsed result from one line of the raw input file, and simply transforms
# that doc object.  This includes adding and removing attributes.
#
# Sample mappings look like this:
# {
#   "name": "routes",
#   "mapping": {
#     "target_dbname": "travel",
#     "target_container": "routes",
#     "wrangling_algorithm": "standard",
#     "pk_name": "pk",
#     "pk_logic": [
#       [
#         "attribute",
#         "airline_id"
#       ]
#     ],
#     "pk_sep": "-",
#     "doctype_name": "doctype",
#     "doctype_logic": [
#       [
#         "literal",
#         "route"
#       ]
#     ],
#     "doctype_sep": "-",
#     "additions": [
#       [
#         "dynamic",
#         "_id",
#         "oid"
#       ],
#       [
#         "dynamic",
#         "t",
#         "epoch"
#       ]
#     ],
#     "excludes": [
#       "codeshare"
#     ]
#   },
#   "source_dbname": "openflights",
#   "default_target_dbname": "travel"
# }

class StandardDocumentWrangler(object):

    def __init__(self, mappings):
        self.mappings = mappings

        self.pk_name  = self.mappings['mapping']['pk_name'].strip().lower()
        self.pk_sep   = self.mappings['mapping']['pk_sep'].strip().lower()
        self.pk_logic = self.mappings['mapping']['pk_logic']
        if (len(self.pk_name) > 0) and (len(self.pk_logic) > 0):
            self.do_pk_wrangling = True
        else:
            self.do_pk_wrangling = False
        
        self.doctype_name  = self.mappings['mapping']['doctype_name'].strip().lower()
        self.doctype_sep   = self.mappings['mapping']['doctype_sep'].strip().lower()
        self.doctype_logic = self.mappings['mapping']['doctype_logic']
        if (len(self.doctype_name) > 0) and (len(self.doctype_logic) > 0):
            self.do_doctype_wrangling = True
        else:
            self.do_doctype_wrangling = False

        self.additions = self.mappings['mapping']['additions']
        self.do_additions = len(self.additions) > 0

        self.excludes  = self.mappings['mapping']['excludes']
        self.do_excludes = len(self.excludes) > 0

        print('StandardDocumentWrangler constructor:')
        print('  do_pk_wrangling:      {}'.format(self.do_pk_wrangling))
        print('  do_doctype_wrangling: {}'.format(self.do_doctype_wrangling))
        print('  do_additions:         {}'.format(self.do_additions))
        print('  do_excludes:          {}'.format(self.do_excludes))

        # TODO - validate the logic arrays 

    def wrangle(self, doc):
        if self.do_pk_wrangling:
            self.wrangle_pk(doc)

        if self.do_doctype_wrangling:
            self.wrangle_doctype(doc)

        if self.do_additions:
            self.wrangle_additions(doc)

        if self.do_excludes:
            self.wrangle_excludes(doc)

    def wrangle_pk(self, doc):
        values = list()
        for logic in self.pk_logic: 
            if logic[0] == 'literal':
                values.append(logic[1])
            elif logic[0] == 'attribute':
                attr_name = logic[1]
                if attr_name in doc.keys():
                    values.append(doc[attr_name])
                else:
                    print('attribute is not in doc: {}'.format(attr_name))
            elif logic[0] == 'dynamic':
                pass # TODO

        doc[self.pk_name] = self.pk_sep.join(values)

    def wrangle_doctype(self, doc):
        values = list()
        # for logic in self.doctype_logic:
        #     if logic['type'] == 'literal':
        #         values.append(logic['value'])
        # doc[self.doctype_name] = self.pk_sep.join(values)

    def wrangle_additions(self, doc):
        for logic in self.additions: 
            if logic[0] == 'dynamic':
                if logic[2] == 'epoch':
                    attr_name = logic[1]
                    doc[attr_name] = time.time()
                if logic[2] == 'oid':
                    attr_name = logic[1]
                    oid_dict = dict()
                    oid_dict['$oid'] = str(ObjectId())
                    doc[attr_name] = oid_dict
            elif logic[0] == 'literal':
                attr_name = logic[1]
                doc[attr_name] = logic[2]
            elif logic[0] == 'literal':
                attr_name = logic[1]
                doc[attr_name] = logic[2]

    def wrangle_excludes(self, doc):
        keys = doc.keys()
        for attr_name in self.excludes:
            if attr_name in keys:
                del doc[attr_name]

#!/usr/bin/env python3

import ruamel.yaml as yaml
import sys
import collections
import getopt
import requests
import os

EXPORT_PATH = "../lib/messages/"
FILE_EXTENSION = ".i18n.yaml"
DEFAULT_LANGUAGE = "en"


BASE_URL = 'https://api.airtable.com/v0/appmzM0w8oEaW5fsk/App%20Barkibu%20(en%2Ces%2Cde)'
REQUEST_HEADERS = {'Authorization': 'Bearer '+ os.environ.get('AIRTABLE_API_KEY')}

# at least File and Key are required, so we filter those that don't have them
FILTER_PARAMS =  "NOT({File} = '' ,{Key} = '')"


languages = []
data = []
params={}
rawData=[]


def merge(original, update):
    if not isinstance(original, collections.abc.Mapping):
        return update
    for key, value in update.items():
        if isinstance(value, collections.abc.Mapping):
            original[key] = merge(original.get(key, {}), value)
        else:
            original[key] = value
    return original

def main(argv= None):
    input_url = ""
    output_files_path = ""
    try:
        opts, args = getopt.getopt(argv,"hi:o:",["iname=","opath="])
    except getopt.GetoptError:
        pass

    for opt, arg in opts:
        if opt in ("-i", "--iname"):
            input_url = arg.strip()
        elif opt in ("-o", "--opath"):
            output_files_path = arg.strip()

    if not input_url:
        input_url = BASE_URL

    if not output_files_path:
        output_files_path = EXPORT_PATH


    get_data(input_url)
    add_languages()
    process_data()


    split_result = collections.defaultdict(list)
    for item in data:
        split_result[item['filename']].append(item)
    data_filename_split = list(split_result.values())

    for language in languages:
        for file_content in data_filename_split:
            content = {}
            for data_row in file_content:
                filename = data_row['filename']
                category = data_row['category']
                sub_category = data_row['subcategory']
                sub_sub_category = data_row['subsubcategory']
                key = data_row["key"]
                tag = data_row[language]

                if(len(category) == 0):
                    merge(content, {key: tag})
                if(len(category) != 0 and len(sub_category) == 0):
                    merge(content, {category: {key: tag}})
                if(len(sub_category) != 0 and len(sub_sub_category) == 0):
                    merge(content, {category: {sub_category: {key: tag}}})
                if(len(sub_sub_category) != 0):
                    merge(content, {category: {sub_category: {
                        sub_sub_category: {key: tag}}}})

            language_extension = ""
            if (language != DEFAULT_LANGUAGE):
                language_extension = "_" + str.lower(language)

            text_file = open(output_files_path + filename +
                             language_extension + FILE_EXTENSION, "w")

            dd = yaml.RoundTripDumper
            dd.process_scalar = process_scalar
            text_file.write(yaml.round_trip_dump(data=content, width=sys.maxsize, Dumper=dd))
            text_file.close()




def get_data(input_url):
    params['filterByFormula'] = FILTER_PARAMS
    req = requests.get(input_url, headers=REQUEST_HEADERS, params = params)
    try:
        for record in req.json()['records']:
            rawData.append(record['fields'])
        params['offset'] = req.json()['offset']

        get_data(input_url)
    except:
        pass



def add_languages():
    for item in rawData:
        for key in item:
            lowCaseKey = key.lower()
            if('key' in lowCaseKey or 'id' in lowCaseKey or 'file' in lowCaseKey or 'category' in  lowCaseKey or 'modified' in lowCaseKey):
                pass
            else:
                if key not in languages:
                    languages.append(key)


def process_data():
    for row in rawData:
        data_row = {}
        data_row['filename'] = row['File']
        data_row['category'] = row.get('Category', "")
        data_row['subcategory'] = row.get('SubCategory', "")
        data_row['subsubcategory'] = row.get('SubSubCategory', "")
        data_row['key'] = row['Key']
        for language in languages:
            data_row[language] = row.get(language, "")
        data.append(data_row)



# the scalar emitter from emitter.py : https://stackoverflow.com/a/30702046
def process_scalar(self):
    if self.analysis is None:
        self.analysis = self.analyze_scalar(self.event.value)
    if self.style is None:
        self.style = self.choose_scalar_style()
    split = (not self.simple_key_context)
    if split:  # not a key
        self.style = "'"
    if self.style == '"':
        self.write_double_quoted(self.analysis.scalar, split)
    elif self.style == '\'':
        if is_special_case(self.event.value):
            self.write_plain(self.analysis.scalar, split)
        else:
            self.write_single_quoted(self.analysis.scalar, split)
    elif self.style == '>':
        self.write_folded(self.analysis.scalar)
    elif self.style == '|':
        self.write_literal(self.analysis.scalar)
    else:
        self.write_plain(self.analysis.scalar, split)
    self.analysis = None
    self.style = None
    if self.event.comment:
        self.write_post_comment(self.event)


def is_special_case(value):
    if "'s" in value:
        return True
    if "href" in value:
        return True
    return False

if __name__ == "__main__":
    main(sys.argv[1:])

#!/usr/bin/env python3


import glob
import re
import sys
import ruamel.yaml as yaml
import getopt
import requests
import copy
import os


language_files = {}
local_data_row_list = []

DEFAULT_LANGUAGE = "en"
FILE_PATH = "../lib/messages/"
FILE_EXTENSION = ".i18n.yaml"
FILE_IGNORE = "faqMessages"


# text between '_' and '.i18n': 'es' in a spanish file name for example
LANGUAGE_REGEX_MATCHER = "(?<=_).*?(?=.i18n)"
CATEGORY_NAME = "Category"
SUB_CATEGORIES_PREFIX = "Sub"


field_names = ['File', 'Category', 'SubCategory',
               'SubSubCategory', 'Key', DEFAULT_LANGUAGE]

secondary_languages_data = {}


BASE_URL = 'https://api.airtable.com/v0/appmzM0w8oEaW5fsk/App'
REQUEST_HEADERS = {'Authorization': 'Bearer '+ os.environ.get('AIRTABLE_API_KEY'),
                   'Content-Type': 'application/json'}

# at least File and Key are required, so we filter those that don't have them
FILTER_PARAMS = "NOT({File} = '' ,{Key} = '')"
API_ALLOWED_ROWS_SAME_TIME = 10
api_params = {}
remote_data_row_list = []


def has_no_children(data):
    return isinstance(data, dict) == False


def get_translation_from_path(secondary_language_data, path, translation_placeholder):
    try:
        first, rest = path[0], path[1:]
        if rest:
            return get_translation_from_path(secondary_language_data[first], rest, translation_placeholder)
        else:
            return secondary_language_data[first]
    except:
        return "# MISSING: " + translation_placeholder


def append_other_languages_translations(row, translation_placeholder, language_files):
    path = []
    for value in row:
        if CATEGORY_NAME in value and len(row[value]) != 0:
            path.append(row[value])
    path.append(row['Key'])

    for language in language_files:
        if(language != DEFAULT_LANGUAGE):
            row[language] = get_translation_from_path(
                secondary_languages_data[language], path, translation_placeholder)


def append_row_id_field(row):
    idFields = [row['File'][0:3], row.get('Category', ""), row.get(
        'SubCategory', ""), row.get('SubSubCategory', ""), row['Key']]
    row['id'] = ".".join(filter(None, idFields))


def write_row(data, key, category, file_name, language_files):
    row = {
        'File': file_name,
        'Category': category()[0],
        'SubCategory': category()[1],
        'SubSubCategory': category()[2],
        'Key': key,
        DEFAULT_LANGUAGE: data[key]
    }
    append_other_languages_translations(row, data[key], language_files)
    append_row_id_field(row)
    local_data_row_list.append(row)


def category_store(category, sub_category, sub_sub_category):
    def incr():
        return [category, sub_category, sub_sub_category]
    return incr


def export_yaml_files_to_local_data_rows(data, file_name, language_files, level=0, cat=category_store("", "", "")):
    for key in data:
        if has_no_children(data[key]):
            write_row(data, key, cat, file_name, language_files)
        else:
            if(level == 0):
                categ = category_store(key, "",  "")
            elif(level == 1):
                categ = category_store(cat()[0], key, "")
            elif(level == 2):
                categ = category_store(cat()[0], cat()[1], key)
            export_yaml_files_to_local_data_rows(
                data=data[key], level=level+1, cat=categ, file_name=file_name, language_files=language_files)


def get_language_files(files_path):
    language_dict = {}
    for file in glob.glob(files_path + "*" + FILE_EXTENSION):
        if (FILE_IGNORE not in file):
            match = re.search(LANGUAGE_REGEX_MATCHER, file)
            if match is None:
                try:
                    language_dict[DEFAULT_LANGUAGE].append(file)
                except:
                    language_dict[DEFAULT_LANGUAGE] = [file]
            else:
                try:
                    language_dict[match.group(0)].append(file)
                except:
                    language_dict[match.group(0)] = [file]

    return language_dict


def get_remote_data(output_table_url):
    api_params['filterByFormula'] = FILTER_PARAMS
    req = requests.get(output_table_url, headers=REQUEST_HEADERS, params=api_params)
    try:
        for record in req.json()['records']:
            remote_data_row_list.append(record)
        api_params['offset'] = req.json()['offset']
        get_remote_data(output_table_url)
    except:
        pass


def update_remote_data(output_table_url, localData, index, update):
    rows_at_a_time = API_ALLOWED_ROWS_SAME_TIME
    local_data_sublist = copy.deepcopy(localData[index:index+rows_at_a_time])

    if len(local_data_sublist):
        for remove_generated_id in local_data_sublist:
            remove_generated_id['fields'].pop('id', None)
        data = {
            "records": local_data_sublist
        }

        if update:
            requests.put(output_table_url, headers=REQUEST_HEADERS, json=data)
        else:
            requests.post(output_table_url, headers=REQUEST_HEADERS, json=data)

        update_remote_data(output_table_url, localData, index+rows_at_a_time, update)


def delete_remote_data(output_table_url, localData, index):
    rows_at_a_time = API_ALLOWED_ROWS_SAME_TIME
    if len(localData[index:index+rows_at_a_time]):
        delete = localData[index:index+rows_at_a_time]
        requests.delete(output_table_url, headers=REQUEST_HEADERS, params=delete)
        delete_remote_data(output_table_url,localData, index+rows_at_a_time)


def update_and_delete_old_tags_in_remote(output_table_url):
    remote_row_update_list = []
    remote_row_delete_list = []
    local_data_id_list = *map(lambda item: item['id'], local_data_row_list),
    for remote_data_row in remote_data_row_list:
        if remote_data_row['fields']['id'] in local_data_id_list:
            remote_data_row_update = {}
            remote_data_row_update['fields'] = local_data_row_list[local_data_id_list.index(
                remote_data_row['fields']['id'])]
            remote_data_row_update['id'] = remote_data_row['id']
            remote_row_update_list.append(remote_data_row_update)
        else:
            remote_row_delete_list.append(('records[]', remote_data_row['id']))

    dupe_id_list = []
    dupe_element_list = []
    for find_duplicate in remote_row_update_list:
        if(find_duplicate['fields']['id'] in dupe_id_list):
            dupe_element_list.append(find_duplicate)
            remote_row_delete_list.append(('records[]', find_duplicate['id']))
        else:
            dupe_id_list.append(find_duplicate['fields']['id'])

    for dupe_element in dupe_element_list:
        remote_row_update_list.remove(dupe_element)

    update_remote_data(output_table_url, remote_row_update_list, 0, True)
    delete_remote_data(output_table_url, list(dict.fromkeys(remote_row_delete_list)), 0)


def create_new_tags_in_remote(output_table_url):
    local_row_create_list = []
    remote_data_id_list = * \
                              map(lambda item: item['fields']['id'], remote_data_row_list),
    for local_data_row in local_data_row_list:
        field = {}
        if local_data_row['id'] not in remote_data_id_list:
            field['fields'] = local_data_row
            local_row_create_list.append(field)
    update_remote_data(output_table_url, local_row_create_list, 0, False)


def main(argv=None):
    input_file_path = ""
    output_table_url = ""

    try:
        opts, args = getopt.getopt(argv, "hi:o:", ["ipath=", "ofile="])
    except getopt.GetoptError:
        pass

    for opt, arg in opts:
        if opt in ("-i", "--ipath"):
            input_file_path = arg.strip()
        elif opt in ("-o", "--ofile"):
            output_table_url = arg.strip()

    if not input_file_path:
        input_file_path = FILE_PATH

    if not output_table_url:
        output_table_url = BASE_URL

    language_files = get_language_files(input_file_path)

    for language_code in language_files:
        if(language_code != DEFAULT_LANGUAGE):
            field_names.append(language_code)

    for data_source in language_files[DEFAULT_LANGUAGE]:
        with open(data_source, encoding='utf-8') as file:
            file_name = data_source.replace(
                FILE_EXTENSION, "").replace(input_file_path, "")
            data = yaml.round_trip_load(file,  preserve_quotes=True)
            secondary_languages_data.clear()
            for language in language_files:
                if(language != DEFAULT_LANGUAGE):
                    secondary_language_file_name = (
                            input_file_path + file_name + "_" + str.lower(language) + FILE_EXTENSION)
                    secondary_language_file_data = yaml.round_trip_load(
                        open(secondary_language_file_name, encoding='utf-8'), preserve_quotes=True)
                    secondary_languages_data[language] = secondary_language_file_data

            export_yaml_files_to_local_data_rows(
                data, file_name, language_files)

    get_remote_data(output_table_url)
    update_and_delete_old_tags_in_remote(output_table_url)
    create_new_tags_in_remote(output_table_url)


if __name__ == "__main__":
    main(sys.argv[1:])

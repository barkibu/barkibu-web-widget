#!/usr/bin/env python3

import ruamel.yaml as yaml
import sys
import os
import requests
import json


BASE_URL = 'https://api.airtable.com/v0/appmzM0w8oEaW5fsk/app_faqs'
REQUEST_HEADERS = {'Authorization': 'Bearer '+ os.environ.get('AIRTABLE_API_KEY')}
FILTER_PARAMS =  "NOT({id} = '' ,{section} = '')"

EXPORT_PATH = "../lib/messages/"
FILE_EXTENSION = ".i18n.yaml"
FAQ_FILE_NAME = "faqMessages"
DEFAULT_LANGUAGE = "en"

params={}
raw_data=[]
languages=[]

def main(argv= None):
    input_url = BASE_URL
    get_data(input_url)
    detect_languages()
    export_data()


def get_data(input_url):
    params['filterByFormula'] = FILTER_PARAMS
    req = requests.get(input_url, headers=REQUEST_HEADERS, params = params)
    try:
        for record in req.json()['records']:
            raw_data.append(record['fields'])
        params['offset'] = req.json()['offset']

        get_data(input_url)
    except:
        pass

def detect_languages():
    for key in raw_data[0]:
        try:
            language = key.split("_")[1]
            if language not in languages:
                    languages.append(language)

        except:
            pass
        

def export_data():
    for language in languages:
        file_name = ""
        faqs={}
        faqlist = []
        for data_row in raw_data:
            faq={}
            faq["id"] = data_row["id"]
            faq["order"] = data_row["order"]
            faq["section"] = data_row["section"]
            faq["question"] = data_row["question_"+language]
            faq["answer"] = data_row["answer_"+language]
            faqlist.append(faq)
        faqs["faqs"] = faqlist

        yaml_result = yaml.round_trip_dump(data={"faqs" : str(faqs).replace('"',"'")}, width=sys.maxsize)

        if(language==DEFAULT_LANGUAGE):
            file_name = EXPORT_PATH + FAQ_FILE_NAME + FILE_EXTENSION
        else:
            file_name = EXPORT_PATH + FAQ_FILE_NAME +"_" + language + FILE_EXTENSION

        file = open(file_name, "w")
        file.write(yaml_result)
        file.close()


if __name__ == "__main__":
    main(sys.argv[1:])

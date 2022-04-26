import unittest
import requests
import os
import json
import airtable_to_local_translations
import local_to_airtable_translations


TEST_URL = "https://api.airtable.com/v0/appmzM0w8oEaW5fsk/app_test"
REQUEST_HEADERS = {'Authorization': 'Bearer '+ os.environ.get('AIRTABLE_API_KEY')}


class TestCases(unittest.TestCase):

    def test_given_a_yaml_input_then_content_is_correctly_uploaded_to_airtable(self):
        local_to_airtable_translations.main([ "-o "+TEST_URL, "-i ./samples/"])
        req = requests.get(TEST_URL, headers=REQUEST_HEADERS)
        values = req.json()["records"]
        for entry in values:
            entry.pop("createdTime")
            entry.pop("id")
            entry["fields"].pop("Last Modified")

        with open('./samples/output.json', 'w') as fp:
            json.dump({"records": values}, fp)

        with open('./samples/output.json', 'r') as file:
            output=file.readlines()
        with open('./samples/golden_file.json', 'r') as file:
            golden=file.readlines()
        self.assertEqual(output, golden, "files are not equal")


    def test_given_an_airtable_test_input_then_yaml_outputs_are_correct(self):
        airtable_to_local_translations.main([ "-i "+TEST_URL, "-o ./samples/yaml_output/"])

        with open('./samples/yaml_output/golden_text_es.i18n.yaml', 'r') as file:
            output_es=file.readlines()
        with open('./samples/yaml_output/text_es.i18n.yaml', 'r') as file:
            golden_es=file.readlines()
        with open('./samples/yaml_output/golden_text.i18n.yaml', 'r') as file:
            output=file.readlines()
        with open('./samples/yaml_output/text.i18n.yaml', 'r') as file:
            golden=file.readlines()
        self.assertEqual(output, golden, "files are not equal")
        self.assertEqual(output_es, golden_es, "files are not equal")




if __name__ == '__main__':
    unittest.main()

#!/usr/bin/python3
""" using this REST API, for a given employee ID, returns information about
his/her TODO and export data in the JSON format."""
import json
import requests
import sys


if __name__ == "__main__":
    url = f"https://jsonplaceholder.typicode.com/users/{int(sys.argv[1])}"
    user = requests.get(url).json()
    to_do = requests.get(f'{url}/todos').json()
    file_js = f"{user['id']}.json"
    list1 = []
    for dict1 in to_do:
        dict2 = {}
        dict2['task'] = dict1['title']
        dict2['completed'] = dict1['completed']
        dict2['username'] = user['username']
        list1.append(dict2)
    dict3 = {user['id']: list1}
    with open(file_js, 'w') as fn:
        json.dump(dict3, fn)

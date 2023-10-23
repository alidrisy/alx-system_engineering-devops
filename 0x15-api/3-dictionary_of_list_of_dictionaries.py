#!/usr/bin/python3
""" Records all tasks from all employees and export data in the JSON format
to file"""
import json
import requests
import sys


if __name__ == "__main__":
    url = f"https://jsonplaceholder.typicode.com/users"
    users = requests.get(url).json()
    dict3 = {}
    for user in users:
        to_do = requests.get(f'{url}/{user["id"]}/todos').json()
        list1 = []
        for dict1 in to_do:
            dict2 = {}
            dict2['username'] = user['username']
            dict2['task'] = dict1['title']
            dict2['completed'] = dict1['completed']
            list1.append(dict2)
        dict3.update({user['id']: list1})
    with open("todo_all_employees.json", 'w') as fn:
        json.dump(dict3, fn)

#!/usr/bin/python3
""" using this REST API, for a given employee ID, returns information about
his/her TODO and export data in the CSV format. in file"""
import csv
import requests
import sys


if __name__ == "__main__":
    url = f"https://jsonplaceholder.typicode.com/users/{int(sys.argv[1])}"
    user = requests.get(url).json()
    to_do = requests.get(f'{url}/todos').json()
    file_csv = f"{user['id']}.csv"
    fields = ["userId", "user_name", "completed", "title"]
    for dict1 in to_do:
        dict1['user_name'] = user['username']
    with open(file_csv, 'w', newline="") as fn:
        writer = csv.DictWriter(fn, fieldnames=fields, extrasaction='ignore',
                                quoting=csv.QUOTE_ALL)
        writer.writerows(to_do)

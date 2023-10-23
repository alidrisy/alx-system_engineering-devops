#!/usr/bin/python3
""" using this REST API, for a given employee ID, returns information about
his/her TODO list progress and print it """
import requests
import sys


if __name__ == "__main__":
    url = f"https://jsonplaceholder.typicode.com/users/{int(sys.argv[1])}"
    user = requests.get(url).json()
    to_do = requests.get(f'{url}/todos').json()
    complet = [t.get("title") for t in to_do if t.get("completed") is True]
    print(f"Employee {user['name']} is done with tasks({len(complet)}/{len(to_do)}):")
    for i in complet:
        print(f"\t {i}")

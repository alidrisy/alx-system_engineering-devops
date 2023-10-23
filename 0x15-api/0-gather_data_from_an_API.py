#!/usr/bin/python3
""" using this REST API, for a given employee ID, returns information about
his/her TODO list progress and print it """
import requests
import sys


if __name__ == "__main__":
    url = f"https://jsonplaceholder.typicode.com/users/{int(sys.argv[1])}"
    user = requests.get(url).json()
    to_do = requests.get(f'{url}/todos').json()
    x = 0
    for i in to_do:
        if True in i.values():
            x += 1
    print(f"Employee {user['name']} is done with tasks({x}/{len(to_do)})")
    for i in range(len(to_do)):
        print(f" \t{to_do[i]['title']}")

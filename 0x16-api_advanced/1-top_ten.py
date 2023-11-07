#!/usr/bin/python3
""" Model to queries the Reddit API"""
import requests


def top_ten(subreddit):
    """ Queries the Reddit API and returns a list containing the
    titles of all hot articles for a given subreddit. """
    try:
        response = requests.get('https://www.reddit.com/r/{}/about.json'
                                .format(subreddit), allow_redirects=False)
        if response.status_code == '404':
            print(None)
            return
        data = response.json()
        titles = []
        for post in data['data']['children']:
            print(post['data']['title'])
    except Exception:
        print(None)

#!/usr/bin/python3
""" Model to queries the Reddit API"""
import requests


def recurse(subreddit, hot_list=[], after="", count=0):
    """ Returns a list containing the titles of all hot articles
    for a given subreddit """
    try:
        url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
        params = {'after': after, 'limit': 100, 'count': count}
        response = requests.get(url, params=params, allow_redirects=False)
        if response.status_code == '404':
            return None
        data = response.json()
        for post in data['data']['children']:
            hot_list.append(post['data']['title'])
        after = data['data']['after']
        count = data['data']['dist']
        if after is not None:
            recurse(subreddit, hot_list, after, count)
        return hot_list
    except Exception:
        return None

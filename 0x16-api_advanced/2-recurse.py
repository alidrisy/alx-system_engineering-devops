#!/usr/bin/python3
""" Model to queries the Reddit API"""
import requests


def recurse(subreddit, hot_list=[], after=""):
    """ Queries the Reddit API and returns a list containing the
    titles of all hot articles for a given subreddit """
    try:
        if after != "":
            url = 'https://www.reddit.com/r/{}/hot.json?limit=100&after={}'\
                    .format(subreddit, after)
        else:
            url = 'https://www.reddit.com/r/{}/hot.json?limit=100'\
                    .format(subreddit)
        response = requests.get(url, allow_redirects=False)
        if response.status_code == '404':
            return None
        data = response.json()
        last = None
        for post in data['data']['children']:
            hot_list.append(post['data']['title'])
            last = post['data']
        after = last['name']
        if after is not None:
            recurse(subreddit, hot_list, after)
        return hot_list
    except Exception:
        return None

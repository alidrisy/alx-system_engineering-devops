#!/usr/bin/python3
""" Model to queries the Reddit API"""
import requests


def number_of_subscribers(subreddit):
    """ Queries the Reddit API and returns the number of subscribers """
    try:
        headers = {'User-agent': 'subreddit_subscribers_counter'}
        response = requests.get('https://www.reddit.com/r/{}/about.json'
                                .format(subreddit),
                                headers=headers, allow_redirects=False)
        if response.status_code == '404':
            return (0)
        data = response.json()
        if data['kind'] == 't5':
            return data['data']['subscribers']
        else:
            return 0
    except Exception:
        return 0

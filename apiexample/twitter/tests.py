from django.test import TestCase
import unittest
import requests
import json
from pprint import pprint

class StatsTestCases(TestCase):
 	
 	# Unit Test for getFrequencyOfWordsOfLikedTweets method
 	# It tests two things, status code of the request and number of tweets searched 
 	# during execution
    def test_getFrequencyOfWordsOfLikedTweets(self):
    	count = 100
    	parameters = {'username': 'menescakir', 'count': count}
    	r = requests.get('http://127.0.0.1:8000/user/favwords', params=parameters)
    	#print(r.GET.get('username'))
    	status_code = r.status_code // 100
    	self.assertEqual(status_code,2)
    	json = r.json()
    	self.assertEqual(count,json['count'])

    def test_whoMentionedMost (self):
    	parameters = {'username': 'menescakir'}
    	r = requests.get('http://127.0.0.1:8000/user/mention', params=parameters)
    	status_code = r.status_code // 100
    	self.assertEqual(status_code,2)
    	json = r.json()
    	try:
    		id = json["id"]
    	except AttributeError:
    		self.fail("Followers didn't return user object.")
    	try:
    		id = json["text"]
    	except AttributeError:
    		self.fail("User_timeline didn't return status object.")
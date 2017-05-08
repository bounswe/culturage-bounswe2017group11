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
 	
 	# Unit Test for getMostLikedPages method
 	# It runs the function on a twitter account that is reserved for test purposes 
 	# and compares expected output with produced one.
    def test_getMostLikedPages(self):
    	count = 100
    	parameters = {'username': 'menescakir', 'count': count}
    	r = requests.get('http://127.0.0.1:8000/user/liked', params=parameters)
    	self.assertEqual(r.text,"(2280834239, \"Leyla'dan Sonra\")(2282508158, 'Biryudumkitap')(4048169297, 'Rumeysa Kadak')")

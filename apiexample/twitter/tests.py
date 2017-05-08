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

    def test_getFrequencyOfWordsOfAllTweets(self):
    	count = 10
    	x = requests.get('http://127.0.0.1:8000/user/allwords') 
    	self.assertEqual(x.text,'NO USERNAME!')

    # Checks whether return value is correct   
    def test_getHashtagPercentage(self):
        parameters = {'username': 'menescakir'}
        request = requests.get('http://127.0.0.1:8000/user/hashtag/hashtagPercentage', params=parameters)

        self.assertEqual("0.05486968449931413", request.text)

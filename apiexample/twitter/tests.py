from django.test import TestCase
import unittest
import requests
from datetime import datetime
import tweepy
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


    # Unit Test for getUsersTweetingMostFrequently method
    # It tests status code and
    # last status time of the last user 
    def test_getUsersTweetingMostFrequently(self):
        working = 0
        re = requests.get('http://127.0.0.1:8000/followers/freq')
        # Check status code
        status_code = re.status_code // 100
        self.assertEqual(status_code,2)
        json = re.json()
        # Get last json element as user
        last = json[ Object.keys(obj).sort().pop() ]
        last_status = tweepy.Cursor(api.user_timeline,id=last.id,wait_on_rate_limit=True).items(1)
        # Check for last status time of the last user whether it is posted in 1 hour or not
        diff = datetime.now() - last_status.created_at
        if diff.total_seconds() < 3600:
            working = 1
        self.assertEqual(working,1)
		
		
    def test_getFrequencyOfWordsOfAllTweets(self):
    	count = 10
    	x = requests.get('http://127.0.0.1:8000/user/allwords') 
    	self.assertEqual(x.text,'NO USERNAME!')

    # Checks whether return value is correct   
    def test_getHashtagPercentage(self):
        parameters = {'username': 'menescakir'}
        request = requests.get('http://127.0.0.1:8000/user/hashtag/hashtagPercentage', params=parameters)

        self.assertEqual("0.05486968449931413", request.text)
    
    def test_getMostNumberOfFollowers(self):
        count = 100
        parameters = {'username': 'menescakir', 'count': count}
        req = requests.get('http://127.0.0.1:8000/followers/popular', params=parameters)
        self.assertEqual(req.text, 'stonefiregrill')




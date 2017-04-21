from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.template import loader
from datetime import datetime
import json,requests,os, unicodedata
import tweepy

# Create your views here.
@csrf_exempt
def index(request):
    return HttpResponse("Çalışıyor. Tebrikler!")

# Example for Twitter usage
def example(request):
    # Get Twitter API
    api = getTwitterApi()

    # Get tweets from timeline
    # You can check other methods from: http://tweepy.readthedocs.io/en/v3.5.0/getting_started.html
    public_tweets = api.home_timeline()

    # Print tweets to console
    for tweet in public_tweets:
        print(tweet.text + '\n')

    # Returns response of twitter. It's looks like messy. Don't be coward :)
    return HttpResponse(public_tweets)

def getUsersTweetingMostFrequently(request):
    api = getTwitterApi()
    page_list = []
    users = []
    usersSorted = []
    for page in tweepy.Cursor(api.home_timeline).pages(1):
        page_list.append(page)

    for page in page_list:
        for status in page:
           # Take time difference for 1 hour difference
           diff = datetime.now() - status.created_at
           if diff.total_seconds() < 3600:
               # Add most frequently tweeting users to the list 
               users.append(status.user.id)
    # Sort users
    for count, elem in sorted(((users.count(e), e) for e in set(users)), reverse=True):
        usersSorted.append(api.get_user(elem))
        #usersSorted.append(' ')

    #Return sorted list
    return HttpResponse(usersSorted)

def getFrequencyOfWordsOfLikedTweets(request):
    api = getTwitterApi()
    count = 100
    test_user = ""
    if request.GET.get('username'):
        # User name of the user to look for
        test_user = request.GET.get('username')
    else:
        return HttpResponse("NO USERNAME!")
    if request.GET.get('count'):
        count = request.GET.get('count')
    #find each favorited tweet
    tweets = []
    pages = tweepy.Cursor(api.favorites,id=test_user,wait_on_rate_limit=True, count=count).pages(200)
    for page in pages:
        for status in page:
            tweets.append(str(status.text))

    #find all words anc count them
    allWords = [s  for t in tweets for s in t.split(' ')]
    counts = {w: allWords.count(w) for w in allWords}
    
    #ignore usual suspects
    if '' in counts:
        del counts['']
    if ' ' in counts:
        del counts[' ']
    
    d = {"frequencies":[{'word':key,"frequency":value} for key,value in counts.items()]}
    json_string = json.dumps(d)
    return HttpResponse(json_string)


def getMostNumberOfFollowers(request):
    api = getTwitterApi()
    count = 100
    test_user = ""
    if request.GET.get('username'):
        # User name of the user to look for
        test_user = request.GET.get('username')
    else:
        return HttpResponse("NO USERNAME!")
    if request.GET.get('count'):
        count = request.GET.get('count')

    maxFollower = 0
    name = ""

    for follower in tweepy.Cursor(api.followers, id=test_user, wait_on_rate_limit=True, count=count).items():
        if(maxFollower<follower.followers_count):
            name = follower.screen_name
            maxFollower = follower.followers_count

    return HttpResponse(name)

# Returns ready use Twitter API
def getTwitterApi():
    consumerKey = 'GN1xGLyDGT3xH0s5NXTKDSCQQ'
    consumerSecret = '01RXlOlHjrBMkB7t0x7TKu1iFzPknXyqQerLxCMrd6XrdJaTwN'
    accessToken = '326422323-B0uNTwh2H3fgYeQpEZGEIOQ76fjPRtsDzd7JHIVU'
    accessTokenSecret = '4ApJcSEbKib3X8pZVoBFHpkJkH5bbyF2EMArcIxQbz4OU'

    auth = tweepy.OAuthHandler(consumerKey, consumerSecret)
    auth.set_access_token(accessToken, accessTokenSecret)

    return tweepy.API(auth)

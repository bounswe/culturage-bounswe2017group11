from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.template import loader
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

def getFrequencyOfWordsOfLikedTweets(request):
    api = getTwitterApi()
    # User name of the user to look for
    test_user = "Rza_ozcelik"

    #find each favorited tweet
    tweets = []
    for page in tweepy.Cursor(api.favorites,id=test_user,wait_on_rate_limit=True, count=200).pages(200):
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
    #return
    result = str(counts)
    return HttpResponse(result)


# Returns ready use Twitter API
def getTwitterApi():
    consumerKey = 'GN1xGLyDGT3xH0s5NXTKDSCQQ'
    consumerSecret = '01RXlOlHjrBMkB7t0x7TKu1iFzPknXyqQerLxCMrd6XrdJaTwN'
    accessToken = '326422323-B0uNTwh2H3fgYeQpEZGEIOQ76fjPRtsDzd7JHIVU'
    accessTokenSecret = '4ApJcSEbKib3X8pZVoBFHpkJkH5bbyF2EMArcIxQbz4OU'

    auth = tweepy.OAuthHandler(consumerKey, consumerSecret)
    auth.set_access_token(accessToken, accessTokenSecret)

    return tweepy.API(auth)

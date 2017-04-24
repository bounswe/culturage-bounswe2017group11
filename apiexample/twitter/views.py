from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.template import loader
from datetime import datetime
from collections import Counter
import json,requests,os, unicodedata, re, operator
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
"""
author: Rıza Özçelik
This method counts the frequency of the words a specific user liked.
It has two paramters, username and count where username is compulsory.
If a username is not provided, method returns a string that expresses this fact.
If count is not provided, it is defaulted to 100, hence only 100 tweets is searched.
"""
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
    pages = tweepy.Cursor(api.favorites,id=test_user,wait_on_rate_limit=True, count=200).pages(200)
    brokenInnerLoop = False
    for page in pages:
        for status in page:
            tweets.append(str(status.text))
            # break  when enough tweet is collected.
            if len(tweets) > count:
                brokenInnerLoop = True
                break
        if brokenInnerLoop:
            break
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


def getMostLikedPages(request):
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
    userNames = []
    ids = []
    pages = tweepy.Cursor(api.favorites,id=test_user,wait_on_rate_limit=True, count=count).pages(200)
    for page in pages:
        for status in page:
            userNames.append(status.user.name)
            ids.append(status.user.id)
    
    
    topIDs = []
    data = Counter(ids)
    try:
        topIDs.append(data.most_common(3)[0][0])
        topIDs.append(data.most_common(3)[1][0])
        topIDs.append(data.most_common(3)[2][0])
    except:
        pass
    
    topThree = []
    data = Counter(userNames)
    try:
        topThree.append(data.most_common(3)[0][0])
        topThree.append(data.most_common(3)[1][0])
        topThree.append(data.most_common(3)[2][0])
    except:
        pass
    

    try:
        tuples = []
        tuples.append((topIDs[0],topThree[0]))
        tuples.append((topIDs[1],topThree[1]))
        tuples.append((topIDs[2],topThree[2]))
    except:
        pass
    #print(tuples)
    
    return HttpResponse(tuples)


    def getWhoMentionedMost(request)
    api = getTwitterApi
    test_user=""
    usrName = ""
    if request.GET.get('username'):
        # User name of the user to look for
        test_user = request.GET.get('username')
        usrName=test_user.username
    else:
        return HttpResponse("NO USERNAME!")
    
    id_map = {0:0}
    followers_tweets = user.followers_status();
    pattern = re.compile("@"+userName)

    for tweet in followers_tweets:
        follower_id = tweet.id_str
        text = tweet.text
        if pattern.match(text):
            if follower_id in id_map:
                id_map[follower_id] = id_map[follower_id]+1
            else:
                id_map[follower_id] = 1
        

    mostMentionedUser_Id = max(id_map.iteritems(),key = operator.itemgetter(1))[0]
    return mostMentionedUser_Id

def getLikeRatioOfTwoUsers(request):
    api = getTwitterApi()
    user1 = ""
    user2 = ""
    count = 100
    if request.GET.get('user1'):
        user1 = request.GET.get('user1')
    else:
        return HttpResponse("MISSING USERNAME!")
    if request.GET.get('user2'):
        user2 = request.GET.get('user2')
    else:
        return HttpResponse("MISSING USERNAME!")
    pages1 = tweepy.Cursor(api.favorites, id=user1, wait_on_rate_limit=True, count=count).pages(200)
    count1 = 0
    for page in pages1:
        for status in page:
            if status.user.screen_name == user2:
                count1 += 1
    pages2 = tweepy.Cursor(api.favorites, id=user2, wait_on_rate_limit=True, count=count).pages(200)
    count2 = 0
    for page in pages2:
        for status in page:
            if status.user.screen_name == user1:
                count2 += 1
    d = {'frequencies': [{'user1': user1, 'count': count1}, {'user2': user2, 'count': count2}]}
    json_string = json.dumps(d)
    return HttpResponse(json_string)


# Returns ready use Twitter API
def getTwitterApi():
    consumerKey = 'GN1xGLyDGT3xH0s5NXTKDSCQQ'
    consumerSecret = '01RXlOlHjrBMkB7t0x7TKu1iFzPknXyqQerLxCMrd6XrdJaTwN'
    accessToken = '326422323-B0uNTwh2H3fgYeQpEZGEIOQ76fjPRtsDzd7JHIVU'
    accessTokenSecret = '4ApJcSEbKib3X8pZVoBFHpkJkH5bbyF2EMArcIxQbz4OU'

    auth = tweepy.OAuthHandler(consumerKey, consumerSecret)
    auth.set_access_token(accessToken, accessTokenSecret)

    return tweepy.API(auth)

    #This function is used the calculating of words in user's tweets
def getFrequencyOfWordsOfAllTweets(request):
    api = getTwitterApi()
    cnt = 1
    test_user = ""
    tweets = []
            
    # Validation of username
    if request.GET.get('username'):
        # User name of the user to look for
        test_user = request.GET.get('username')
    else:
        return HttpResponse("NO USERNAME!")
    
    # Check if user enter count number, otherwise use default one
    if request.GET.get('count'):
        cnt = request.GET.get('count') 
   
    #find each user's tweets
    #Note that, status object has some contents to distinguish user's own tweets from others in user timeline.
    #For example, status.entities.user_mentions.screen_name gives name of owner of tweet but it could be sometimes NULL 
    # if user didn't fill his profile information. Also, there is "retweeted" part of status which indicates if tweet is
    # retweeted or not but it is not useful for our condition, either. Finally, I choose to compare first three character
    #of text which are always 'RT ' if it is retweeted.  
    for status in tweepy.Cursor(api.user_timeline,id=test_user,wait_on_rate_limit=True).items(int(cnt)): 
       first_three_letters = status.text[:3]
       if first_three_letters != 'RT ':
           tweets.append(str(status.text))
           print(status.text)
    
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

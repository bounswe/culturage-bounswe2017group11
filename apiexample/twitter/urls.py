from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^example', views.example, name='example'),
    url(r'^freqOfLiked', views.getFrequencyOfWordsOfLikedTweets, name='getFrequencyOfWordsOfLikedTweets'),
    url(r'^freqTweeting', views.getUsersTweetingMostFrequently, name='getUsersTweetingMostFrequently'),
    url(r'^mostFollower', views.getMostNumberOfFollowers, name='getMostNumberOfFollowers'),
    url(r'^mostLikedPages', views.getMostLikedPages, name='getMostLikedPages'),
    url(r'^whoMentionMost', view.getWhoMentionedMost),
    url(r'^freqOfWords', views.getFrequencyOfWordsOfAllTweets, name='getFrequencyOfWordsOfAllTweets')
]

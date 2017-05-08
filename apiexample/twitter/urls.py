from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.TwitterStats.index, name='index'),
    url(r'^example', views.TwitterStats.example, name='example'),
    url(r'^user/favwords', views.TwitterStats.getFrequencyOfWordsOfLikedTweets, name='getFrequencyOfWordsOfLikedTweets'),
    url(r'^followers/freq', views.TwitterStats.getUsersTweetingMostFrequently, name='getUsersTweetingMostFrequently'),
    url(r'^followers/popular', views.TwitterStats.getMostNumberOfFollowers, name='getMostNumberOfFollowers'),
    url(r'^user/liked', views.TwitterStats.getMostLikedPages, name='getMostLikedPages'),
    url(r'^user/mention', views.TwitterStats.getWhoMentionedMost, name='getWhoMentionedMost'),
    url(r'^user/allwords', views.TwitterStats.getFrequencyOfWordsOfAllTweets, name='getFrequencyOfWordsOfAllTweets'),
    url(r'^users/likes', views.TwitterStats.getLikeRatioOfTwoUsers, name='getLikeRatioOfTwoUsers'),
    url(r'^user/hashtag', views.TwitterStats.hashtagPercentage, name='hashtagPercentage')
]

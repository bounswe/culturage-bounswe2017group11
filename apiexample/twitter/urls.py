from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^example', views.example, name='example'),
    url(r'^user/favwords', views.getFrequencyOfWordsOfLikedTweets, name='getFrequencyOfWordsOfLikedTweets'),
    url(r'^followers/freq', views.getUsersTweetingMostFrequently, name='getUsersTweetingMostFrequently'),
    url(r'^followers/popular', views.getMostNumberOfFollowers, name='getMostNumberOfFollowers'),
    url(r'^user/liked', views.getMostLikedPages, name='getMostLikedPages'),
    url(r'^user/mention', views.getWhoMentionedMost, name='getWhoMentionedMost'),
    url(r'^user/allwords', views.getFrequencyOfWordsOfAllTweets, name='getFrequencyOfWordsOfAllTweets'),
    url(r'^users/likes', views.getLikeRatioOfTwoUsers, name='getLikeRatioOfTwoUsers'),
    url(r'^user/hashtag', views.hashtagPercentage, name='hashtagPercentage')
]

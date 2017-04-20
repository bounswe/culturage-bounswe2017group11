from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^example', views.example, name='example'),
    url(r'^freqOfLiked', views.getFrequencyOfWordsOfLikedTweets, name='getFrequencyOfWordsOfLikedTweets'),
    url(r'^freqTweeting', views.getUsersTweetingMostFrequently, name='getUsersTweetingMostFrequently')
]

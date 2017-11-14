from django.conf.urls import url, include
from . import views

urlpatterns = [
    url(r'^item', views.searchItem, name='searchItem'),
    url(r'^user', views.searchUser, name='searchUser'),
    url(r'^location', views.searchLocation, name='searchLocation'),
]


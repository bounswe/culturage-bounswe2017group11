from django.conf.urls import url, include
from . import views

urlpatterns = [
	url(r'^item', views.SearchItem.as_view()),
	url(r'^user', views.SearchUser.as_view()),
	url(r'^location', views.SearchLocation.as_view()),
]

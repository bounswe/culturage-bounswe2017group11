from django.conf.urls import url
from . import views

urlpatterns = [
	url(r'^tag/items', views.ItemsByTag.as_view()),
	# url(r'^user/items', views.SearchUser.as_view()),
	# url(r'^location/items', views.SearchLocation.as_view()),
]

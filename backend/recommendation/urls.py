from django.conf.urls import url
from . import views

urlpatterns = [
	url(r'^$', views.UserRecommendation.as_view()),
	url(r'^item/(?P<itemID>[0-9]+)', views.ItemRecommendation.as_view()),
]

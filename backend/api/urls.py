from django.conf.urls import url, include
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register(r'items', views.ItemViewSet)

urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^profile/?([0-9]+)?', views.profile, name='profile'),
    url(r'^newsfeed', views.newsfeed, name='newsfeed'),
    url(r'^auth/', include('auth.urls')),
    url(r'^search/', include('search.urls')),
    url(r'^recommendation/', include('recommendation.urls')),
]


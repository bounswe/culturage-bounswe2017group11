from django.conf.urls import url, include
from rest_framework import routers
from . import views

router = routers.DefaultRouter()
router.register(r'items', views.ItemViewSet)

urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^profile/?([0-9]+)?', views.profile, name='profile'),
    url(r'^newsfeed', views.NewsfeedList.as_view()),
    url(r'^auth/', include('auth.urls')),
    url(r'^search/', include('search.urls')),
    url(r'^recommendation/', include('recommendation.urls')),
    url(r'^filter/', include('filter.urls')),
    url(r'^items/(?P<itemID>[0-9]+)/comments', views.CommentList.as_view(), name='itemComment'),
    url(r'^items/(?P<itemID>[0-9]+)/rates', views.RateItem.as_view(), name='itemRate'),
    url(r'^items/(?P<itemID>[0-9]+)/timelines', views.ItemTimeline.as_view(), name='itemTimeline'),
    url(r'^items/(?P<itemID>[0-9]+)/medias', views.ItemMedia.as_view(), name='itemMedia'),
    url(r'^comments/(?P<commentID>[0-9]+)', views.CommentDetailView.as_view(), name='comment'),
    url(r'^timelines/(?P<timelineID>[0-9]+)', views.TimelineDetailView.as_view(), name='timeline'),
    url(r'^medias/(?P<mediaID>[0-9]+)', views.MediaDetailView.as_view(), name='media'),
]


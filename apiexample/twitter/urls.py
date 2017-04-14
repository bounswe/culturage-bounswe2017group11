from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    # url(r'^request/(?P<student_id>[0-9]+)/invite$', views.invite, name='invite'),
    # url(r'^request', views.request, name='request'),
]

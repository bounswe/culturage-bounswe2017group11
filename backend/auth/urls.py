from django.conf.urls import url, include
from rest_framework_jwt.views import obtain_jwt_token
from rest_framework_jwt.views import refresh_jwt_token
from . import views

urlpatterns = [
    url(r'^login', obtain_jwt_token),
    url(r'^refresh', refresh_jwt_token),
    url(r'^register', views.register, name='register'),
]


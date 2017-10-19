from django.conf.urls import url, include
from rest_framework import routers
from rest_framework_jwt.views import obtain_jwt_token
from . import views

router = routers.DefaultRouter()
router.register(r'items', views.ItemViewSet)

urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^auth/login', obtain_jwt_token),
    url(r'^auth/register', views.register, name='register'),
    url(r'^auth/addLoc', views.register, name='addLoc'),

]


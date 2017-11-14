from django.http import HttpResponse
from django.db.models import Q
from django.contrib.auth.models import User
from base.models import Item
from base.models import Location
from base.serializers import NewsfeedSerializer
from base.serializers import UserSerializer
from base.serializers import LocationSerializer
from rest_framework.response import Response
from rest_framework.views import APIView

class SearchItem(APIView):
	"""
    API endpoint that search items.
    """
	def get(self, request):
		query = request.GET.get('q', '')
		items = Item.objects.order_by('-created_at').filter(Q(name__icontains=query) | Q(description__icontains=query))
		items = NewsfeedSerializer.setup_eager_loading(items)  # Set up eager loading to avoid N+1 selects
		serializer = NewsfeedSerializer(items, many=True, context={'request': request})
		return Response(serializer.data)

class SearchUser(APIView):
	"""
    API endpoint that search users.
    """
	def get(self, request):
		query = request.GET.get('q', '')
		users = User.objects.order_by('-date_joined').filter(Q(username__icontains=query) | Q(email__icontains=query))
		serializer = UserSerializer(users, many=True, context={'request': request})
		return Response(serializer.data)

class SearchLocation(APIView):
	"""
    API endpoint that search locations.
    """
	def get(self, request):
		query = request.GET.get('q', '')
		locations = Location.objects.order_by('-id').filter(Q(name__icontains=query))
		serializer = LocationSerializer(locations, many=True, context={'request': request})
		return Response(serializer.data)

from django.http import HttpResponse
from django.db.models import Q
from django.contrib.auth.models import User
from base.models import Item
from base.serializers import NewsfeedSerializer
from base.serializers import UserSerializer
from rest_framework.response import Response
from rest_framework.views import APIView

class UserRecommendation(APIView):
	"""
    API endpoint that gives recommendation for user.
    """
	def get(self, request):
		user = request.user
		items = Item.objects.order_by('-created_at').all()[:10]
		items = NewsfeedSerializer.setup_eager_loading(items)  # Set up eager loading to avoid N+1 selects
		serializer = NewsfeedSerializer(items, many=True, context={'request': request})
		return Response(serializer.data)

class ItemRecommendation(APIView):
	"""
    API endpoint that gives recommendation for item.
    """
	def get(self, request, itemID):
		item = Item.objects.get(id=itemID)
		items = Item.objects.order_by('-created_at').all()[:10]
		items = NewsfeedSerializer.setup_eager_loading(items)  # Set up eager loading to avoid N+1 selects
		serializer = NewsfeedSerializer(items, many=True, context={'request': request})
		return Response(serializer.data)

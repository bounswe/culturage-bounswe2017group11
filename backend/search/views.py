from django.http import HttpResponse
from django.db.models import Q
from django.contrib.auth.models import User
from django.conf import settings
from base.models import Item
from base.models import Location
from base.models import Tag
from base.serializers import NewsfeedSerializer
from base.serializers import UserSerializer
from base.serializers import LocationSerializer
from base.serializers import TagSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
import gensim
import os

class SearchItem(APIView):
	"""
    API endpoint that search items.
    """
	def get(self, request):
		model = gensim.models.KeyedVectors.load(os.path.join(settings.BASE_DIR,"50k"))
		query = request.GET.get('q', '').lower()
		queryList = query.split()
		queryModel = []
		for q in queryList:
			if q in model:
				queryModel.append(q)
		#print(queryModel)

		if len(queryModel) is 0:
			items = Item.objects.order_by('-created_at').filter(Q(name__icontains=query)| Q(name__icontains=query.title())| Q(description__icontains=query))	
			items = NewsfeedSerializer.setup_eager_loading(items)  # Set up eager loading to avoid N+1 selects
			serializer = NewsfeedSerializer(items, many=True, context={'request': request})
			return Response(serializer.data)

		items = Item.objects.order_by('-created_at').filter()#(Q(name__icontains=query) | Q(description__icontains=query))
		itemsTitle = Item.objects.order_by('-created_at').filter(Q(name__icontains=query) | Q(name__icontains=query.title()) )# | Q(description__icontains=query))
		

		returnedItems = []
		scores = []

		for item in itemsTitle:
			returnedItems.append(item)
			scores.append(1)
		
		for item in items:
			if item not in itemsTitle:
				avSim = 0
				count = 0
				#print(item)
				for tag in item.tags.all():
					for tagPart in tag.name.split():
						#print("--------",tagPart)
						if tagPart in model:
							for q in queryModel:
								#print(q,"--------",tagPart)
								avSim = avSim + model.similarity(q,tagPart)
								count = count + 1
								#print(",",avSim)
								#print(",",count)
				#print("*****",count)
				if count==0:
					avSim = 0
				else:
					avSim = avSim/count
				
				#print(avSim)
				returnedItems.append(item)
				scores.append(avSim)
		#returnedItems = NewsfeedSerializer.setup_eager_loading(returnedItems)  # Set up eager loading to avoid N+1 selects
		
		#print(returnedItems)
		#print(scores)
		returnedItems = [x for _, x in sorted(zip(scores,returnedItems), key = lambda pair: pair[0], reverse = True)]
		#print(returnedItems)
		returnedItems = returnedItems[0:15]
		
		serializer = NewsfeedSerializer(returnedItems, many=True, context={'request': request})
		return Response(serializer.data)

class SearchUser(APIView):
	"""
    API endpoint that search users.
    """
	def get(self, request):
		query = request.GET.get('q', '')
		users = User.objects.order_by('-date_joined').filter(Q(username__icontains=query) | Q(email__icontains=query) | Q(profile__fullName__icontains=query))
		users = UserSerializer.setup_eager_loading(users)
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

class SearchTag(APIView):
	"""
    API endpoint that search tag.
    """
	def get(self, request):
		query = request.GET.get('q', '')
		tags = Tag.objects.order_by('-id').filter(Q(name__icontains=query))
		tags = TagSerializer.setup_eager_loading(tags)  # Set up eager loading to avoid N+1 selects
		serializer = TagSerializer(tags, many=True, context={'request': request})
		return Response(serializer.data)

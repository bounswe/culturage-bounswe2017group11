from django.http import HttpResponse
from django.db.models import Q
from django.contrib.auth.models import User
from base.models import Item
from django.conf import settings
from base.serializers import NewsfeedSerializer
from base.serializers import UserSerializer
from rest_framework.response import Response
from rest_framework.views import APIView
import gensim
import math
import os

class UserRecommendation(APIView):
	"""
    API endpoint that gives recommendation for user.
    """
	def get(self, request):
		model = gensim.models.KeyedVectors.load(os.path.join(settings.BASE_DIR,"50k"))
		user = request.user
		items = Item.objects.order_by('-created_at').filter(rated_item__user=user)
		items = NewsfeedSerializer.setup_eager_loading(items)  # Set up eager loading to avoid N+1 selects
		print("ssssss",len(items))
		tagsDict = {}
		for item in items:
			print("------------")
			print("ITEM BU:",item)
			tags = item.tags.all()
			for tag in tags:
				for tagPart in tag.name.split():
					if tagPart in model:
						if tagPart in tagsDict:
							tagsDict[tagPart] += 1
						else:
							tagsDict[tagPart] = 1
		
		sortedTags = sorted(tagsDict.items(), key=lambda x:x[1], reverse = True)
		
		allItems = Item.objects.order_by('-created_at').filter()
		returnedItems = []
		scores = []

		for item in allItems:
			if item in items:
				continue
			avSim = 0
			count = 0

			for tag in item.tags.all():
				#print("-----------",tag)
				for tagPart in tag.name.split():
					#print("--------",tagPart)
					for key, value in sortedTags:
						if tagPart in model and key in model:
							print(key,"--------",tagPart)
							avSim = avSim + model.similarity(key,tagPart)*math.log(value+1)
							count = count + 1
							print("sim:",avSim,"count:",count)
			print("*****",count)
			if count==0:
				avSim = 0
			else:
				avSim = avSim/count

			print("avSim between: ",item,avSim)
			returnedItems.append(item)
			scores.append(avSim)
			


		returnedItems = [x for _, x in sorted(zip(scores,returnedItems), key = lambda pair: pair[0], reverse = True)]	
		
		for key, value in sortedTags:
			print(key,value)

		
		returnedItems = returnedItems[0:15]
		serializer = NewsfeedSerializer(returnedItems, many=True, context={'request': request})
		return Response(serializer.data)

class ItemRecommendation(APIView):
	"""
    API endpoint that gives recommendation for item.
    """
	def get(self, request, itemID):
		model = gensim.models.KeyedVectors.load(os.path.join(settings.BASE_DIR,"50k"))
		theItem = Item.objects.get(id=itemID)
		tags = theItem.tags.all()

		notInModel = 1
		for tag in tags:
			for tagPart in tag.name.split():
				if tagPart in model:
					notInModel = 0

		print(notInModel)
		if len(tags) is 0 or notInModel is 1:
			items = Item.objects.order_by('-created_at').all()[:10]
			items = NewsfeedSerializer.setup_eager_loading(items)  # Set up eager loading to avoid N+1 selects
			serializer = NewsfeedSerializer(items, many=True, context={'request': request})
			return Response(serializer.data)

		items = Item.objects.order_by('-created_at').filter()#(Q(name__icontains=query) | Q(description__icontains=query))
		returnedItems = []
		scores = []

		for item in items:
			#if it is same, pass
			if str(item.id) == itemID:
				continue
			avSim = 0
			count = 0
			print("ITEM BU:",item)
			for tag in item.tags.all():
				#print("-----------",tag)
				for tagPart in tag.name.split():
					#print("--------",tagPart)
					for baseTag in tags:
						#print("-----------",baseTag)
						for baseTagPart in baseTag.name.split():
							if tagPart in model and baseTagPart in model:
								print(baseTagPart,"--------",tagPart)
								avSim = avSim + model.similarity(baseTagPart,tagPart)
								count = count + 1
								print("sim:",avSim,"count:",count)
			print("*****",count)
			if count==0:
				avSim = 0
			else:
				avSim = avSim/count

			print("avSim between: ",item,avSim)
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

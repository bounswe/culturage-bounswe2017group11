from django.http import HttpResponse, JsonResponse
from django.contrib.auth.models import User
from base.models import Item
from base.models import Profile
from base.models import Comment
from base.models import UserRatedItem
from base.models import Timeline
from base.models import Location
from base.models import Media
from base.models import Tag
from base.models import TagList
from base.models import Annotation
from base.models import Report
from base.serializers import ItemSerializer
from base.serializers import UserSerializer
from base.serializers import NewsfeedSerializer
from base.serializers import CommentSerializer
from base.serializers import UserRatedItemSerializer
from base.serializers import TimelineSerializer
from base.serializers import MediaSerializer
from base.serializers import TagSerializer
from base.serializers import AnnotationSerializer
from base.serializers import ReportSerializer
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.parsers import JSONParser
from rest_framework import viewsets
from rest_framework import permissions
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
import datetime
import json
import requests
import base64
from django.core.files.base import ContentFile
from django.conf import settings
"""@package docstring
Documentation for views endpoint for API
For more details please see below.
"""
	###
    #API endpoint that allows items to be viewed or edited.
    #@param request for view set
    #
class ItemViewSet(viewsets.ModelViewSet):

	queryset = Item.objects.all().order_by('-created_at')
	serializer_class = ItemSerializer
	permission_classes = (permissions.IsAuthenticated,)

	###
	#Get item list to review
	#@param self The item pointer
	#@return item list to be viewed
	def get_queryset(self):
		queryset = Item.objects.all().order_by('-created_at')
		queryset = self.get_serializer_class().setup_eager_loading(queryset)
		return queryset

	###
	#Create an item
	#@param self The item pointer
	#@param serializer Item model serializer

	def perform_create(self, serializer):
		location = self.request.data.get('location');
		date = self.request.data.get('date');
		if type(self.request.data) is dict:
			tags = self.request.data.get('tags');
		else:
			tags = self.request.data.getlist('tags');
		image = None
		if self.request.data.get('image'):
			image = self.request.data.get('image');
			if type(image) is str:
				format, imgstr = image.split(';base64,')
				ext = format.split('/')[-1]
				image = ContentFile(base64.b64decode(imgstr), name='item.' + ext) # You can save this as file instance.
		serializer.save(featured_img=image, created_by=self.request.user, date = date, location = location, tags = tags)

	###
	# API endpoint that returs newsfeed
	# @param request for newsfeed list
	#
class NewsfeedList(APIView):
	def get(self, request):
		items = Item.objects.order_by('-created_at').all()
		items = NewsfeedSerializer.setup_eager_loading(items)  # Set up eager loading to avoid N+1 selects
		serializer = NewsfeedSerializer(items, many=True, context={'request': request})
		return Response(serializer.data)

@api_view(['GET','POST'])
@permission_classes((IsAuthenticated, ))
def profile(request, id = ''):
	"""
    API endpoint that returns profile page.
    """
	if id:
		try:
			user = User.objects.get(pk=id)
		except User.DoesNotExist:
			user = None
	else:
		user = request.user
	if not user:
		return HttpResponse("User not found with given id: " + id, status = 404)

	if request.method == 'GET':
		response_data = {}
		response_data["username"] = user.username
		response_data["email"] = user.email
		if hasattr(user, 'profile'):
			response_data["fullName"] = user.profile.fullName
			response_data["birthday"] = user.profile.birthday
			response_data["location"] = user.profile.location
			try:
				response_data["photo"] = request.META['HTTP_HOST'] + user.profile.photo.url
			except:
				response_data["photo"] = None
		return JsonResponse(response_data)
	else:
		response_data = {}
		photo_ch = False
		data = JSONParser().parse(request)
		for key in data:
			if key == "username":
				response_data["username"] = data.get(key)
				user.username = data.get(key)
			if key == "email":
				response_data["email"] = data.get(key)
				user.email = data.get(key)
			if hasattr(user,"profile"):
				if key == "birthday":
					try:
						datetime.datetime.strptime(data.get(key), '%Y-%m-%d')
						user.profile.birthday = data.get(key)
						response_data["birthday"] = data.get(key)
					except:
						return HttpResponse("Value has an invalid date format. It must be in YYYY-MM-DD format.", status = 400)
				if key == "location":
					response_data["location"] = data.get(key)
					user.profile.location = data.get(key)
				if key == "photo":
					image = data.get(key)
					if type(image) is str:
						format, imgstr = image.split(';base64,')
						ext = format.split('/')[-1]
						image = ContentFile(base64.b64decode(imgstr), name='item.' + ext)
					user.profile.photo = image
					photo_ch = True
				if key == "fullName":
					user.profile.fullName = data.get(key)
					response_data["fullName"] = data.get(key)
		user.save()
		if(photo_ch):
			response_data["photo"] = request.META['HTTP_HOST']+user.profile.photo.url

		return JsonResponse(response_data)
	###
	# API endpoint that creates and retrieves comment
	# @param request for comment list
	#
class CommentList(APIView):
	def post(self, request, itemID):
		item = Item.objects.get(id=itemID)
		user = request.user
		serializer = CommentSerializer(data=request.data,context={'related_item': item, 'written_by':user})
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		else:
			return Response(serializer.errors)

	def get(self, request, itemID):
		item = Item.objects.get(id=itemID)
		comments = Comment.objects.filter(related_item = itemID)
		serializer = CommentSerializer(comments, many=True)
		return Response(serializer.data)
	###
	# API endpoint that returns timeline
	# @param request for items in a user's timeline
	#
class ItemTimeline(APIView):
	def post(self, request, itemID):
		item = Item.objects.get(id=itemID)
		user = request.user
		l_data = request.data.get('location')
		if l_data:
			location, created = Location.objects.get_or_create(name = l_data.get('name'), defaults={'longtitude':l_data.get('longtitude') , 'latitude':l_data.get('latitude') })
		else:
			location = None
		serializer = TimelineSerializer(data=request.data,context={'item': item, 'user':user, 'location':location})
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		else:
			return Response(serializer.errors)

	def get(self, request, itemID):
		item = Item.objects.get(id=itemID)
		serializer = TimelineSerializer(item.timelines, many=True)
		return Response(serializer.data)
	###
	# API endpoint that enables addtion of media for an item
	# @param request for media addition
	#
class ItemMedia(APIView):
	def post(self, request, itemID):
		item = Item.objects.get(id=itemID)
		user = request.user
		serializer = MediaSerializer(data=request.data,context={'item': item, 'user':user})
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		else:
			return Response(serializer.errors)

	def get(self, request, itemID):
		item = Item.objects.get(id=itemID)
		serializer = MediaSerializer(item.media_item, many=True)
		return Response(serializer.data)
	###
	# API endpoint that enables annotation for media source
	# @param request for annotation
	#
class MediaAnnotation(APIView):
	def post(self, request, mediaID):
		media = Media.objects.get(id=mediaID)
		user = request.user
		serializer = AnnotationSerializer(data=request.data,context={'media': media, 'user':user})
		if serializer.is_valid():
			serializer.save()
			return Response(serializer.data)
		else:
			return Response(serializer.errors)

	def get(self, request, mediaID):
		media = Media.objects.get(id=mediaID)
		serializer = AnnotationSerializer(media.annotated_media, many=True)
		return Response(serializer.data)
	###
	# API endpoint that support item like/rate
	# @param request for item rate/like
	#
class RateItem(APIView):
	def post(self, request, itemID):
		item = Item.objects.get(id= itemID)
		user = request.user
		try:
			rate = UserRatedItem.objects.filter(item=itemID, user = request.user.id).first()
		except UserRatedItem.DoesNotExist:
			rate = None
		if rate:
			if request.data["rate"]:
				return Response({"error" : "You already rated this item"}, status=status.HTTP_403_FORBIDDEN)
			else:
				rate.delete()
				item.calculateRate()
				return Response(item.rate)
		if not request.data["rate"]:
			return Response({"error" : "You can't unlike item without like it"}, status=status.HTTP_403_FORBIDDEN)

		serializer = UserRatedItemSerializer(data=request.data, context={ 'user':user, 'item':item })
		if serializer.is_valid():
			serializer.save()
			header = {
				"Content-Type": "application/json; charset=utf-8",
				"Authorization": "Basic " + settings.ONESIGNAL_TOKEN
			}

			payload = {
				"app_id": settings.ONESIGNAL_APP,
				"included_segments": ["All"],
				"contents": {"en": "Your item is liked by " + user.username }
			}
			req = requests.post("https://onesignal.com/api/v1/notifications", headers=header, data=json.dumps(payload))
			print(req.status_code, req.reason)
			return Response(item.rate)
		else:
			return Response(serializer.errors)

	def get(self, request, itemID):
		item = Item.objects.get(id=itemID)
		rates = UserRatedItemSerializer.setup_eager_loading(item.rated_item)  # Set up eager loading to avoid N+1 selects
		serializer = UserRatedItemSerializer(rates, many=True)
		return Response(serializer.data)
    ###
	# API endpoint that support item report
	# @param request for item report
	#
class ReportItem(APIView):
	def post(self, request, itemID):
		item = Item.objects.get(id= itemID)
		user = request.user
		try:
			report = Report.objects.filter(item=itemID, user = request.user.id).first()
		except Report.DoesNotExist:
			report = None
		if report:
			if request.data["report"]:
				return Response({"error" : "You already report this item"}, status=status.HTTP_403_FORBIDDEN)
			else:
				report.delete()
				return Response(len(item.get_reporters()))
		if not request.data["report"]:
			return Response({"error" : "You can't delete your item report  without report it"}, status=status.HTTP_403_FORBIDDEN)

		serializer = ReportSerializer(data=request.data, context={ 'user':user, 'item':item })
		if serializer.is_valid():
			serializer.save()
			return Response(len(item.get_reporters()))
		else:
			return Response(serializer.errors)

	def get(self, request, itemID):
		item = Item.objects.get(id=itemID)
		report = ReportSerializer.setup_eager_loading(item.reported_item)  # Set up eager loading to avoid N+1 selects
		serializer = ReportSerializer(report, many=True)
		return Response(serializer.data)

	###
	# API endpoint that returns little summary of a comment
	# @param request for summary for a comment
	#
class CommentDetailView(APIView):
	def delete(self, request, commentID):
		try:
			comment = Comment.objects.get(id=commentID)
		except Comment.DoesNotExist:
			comment = None

		if not comment:
			return Response({"error" : "We couldn't find comment with given ID:" + commentID}, status=status.HTTP_404_NOT_FOUND)

		if request.user.id == comment.written_by_id:
			comment.delete()
			return Response({"success" : "Your comment is deleted successfully"})
		return Response({"error" : "You can't delete other user's comments"} , status=status.HTTP_403_FORBIDDEN)

	###
	# API endpoint that returns detailed information of the timeline
	# @param request for detailed information of the timeline
	#
class TimelineDetailView(APIView):
	def delete(self, request, timelineID):
		try:
			timeline = Timeline.objects.get(id=timelineID)
		except Timeline.DoesNotExist:
			timeline = None

		if not timeline:
			return Response({"error" : "We couldn't find timeline with given ID:" + timelineID}, status=status.HTTP_404_NOT_FOUND)

		if request.user.id == timeline.created_by_id:
			timeline.delete()
			return Response({"success" : "Your timeline is deleted successfully"})
		return Response({"error" : "You can't delete other user's timelines"} , status=status.HTTP_403_FORBIDDEN)

	###
	# API endpoint that returns detailed information of the timeline
	# @param request for detailed information of the timeline
	#
class MediaDetailView(APIView):
	def delete(self, request, mediaID):
		try:
			media = Media.objects.get(id=mediaID)
		except Media.DoesNotExist:
			media = None

		if not media:
			return Response({"error" : "We couldn't find media with given ID:" + mediaID}, status=status.HTTP_404_NOT_FOUND)

		if request.user.id == media.created_by_id:
			media.delete()
			return Response({"success" : "Your media is deleted successfully"})
		return Response({"error" : "You can't delete other user's medias"} , status=status.HTTP_403_FORBIDDEN)

	###
	# API endpoint that enables adddting/deleting a tag
	# @param request for tag
	#
class ItemTag(APIView):
	def delete(self, request, itemID):
		item = Item.objects.get(id=itemID)
		tags = request.data.get('tags')
		for name in tags:
			try:
				tag = Tag.objects.get(name=name)
			except Tag.DoesNotExist:
				tag = None
			if tag is not None:
				item.tags.remove(tag)
		return Response({"success" : "Your tags are deleted successfully"})

	def post(self, request, itemID):
		item = Item.objects.get(id=itemID)
		tags = request.data.get('tags')
		for name in tags:
			newTag, created = Tag.objects.get_or_create(name = name, defaults={'created_by':request.user})
			item.tags.add(newTag)
		serializer = TagSerializer(item.tags, many=True)
		return Response(serializer.data)

	def get(self, request, itemID):
		item = Item.objects.get(id=itemID)
		serializer = TagSerializer(item.tags, many=True)
		return Response(serializer.data)

	###
	# API endpoint to support recommendation
	# @param request item liked bu a user
	#
class UserLikes(APIView):
	def get(self, request, userID):
		user = User.objects.get(id=userID);
		items = Item.objects.order_by('-created_at').filter(rated_item__user=user)
		items = ItemSerializer.setup_eager_loading(items)  # Set up eager loading to avoid N+1 selects
		serializer = ItemSerializer(items, many=True, context={'request': request})
		return Response(serializer.data)

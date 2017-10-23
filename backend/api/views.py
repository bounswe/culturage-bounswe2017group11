from django.http import HttpResponse, JsonResponse
from base.models import Item
from base.serializers import ItemSerializer
from base.serializers import UserSerializer
from rest_framework.parsers import JSONParser
from rest_framework_jwt.settings import api_settings
from rest_framework import viewsets
from rest_framework import permissions
from django.contrib.auth.models import User
from base.models import Profile

class ItemViewSet(viewsets.ModelViewSet):
	"""
    API endpoint that allows items to be viewed or edited.
    """
	queryset = Item.objects.all().order_by('-created_at')
	serializer_class = ItemSerializer
	permission_classes = (permissions.IsAuthenticated,)

	def perform_create(self, serializer):
		location = self.request.data.get('location');
		date = self.request.data.get('date');
		serializer.save(featured_img=self.request.data.get('image'), created_by=self.request.user, date = date, location = location)

def register(request):
	"""
    API endpoint that user can be registered.
    """
	if request.method == 'POST':
		data = JSONParser().parse(request)
		serializer = UserSerializer(data=data)
		if serializer.is_valid():
			user = serializer.save()
			jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
			jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER
			payload = jwt_payload_handler(user)
			token = jwt_encode_handler(payload)
			data = serializer.data
			data['token'] = token
			return JsonResponse(data, status=201)
		return JsonResponse(serializer.errors, status=400)
	return HttpResponse("GET method not allowed")


def addLoc(request):
	"""
    API endpoint that a location can be created.
    """
	if request.method == 'POST':
		data = JSONParser().parse(request)
		serializer = LocationSerializer(data=data)
		if serializer.is_valid():
			location = serializer.save()
			return JsonResponse(data, status=201)
		return JsonResponse(serializer.errors, status=400)
	return HttpResponse("GET method not allowed")
	
def profile(request, id):
	"""
    API endpoint that returns profile page.
    """
	if request.method == 'GET':
		us = User.objects.get(pk=id)
		username = us.username
		mail = us.email
		nameSurname = us.profile.nameSurname
		birthDay = us.profile.birthDay
		location = us.profile.location
		profilePhoto = us.profile.profilePhoto
		response_data = {}
		response_data["username"] = username
		response_data["mail"] = mail
		response_data["nameSurname"] = nameSurname
		response_data["birthDay"] = birthDay
		response_data["location"] = location
		response_data["profilePhoto"] = str(profilePhoto)
		return JsonResponse(response_data)
	return HttpResponse("POST method not allowed")


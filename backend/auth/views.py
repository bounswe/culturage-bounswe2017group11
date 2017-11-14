from django.http import HttpResponse, JsonResponse
from django.contrib.auth.models import User
from base.serializers import UserSerializer
from rest_framework.parsers import JSONParser
from rest_framework_jwt.settings import api_settings

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

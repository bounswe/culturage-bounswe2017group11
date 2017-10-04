from base.models import Item
from rest_framework import viewsets
from base.serializers import ItemSerializer
from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render
import json
class ItemViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = Item.objects.all().order_by('-created_at')
    serializer_class = ItemSerializer

def register(request):
	body_unicode = request.body.decode('utf-8')
	body = json.loads(body_unicode)
	# first_name = body['firstName']
	# last_name = body['lastName']
	# email = body['email']
	# entrance = body['entrance']
	# department = "CMPE"
	# student = Student(name= first_name + " " + last_name, email=email, entrance=entrance, department=department)
	# student.save()
	return HttpResponse(body)


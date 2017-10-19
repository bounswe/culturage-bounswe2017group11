from base.models import Item, Location
from django.contrib.auth.models import User
from rest_framework import serializers
from rest_framework.validators import UniqueValidator

class ItemSerializer(serializers.HyperlinkedModelSerializer):
	class Meta:
		model = Item
		fields = ('id','name', 'description', 'featured_img', 'rate', 'created_at')


class UserSerializer(serializers.Serializer):
	id = serializers.IntegerField(read_only=True)
	username = serializers.CharField(required=True, max_length=100, validators=[UniqueValidator(queryset=User.objects.all())])
	email = serializers.CharField(required=True, max_length=100, validators=[UniqueValidator(queryset=User.objects.all())])
	password = serializers.CharField(required=True, max_length=100)
	class Meta:
		model = User
		fields = ('id','username','email','password')

	def create(self, validated_data):
		"""
		Create and return a new `Location` instance, given the validated data.
		"""
		user = User(
			username=validated_data['username'],
			email=validated_data['email'],
		)
		user.set_password(validated_data['password'])
		user.save()
		return user

class LocationSerializer(serializers.Serializer):
	id = serializers.IntegerField(read_only=True)
	name = serializers.CharField(required=True, max_length=200)
	class Meta:
		model = Location
		fields =('id','name','longtitude','latitude')



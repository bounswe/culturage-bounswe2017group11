from base.models import Item, Location, Timeline
from django.contrib.auth.models import User
from rest_framework import serializers
from rest_framework.validators import UniqueValidator

class UserSerializer(serializers.Serializer):
	id = serializers.IntegerField(read_only=True)
	username = serializers.CharField(required=True, max_length=100, validators=[UniqueValidator(queryset=User.objects.all())])
	email = serializers.CharField(required=True, max_length=100, validators=[UniqueValidator(queryset=User.objects.all())])
	password = serializers.CharField(required=True, max_length=100)
	class Meta:
		model = User
		fields = ('id','username','email')

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

class TimelineSerializer(serializers.Serializer):
	id = serializers.IntegerField(read_only=True)
	name = serializers.CharField(required=True, max_length=200)
	startDate = serializers.CharField(required=True, max_length=200)
	location = LocationSerializer(required=False)
	class Meta:
		model = Location
		fields =('id','name','text','startDate', 'endDate')

class ItemSerializer(serializers.ModelSerializer):
	created_by = UserSerializer(required=False)
	timelines = TimelineSerializer(many=True, read_only=True)
	class Meta:
		model = Item
		fields = ('id','name', 'description', 'featured_img', 'timelines', 'rate', 'created_at', 'created_by')

	def create(self, validated_data):
		location_name = validated_data.pop('location')
		date = validated_data.pop('date')
		item = Item.objects.create(**validated_data)
		location, created = Location.objects.get_or_create(name = location_name)
		Timeline.objects.create(item=item, startDate = date, location = location, name = "Item is created")
		return item


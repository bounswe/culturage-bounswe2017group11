from base.models import Item, Location, Timeline, Tag, Comment, UserRatedItem
from django.db.models import Count, Min, Sum, Avg
from django.contrib.auth.models import User
from django.db.models import Prefetch
from rest_framework import serializers
from rest_framework.validators import UniqueValidator

class UserSerializer(serializers.Serializer):
	id = serializers.IntegerField(read_only=True)
	username = serializers.CharField(required=True, max_length=100, validators=[UniqueValidator(queryset=User.objects.all())])
	email = serializers.EmailField(required=True, max_length=100, validators=[UniqueValidator(queryset=User.objects.all())])
	password = serializers.CharField(required=True, max_length=100, write_only=True)
	class Meta:
		model = User
		fields = ('id','username','email', 'password')

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

class TagSerializer(serializers.Serializer):
	id = serializers.IntegerField(read_only=True)
	name = serializers.CharField(required=True, max_length=200)
	created_by = UserSerializer(required=False)
	class Meta:
		model = Tag
		fields =('id','name','created_by')

class TimelineSerializer(serializers.Serializer):
	id = serializers.IntegerField(read_only=True)
	name = serializers.CharField(required=True, max_length=200)
	startDate = serializers.CharField(required=True, max_length=200)
	location = LocationSerializer(required=False)
	class Meta:
		model = Location
		fields =('id','name','text','startDate', 'endDate')

class CommentSerializer(serializers.ModelSerializer):
	written_by= UserSerializer( required = False)
	#related_item= ItemSerializer(required = False)
	class Meta:
		model = Comment
		fields = ('id','text','written_by','related_item','rate','created_at')
	def create(self, validated_data):
		item = self.context.get('related_item')
		user = self.context.get('written_by')
		comment = Comment.objects.create(**validated_data)
		comment.related_item = item
		comment.written_by = user
		comment.save()
		return comment


class ItemSerializer(serializers.ModelSerializer):
	created_by = UserSerializer(required=False)
	timelines = TimelineSerializer(many=True, read_only=True)
	tags = TagSerializer(many=True, read_only=True)
	raters = serializers.SerializerMethodField('_get_raters')
	is_rated = serializers.SerializerMethodField('_get_is_rated')
	comments = serializers.SerializerMethodField('_get_comments')

	class Meta:
		model = Item
		fields = ('id','name', 'description', 'featured_img', 'timelines', 'tags', 'rate', 'created_at', 'created_by', 'comments', 'raters', 'is_rated')

	def _get_comments(self, item):
		serializer = CommentSerializer(item.commented_item, many=True)
		return serializer.data

	def _get_raters(self, item):
		serializer = UserRatedItemSerializer(item.rated_item, many=True)
		return [i["user"] for i in serializer.data]

	def _get_is_rated(self, item):
		user = self.context['request'].user
		raters = self._get_raters(item)
		return user.id in raters

	def create(self, validated_data):
		location_name = validated_data.pop('location')
		date = validated_data.pop('date')
		tags = validated_data.pop('tags')
		item = Item.objects.create(**validated_data)
		if location_name:
			location, created = Location.objects.get_or_create(name = location_name)
		else:
			location = None
		Timeline.objects.create(item=item, startDate = date, location = location, name = "Item is created")
		for tag_name in tags:
			tag, created = Tag.objects.get_or_create(name = tag_name, defaults={'created_by': item.created_by})
			item.tags.add(tag)
		return item

class UserRatedItemSerializer(serializers.ModelSerializer):
	class Meta:
		model = UserRatedItem
		fields = ('id','rate','user','item')

	def create(self, validated_data):
		user = self.context.get('user')
		item = self.context.get('item')

		userRatedItem = UserRatedItem.objects.create(**validated_data)
		userRatedItem.user = user
		userRatedItem.item = item
		userRatedItem.save()

		# new rate calculation
		new_rate = UserRatedItem.objects.filter(item_id = item.id).aggregate(rate=Avg('rate'))["rate"]
		item.rate = new_rate
		item.save()
		return  userRatedItem

class NewsfeedSerializer(serializers.ModelSerializer):
	raters = serializers.SerializerMethodField('_get_raters')
	is_rated = serializers.SerializerMethodField('_get_is_rated')

	def _get_raters(self, item):
		serializer = UserRatedItemSerializer(item.rated_item, many=True)
		return [i["user"] for i in serializer.data]

	def _get_is_rated(self, item):
		user = self.context['request'].user
		raters = self._get_raters(item)
		return user.id in raters

	@staticmethod
	def setup_eager_loading(queryset):
		""" Perform necessary eager loading of data. """
		queryset = queryset.prefetch_related('rated_item')
		return queryset

	class Meta:
		model = Item
		fields = ('id', 'name', 'description', 'featured_img', 'created_at', 'raters', 'is_rated')


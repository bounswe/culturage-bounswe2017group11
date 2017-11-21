from base.models import Item, Location, Timeline, Tag, Comment, UserRatedItem
from django.contrib.auth.models import User
from django.conf import settings
from django.db.models import Prefetch
from rest_framework import serializers
from rest_framework.validators import UniqueValidator

class ProfileSerializer(serializers.Serializer):
	class Meta:
		model = Tag
		fields =('id','fullName','location', 'birthday', 'moderatorDate', 'photo')

class UserSerializer(serializers.Serializer):
	id = serializers.IntegerField(read_only=True)
	username = serializers.CharField(required=True, max_length=100, validators=[UniqueValidator(queryset=User.objects.all())])
	email = serializers.EmailField(required=True, max_length=100, validators=[UniqueValidator(queryset=User.objects.all())])
	password = serializers.CharField(required=True, max_length=100, write_only=True)
	fullName = serializers.SerializerMethodField('_get_fullName')
	location = serializers.SerializerMethodField('_get_location')
	birthday = serializers.SerializerMethodField('_get_birthday')
	photo = serializers.SerializerMethodField('_get_photo')

	class Meta:
		model = User
		fields = ('id','username','email', 'password', 'profile', 'full_name', 'location', 'birthday', 'photo')

	def _get_fullName(self, obj):
		return obj.profile.fullName if hasattr(obj, 'profile') else None

	def _get_location(self, obj):
		return obj.profile.location if hasattr(obj, 'profile') else None

	def _get_birthday(self, obj):
		return obj.profile.birthday if hasattr(obj, 'profile') else None

	def _get_photo(self, obj):
		if hasattr(obj, 'profile'):
			if obj.profile.photo:
				return settings.CURRENT_DOMAIN + obj.profile.photo.url
		return None

	@staticmethod
	def setup_eager_loading(queryset):
		""" Perform necessary eager loading of data. """
		queryset = queryset.prefetch_related('profile')
		return queryset

	def create(self, validated_data):
		"""
		Create and return a new `User` instance, given the validated data.
		"""
		user = User(
			username=validated_data['username'],
			email=validated_data['email'],
		)
		user.set_password(validated_data['password'])
		user.save()
		return user

class LocationSerializer(serializers.ModelSerializer):
	id = serializers.IntegerField(read_only=True)
	name = serializers.CharField(required=True, max_length=200)
	class Meta:
		model = Location
		fields =('id','name')

class TagSerializer(serializers.ModelSerializer):
	id = serializers.IntegerField(read_only=True)
	name = serializers.CharField(required=True, max_length=200)
	# created_by = UserSerializer(required=False)
	class Meta:
		model = Tag
		fields =('id','name','created_by')

	@staticmethod
	def setup_eager_loading(queryset):
		""" Perform necessary eager loading of data. """
		# queryset = queryset.prefetch_related('created_by', 'created_by__profile')
		return queryset

class TimelineSerializer(serializers.ModelSerializer):
	id = serializers.IntegerField(read_only=True)
	name = serializers.CharField(required=True, max_length=200)
	text = serializers.CharField(required=False)
	startDate = serializers.CharField(required=True, max_length=200)
	location = LocationSerializer(required=False, read_only=True)
	class Meta:
		model = Timeline
		fields =('id','name','text','startDate', 'endDate', 'location')

	def create(self, validated_data):
		item = self.context.get('item')
		user = self.context.get('user')
		location = self.context.get('location')
		timeline = Timeline.objects.create(**validated_data)
		timeline.item = item
		timeline.created_by = user
		timeline.location = location
		timeline.save()
		return timeline


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
	comment_count = serializers.SerializerMethodField('_get_comment_count')

	@staticmethod
	def setup_eager_loading(queryset):
		""" Perform necessary eager loading of data. """
		queryset = queryset.prefetch_related(
			'created_by', 'created_by__profile', 'timelines', 'timelines__location', 'tags', 'commented_item', 'commented_item__written_by', 'commented_item__written_by__profile', 'rated_item', 'rated_item__user', 'rated_item__user__profile'
		)
		return queryset

	class Meta:
		model = Item
		fields = ('id','name', 'description', 'featured_img', 'timelines', 'tags', 'rate', 'created_at', 'created_by', 'comments', 'raters', 'is_rated', 'comment_count')

	def _get_comments(self, item):
		serializer = CommentSerializer(item.commented_item, many=True)
		return serializer.data

	def _get_comment_count(self, item):
		return len(item.get_commenters())

	def _get_raters(self, item):
		serializer = UserRatedItemSerializer(item.rated_item, many=True)
		return [i["user"] for i in serializer.data]

	def _get_is_rated(self, item):
		user = self.context['request'].user
		raters = item.get_raters()
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
	user = UserSerializer(required=False)

	class Meta:
		model = UserRatedItem
		fields = ('id','rate','user','item')

	@staticmethod
	def setup_eager_loading(queryset):
		""" Perform necessary eager loading of data. """
		queryset = queryset.prefetch_related('user', 'user__profile')
		return queryset

	def create(self, validated_data):
		user = self.context.get('user')
		item = self.context.get('item')

		userRatedItem = UserRatedItem.objects.create(**validated_data)
		userRatedItem.user = user
		userRatedItem.item = item
		userRatedItem.save()

		item.calculateRate()
		return  userRatedItem

class NewsfeedSerializer(serializers.ModelSerializer):
	comment_count = serializers.SerializerMethodField('_get_comment_count')
	is_rated = serializers.SerializerMethodField('_get_is_rated')

	def _get_comment_count(self, item):
		return len(item.get_commenters())

	def _get_is_rated(self, item):
		user = self.context['request'].user
		raters = item.get_raters()
		return user.id in raters

	@staticmethod
	def setup_eager_loading(queryset):
		""" Perform necessary eager loading of data. """
		queryset = queryset.prefetch_related('rated_item', 'commented_item')
		return queryset

	class Meta:
		model = Item
		fields = ('id', 'name', 'rate', 'description', 'featured_img', 'created_at', 'is_rated', 'comment_count')


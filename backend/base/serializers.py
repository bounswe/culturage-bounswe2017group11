from base.models import Item, Location, Timeline, Tag, Comment, UserRatedItem, Media, TagList, Annotation
from django.contrib.auth.models import User
from django.conf import settings
from django.db.models import Prefetch
from rest_framework import serializers
from rest_framework.validators import UniqueValidator
import os, calendar, json

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
	def create(self, validated_data):
		item = self.context.get('item')
		tag = validated_data.pop('name')
		newTag, created = Tag.objects.get_or_create(name = tag, defaults={'created_by': item.created_by})
		#taglistunit, created = TagList.objects.get_or_create(item=item, tag = tag)
		item.tags.add(newTag)
		return item

class TimelineSerializer(serializers.ModelSerializer):
	id = serializers.IntegerField(read_only=True)
	name = serializers.CharField(required=True, max_length=200)
	text = serializers.CharField(required=False)
	startDate = serializers.CharField(required=True, max_length=200)
	startLabel = serializers.SerializerMethodField('_get_start_label')
	endLabel = serializers.SerializerMethodField('_get_end_label')
	location = LocationSerializer(required=False, read_only=True)
	class Meta:
		model = Timeline
		fields =('id','name','text','startDate', 'endDate', 'location', 'startLabel', 'endLabel')

	def _get_start_label(self, obj):
		if obj.startDate is None:
			return None
		else:
			date = obj.startDate
			result = ""
			if date[0] == "-":
				date = date[1:]
				result += "BC"
			year, month, day = date.split("-")
			if day != "00":
				result = result + " " + str(int(day))
			if month != "00":
				result = result + " " + calendar.month_name[int(month)]
			if year != "0000":
				result = result + " " + str(int(year))
			return result.strip()

	def _get_end_label(self, obj):
		if obj.endDate is None:
			return None
		else:
			date = obj.endDate
			result = ""
			if date[0] == "-":
				date = date[1:]
				result += "BC"
			year, month, day = date.split("-")
			if day != "00":
				result = result + " " + str(int(day))
			if month != "00":
				result = result + " " + calendar.month_name[int(month)]
			if year != "0000":
				result = result + " " + str(int(year))
			return result.strip()

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

class AnnotationSerializer(serializers.ModelSerializer):
	text = serializers.CharField(required=True)
	x = serializers.IntegerField(required=True)
	y = serializers.IntegerField(required=True)
	w = serializers.IntegerField(required=True)
	h = serializers.IntegerField(required=True)
	user = UserSerializer( required = False)
	jsonld = serializers.SerializerMethodField('_get_json')

	class Meta:
		model = Media
		fields =('id','text', 'x', 'y', 'w', 'h', 'user', 'jsonld')

	def _get_json(self, obj):
		jld = {
			"@context": "http://www.w3.org/ns/anno.jsonld",
			"id": settings.CURRENT_DOMAIN + "/annotations/" + str(obj.id) ,
			"type": "Annotation",
			"body": obj.text,
			"target": {
				"id": obj.media.get_file_url() + "#xywh=" + str(obj.x) + "," + str(obj.y) + "," + str(obj.w) + "," + str(obj.h) ,
				"type": "Image",
				"format": "image/jpeg"
			}
		}
		return jld

	def create(self, validated_data):
		media = self.context.get('media')
		user = self.context.get('user')
		validated_data['media'] = media
		validated_data['user'] = user
		annotation = Annotation.objects.create(**validated_data)
		return annotation

class MediaSerializer(serializers.ModelSerializer):
	name = serializers.CharField(required=False)
	mediaType = serializers.CharField(required=False)
	extension = serializers.CharField(required=False)
	file = serializers.FileField(required=False)
	file_url = serializers.SerializerMethodField('_get_file_url')
	url = serializers.URLField(required=False)
	annotations = serializers.SerializerMethodField('_get_annotations')

	class Meta:
		model = Media
		fields =('id','name', 'extension', 'mediaType', 'file', 'url', 'file_url', 'annotations')

	def _get_file_url(self, obj):
		if obj.file:
			return settings.CURRENT_DOMAIN + obj.file.url

	def _get_annotations(self, item):
		serializer = AnnotationSerializer(item.annotated_media, many=True)
		return serializer.data

	def create(self, validated_data):
		item = self.context.get('item')
		user = self.context.get('user')
		file = validated_data.get('file');
		url = validated_data.get('url');
		if file:
			name, extension = os.path.splitext(file.name)
			extension = extension.replace('.','').lower()
			validated_data['name'] = name
			validated_data['extension'] = extension
			if extension in ['jpg', 'jpeg', 'png', 'gif']:
				validated_data['mediaType'] = "image"
			elif extension in ['mp4', 'mov', 'avi', '3gp', 'mkv']:
				validated_data['mediaType'] = "video"
			elif extension in ['mp3', 'aav']:
				validated_data['mediaType'] = "audio"
			elif extension in ['pdf', 'txt']:
				validated_data['mediaType'] = "document"
			else:
				raise serializers.ValidationError({ "file": "Not supported file type"})
		elif url:
			if "youtu" in url:
				validated_data['extension'] = "youtube"
				validated_data['mediaType'] = "video"
			else:
				raise serializers.ValidationError({ "url": "Only Youtube links are allowed." })

		else:
			raise serializers.ValidationError({ "file": "This field or URL field is required." , "url": "This field or file field is required." })
		validated_data['item'] = item
		validated_data['created_by'] = user
		media = Media.objects.create(**validated_data)
		# media.item = item
		# media.created_by = user
		# media.save()
		return media

class ItemSerializer(serializers.ModelSerializer):
	created_by = UserSerializer(required=False)
	timelines = TimelineSerializer(many=True, read_only=True)
	tags = TagSerializer(many=True, read_only=True)
	raters = serializers.SerializerMethodField('_get_raters')
	is_rated = serializers.SerializerMethodField('_get_is_rated')
	comments = serializers.SerializerMethodField('_get_comments')
	medias = serializers.SerializerMethodField('_get_medias')
	comment_count = serializers.SerializerMethodField('_get_comment_count')

	@staticmethod
	def setup_eager_loading(queryset):
		""" Perform necessary eager loading of data. """
		queryset = queryset.prefetch_related(
			'created_by', 'created_by__profile', 'timelines', 'timelines__location', 'tags', 'commented_item', 'commented_item__written_by', 'commented_item__written_by__profile', 'rated_item', 'rated_item__user', 'rated_item__user__profile', 'media_item', 'media_item__annotated_media'
		)
		return queryset

	class Meta:
		model = Item
		fields = ('id','name', 'description', 'featured_img', 'timelines', 'tags', 'rate', 'created_at', 'created_by', 'comments', 'raters', 'is_rated', 'comment_count', 'medias', 'created_at')

	def _get_comments(self, item):
		serializer = CommentSerializer(item.commented_item, many=True)
		return serializer.data

	def _get_medias(self, item):
		serializer = MediaSerializer(item.media_item, many=True)
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
			taglist, created = TagList.objects.get_or_create(tag = tag, item = item)
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

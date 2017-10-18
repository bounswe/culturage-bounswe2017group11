from django.db import models
from django.contrib.auth.models import User

class Item(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField(null=True)
    featured_img = models.FileField(upload_to='item', null=True)
    rate = models.IntegerField(null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True)
    created_by = models.ForeignKey(User, related_name='items_created', on_delete=models.SET_NULL, null=True)
    updated_by = models.ForeignKey(User, related_name='items_updated', on_delete=models.SET_NULL, null=True)

class Comment(models.Model):
    text = models.CharField(max_length=500)
    rate = models.IntegerField(null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True)
    written_by = models.ForeignKey(User, related_name='comment_written_by', on_delete=models.SET_NULL, null=True)
    related_item = models.ForeignKey(Item, related_name='commented_item', on_delete=models.CASCADE, null=True)

class Annotation(models.Model):
	text = models.CharField(max_length=500)
	rate = models.IntegerField(null=True)
	user_id = models.ForeignKey(User, related_name ='annotating_user', on_delete= models.CASCADE, null = True)
	item_id = models.ForeignKey(Item, related_name ='annotated_item', on_delete=models.CASCADE, null = True)

class Tag(models.Model):
	name = models.CharField(max_length=200)
	user_id = models.ForeignKey(User, related_name ='tagging_user', on_delete= models.SET_NULL, null = True)

class Location(models.Model):
	name = models.CharField(max_length=200)
	longtitude = models.FloadField(null = true)
	latitude = models.FloadField(null = true)

class Timeline(models.Model):
	name = models.CharField(max_length=200)
	text = models.CharField(max_length=500)
	startDate = models.DateTimeField(auto_now_add = true)
	endDate = models.DateTimeField(auto_now_add = true)
	item_id = models.ForeignKey(Item, related_name = 'timeline_of_item', on_delete= models.CASCADE, null = True)
	location_id = models.ForeignKey(Location, related_name = 'timeline_location', on_delete = SET_NULL, null = True)

class Follow(models.Model):
	follower = models.ForeignKey(User, related_name ='user_follower', on_delete=models.CASCADE, null=True)
	followed = models.ForeignKey(User, related_name ='user_followed', on_delete=models.CASCADE, null=True)

class ItemFollow(models.Model):
	user_id = models.ForeignKey(User, related_name ='following_user', on_delete= models.CASCADE, null = True)
	item_id = models.ForeignKey(Item, related_name ='followed_item', on_delete=models.CASCADE, null = True)

class Reported(models.Model):
	user_id = models.ForeignKey(User, related_name ='reporter_user', on_delete= models.CASCADE, null = True)
	item_id = models.ForeignKey(Item, related_name ='reported_item', on_delete=models.CASCADE, null = True)

class ItemEdit(models.Model):
	user_id = models.ForeignKey(User, related_name ='editing_user', on_delete= models.CASCADE, null = True)
	item_id = models.ForeignKey(Item, related_name ='edited_item', on_delete=models.CASCADE, null = True)

class UserRatedItem(models.Model):
	rate = models.IntegerField(null=True)
	user_id = models.ForeignKey(User, related_name ='item_rating_user', on_delete= models.CASCADE, null = True)
	item_id = models.ForeignKey(Item, related_name ='rated_item', on_delete=models.CASCADE, null = True)

class UserRatedComment(models.Model):
	rate = models.IntegerField(null=True)
	user_id = models.ForeignKey(User, related_name ='comment_rating_user', on_delete= models.CASCADE, null = True)
	comment_id = models.ForeignKey(Comment, related_name ='rated_comment', on_delete= models.CASCADE, null = True)

class UserRatedAnnotation(models.Model):
	rate = models.IntegerField(null=True)
	user_id = models.ForeignKey(User, related_name ='annotation_rating_user', on_delete= models.CASCADE, null = True)
	annotation_id = models.ForeignKey (Annotation, related_name ='rated_annotation', on_delete=models.CASCADE, null= True)

class TagList(models.Model):
	item_id = models.ForeignKey(Item, related_name ='tagged_item', on_delete=models.CASCADE, null = True)
	tag_id = models.ForeignKey(Tag, related_name = 'tag', on_delete = models.CASCADE, null = True)

class Media(models.Model):
	mediaType = models.CharField(max_length=100)
	formatExtend = models.CharField(max_length=100)
	name = models.CharField(max_length = 200)
	item_id = models.ForeignKey(Item, related_name = 'media_item', on_delete = models.CASCADE, null =True)

class VideoAnno(models.Model):
	text = models.CharField (max_length = 500)
	startTime = models.TimeField(null = True)
	endTime = models.TimeField(null = True)
	media_id = models.ForeignKey(Media, related_name = 'video_media', on_delete = models.CASCADE, null= True)
	annotation_id = models.ForeignKey(Annotation, related_name = 'video_annotation', on_delete = models.CASCADE, null=True)

class AudioAnno(models.Model):
	text = models.CharField (max_length = 500)
	startTime = models.TimeField(null = True)
	endTime = models.TimeField(null = True)
	media_id = models.ForeignKey(Media, related_name = 'audio_media', on_delete = models.CASCADE, null= True)
	annotation_id = models.ForeignKey(Annotation, related_name = 'audio_annotation', on_delete = models.CASCADE, null=True)

class ImageAnno(models.Model):
	text = models.CharField (max_length = 500)
	pixelX = models.IntegerField(null = True)
	pixelY = models.IntegerField(null = True)
	media_id = models.ForeignKey(Media, related_name = 'image_media', on_delete = models.CASCADE, null= True)
	annotation_id = models.ForeignKey(Annotation, related_name = 'image_annotation', on_delete = models.CASCADE, null=True)

class TextAnno(models.Model):
	text = models.CharField (max_length = 500)
	startChar = models.TimeField(null = True)
	endChar = models.TimeField(null = True)
	media_id = models.ForeignKey(Media, related_name = 'text_media', on_delete = models.CASCADE, null= True)
	annotation_id = models.ForeignKey(Annotation, related_name = 'text_annotation', on_delete = models.CASCADE, null=True)















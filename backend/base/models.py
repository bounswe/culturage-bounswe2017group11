from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

class Item(models.Model):
	name = models.CharField(max_length=200)
	description = models.TextField(null=True,blank=True)
	featured_img = models.FileField(upload_to='item', null=True, blank=True)
	rate = models.IntegerField(null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True, blank=True)
	updated_at = models.DateTimeField(null=True, blank=True)
	created_by = models.ForeignKey(User, related_name='items_created', on_delete=models.SET_NULL, null=True)
	updated_by = models.ForeignKey(User, related_name='items_updated', on_delete=models.SET_NULL, null=True)
	def __str__(self):
		return self.name

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    fullName = models.CharField(max_length=500, blank=True, null=True)
    location = models.CharField(max_length=500, blank=True, null=True)
    birthday = models.DateField(auto_now_add = False, null = True, blank=True)
    moderatorDate = models.DateTimeField(null=True, blank=True)
    photo = models.FileField(upload_to='profile', null=True, blank=True)

@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)

@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


class Comment(models.Model):
	text = models.CharField(max_length=500)
	rate = models.IntegerField(null=True, blank=True)
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(null=True, blank=True)
	written_by = models.ForeignKey(User, related_name='comment_written_by', on_delete=models.SET_NULL, null=True)
	related_item = models.ForeignKey(Item, related_name='commented_item', on_delete=models.CASCADE, null=True)

class Annotation(models.Model):
	text = models.CharField(max_length=500)
	rate = models.IntegerField(null=True, blank=True)
	user_id = models.ForeignKey(User, related_name ='annotating_user', on_delete= models.CASCADE, null = True)
	item_id = models.ForeignKey(Item, related_name ='annotated_item', on_delete=models.CASCADE, null = True)

class Tag(models.Model):
	name = models.CharField(max_length=200)
	user_id = models.ForeignKey(User, related_name ='tagging_user', on_delete= models.SET_NULL, null = True)

class Location(models.Model):
	name = models.CharField(max_length=200)
	longtitude = models.FloatField(null = True, blank=True)
	latitude = models.FloatField(null = True, blank=True)
	def __str__(self):
		return self.name

class Timeline(models.Model):
	name = models.CharField(max_length=200)
	text = models.CharField(max_length=500, null = True, blank=True)
	startDate = models.DateField(auto_now_add = False, null = True, blank=True)
	endDate = models.DateField(auto_now_add = False, null = True, blank=True)
	item = models.ForeignKey(Item, related_name = 'timelines', on_delete= models.CASCADE, null= True)
	location = models.ForeignKey(Location, related_name = 'timeline_location', on_delete = models.SET_NULL, null = True)
	def __str__(self):
		return self.name + " - " + self.startDate.strftime("%d.%m.%Y")

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
	rate = models.IntegerField(null=True, blank=True)
	user_id = models.ForeignKey(User, related_name ='item_rating_user', on_delete= models.CASCADE, null = True)
	item_id = models.ForeignKey(Item, related_name ='rated_item', on_delete=models.CASCADE, null = True)

class UserRatedComment(models.Model):
	rate = models.IntegerField(null=True, blank=True)
	user_id = models.ForeignKey(User, related_name ='comment_rating_user', on_delete= models.CASCADE, null = True)
	comment_id = models.ForeignKey(Comment, related_name ='rated_comment', on_delete= models.CASCADE, null = True)

class UserRatedAnnotation(models.Model):
	rate = models.IntegerField(null=True, blank=True)
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
	startTime = models.TimeField(null = True, blank=True)
	endTime = models.TimeField(null = True, blank=True)
	media_id = models.ForeignKey(Media, related_name = 'video_media', on_delete = models.CASCADE, null= True)
	annotation_id = models.ForeignKey(Annotation, related_name = 'video_annotation', on_delete = models.CASCADE, null=True)

class AudioAnno(models.Model):
	text = models.CharField (max_length = 500)
	startTime = models.TimeField(null = True, blank=True)
	endTime = models.TimeField(null = True, blank=True)
	media_id = models.ForeignKey(Media, related_name = 'audio_media', on_delete = models.CASCADE, null= True)
	annotation_id = models.ForeignKey(Annotation, related_name = 'audio_annotation', on_delete = models.CASCADE, null=True)

class ImageAnno(models.Model):
	text = models.CharField (max_length = 500)
	pixelX = models.IntegerField(null = True, blank=True)
	pixelY = models.IntegerField(null = True, blank=True)
	media_id = models.ForeignKey(Media, related_name = 'image_media', on_delete = models.CASCADE, null= True)
	annotation_id = models.ForeignKey(Annotation, related_name = 'image_annotation', on_delete = models.CASCADE, null=True)

class TextAnno(models.Model):
	text = models.CharField (max_length = 500)
	startChar = models.TimeField(null = True, blank=True)
	endChar = models.TimeField(null = True, blank=True)
	media_id = models.ForeignKey(Media, related_name = 'text_media', on_delete = models.CASCADE, null= True)
	annotation_id = models.ForeignKey(Annotation, related_name = 'text_annotation', on_delete = models.CASCADE, null=True)

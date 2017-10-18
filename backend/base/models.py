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
    text = models.CharField(max_length=300)
    rate = models.IntegerField(null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True)
    written_by = models.ForeignKey(User, related_name='comment_written_by', on_delete=models.SET_NULL, null=True)
    related_item = models.ForeignKey(Item, related_name='commented_item', on_delete=models.SET_NULL, null=True)

class Follow(models.Model):
	follower = models.ForeignKey(User, related_name ='user_follower', on_delete=models.CASCADE, null=True)
	followed = models.ForeignKey(User, related_name ='user_followed', on_delete=models.CASCADE, null=True)

class ItemFollow(models.Model):
	user_id = models.ForeignKey(User, related_name ='following_user', on_delete= models.CASCADE, null = True)
	item_id = models.ForeignKey(Item, related_name ='followed_item', on_delete=models.CASCADE, null = True)

	
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

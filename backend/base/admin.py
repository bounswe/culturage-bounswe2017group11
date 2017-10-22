from django.contrib import admin

# Register your models here.

from django.contrib import admin
from .models import Item
from .models import Timeline
from .models import Location

# Register your models here.
class ItemAdmin(admin.ModelAdmin):
    list_display = ('id','name','featured_img', 'created_by')
    list_filter = ['created_by']
    search_fields = ['name','description']

class TimelineAdmin(admin.ModelAdmin):
    list_display = ('id','name','startDate', 'item', 'location')
    list_filter = ['location', 'item']
    search_fields = ['name','startDate']

class LocationAdmin(admin.ModelAdmin):
    list_display = ('id','name')
    search_fields = ['name']

admin.site.register(Item, ItemAdmin)
admin.site.register(Timeline, TimelineAdmin)
admin.site.register(Location, LocationAdmin)

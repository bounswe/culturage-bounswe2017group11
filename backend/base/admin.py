from django.contrib import admin

# Register your models here.

from django.contrib import admin
from django.contrib.auth.models import User
from .models import Item
from .models import Timeline
from .models import Location
from .models import Profile

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

class ProfileAdmin(admin.ModelAdmin):
    list_display = ('id','fullName')
    search_fields = ['fullName']

class ProfileInline(admin.StackedInline):
    model = Profile

class UserAdmin(admin.ModelAdmin):
    list_display = ('id','username', 'email')
    search_fields = ['username']
    inlines = [ProfileInline]


admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.register(Item, ItemAdmin)
admin.site.register(Timeline, TimelineAdmin)
admin.site.register(Location, LocationAdmin)
admin.site.register(Profile, ProfileAdmin)

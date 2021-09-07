from django.contrib import admin
from app.models import Category,Product,Config,Hotel,Room,User,Comment,Note,Order

class ProductAdmin(admin.ModelAdmin):
    list_filter = ('category', )

class RoomAdmin(admin.ModelAdmin):
    list_filter = ('hotel', )

class OrderAdmin(admin.ModelAdmin):
    list_filter = ('hotel', )

class CommentAdmin(admin.ModelAdmin):
    list_filter = ('product', )

admin.site.site_header = '旅游网后台管理'
admin.site.site_title = '旅游网后台管理'
admin.site.register(Product,ProductAdmin)
admin.site.register(Room,RoomAdmin)
admin.site.register(Order,OrderAdmin)
admin.site.register(Comment,CommentAdmin)
admin.site.register([Category,Config,Hotel,User,Note])
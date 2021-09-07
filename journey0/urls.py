"""journey URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path
from django.views.static import serve
from journey.settings import MEDIA_ROOT
from app import views_product as productViews
from app import views_hotel as hotelViews
from app import views_login as loginViews
from app import views_note as noteViews
from app import views_center as centerViews

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', productViews.index),
    path('index/', productViews.index),
    path('product/', productViews.product),
    path('product/list/<int:cat>/', productViews.list),
    path('product/search/', productViews.search),
    path('product/detail/<int:id>/', productViews.detail),
    path('product/saveComment/', productViews.saveComment),
    path('product/commentList/<int:id>/', productViews.commentList),
    path('hotel/', hotelViews.index),
    path('hotel/search/', hotelViews.search),
    path('hotel/detail/<int:id>/', hotelViews.detail),
    path('hotel/saveOrder/', hotelViews.saveOrder),
    path('note/', noteViews.index),
    path('note/search/', noteViews.search),
    path('note/detail/<int:id>/', noteViews.detail),
    path('login/', loginViews.login),
    path('register/', loginViews.register),
    path('logout/', loginViews.logout),
    path('center/', centerViews.index),
    path('center/index/', centerViews.index),
    path('center/profile/', centerViews.profile),
    path('center/editPass/', centerViews.editPass),
    path('center/evaluated/', centerViews.evaluated),
    path('center/orderList/', centerViews.orderList),
    path('center/delOrder/<int:id>/', centerViews.delOrder),
    re_path(r'^media/(?P<path>.*)$', serve, {'document_root':MEDIA_ROOT}),
]

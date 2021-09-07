from django.shortcuts import render,redirect,HttpResponse
from django.db.models import Q
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from app.models import Category,Config,Hotel,Room,Comment,User,Order
import json

# 酒店主页
def index(request):
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()
    # 取得所有的酒店
    hotels=Hotel.objects.all()
    # 分页
    paginator = Paginator(hotels, 10) # 每页条数
    page = request.GET.get('page')
    try:
        hotels = paginator.page(page) # contacts为Page对象！
    except PageNotAnInteger:
        # 如果页码不是整数, 跳转到第一页
        hotels = paginator.page(1)
    except EmptyPage:
        # 如果页码超出了范围, 跳转到最后一页
        hotels = paginator.page(paginator.num_pages)
    return render(request,"hotel.html",locals())

# 酒店详细
def detail(request,id=None):
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()
    # 取得所有的景点
    hotel=Hotel.objects.get(id=id)
    rooms= Room.objects.filter(hotel_id=id)
    return render(request,"hotelDetail.html",locals())

# 酒店检索
def search(request):
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()
    # 匹配机票
    key = request.GET.get('key')
    hotels=Hotel.objects.filter(Q(name__contains=key) | Q(city__contains=key) | Q(address__contains=key ))
    # 分页
    paginator = Paginator(hotels, 10) # 每页条数
    page = request.GET.get('page')
    try:
        hotels = paginator.page(page) # contacts为Page对象！
    except PageNotAnInteger:
        # 如果页码不是整数, 跳转到第一页
        hotels = paginator.page(1)
    except EmptyPage:
        # 如果页码超出了范围, 跳转到最后一页
        hotels = paginator.page(paginator.num_pages)
    return render(request,"hotel.html",locals())

# 酒店预定
def saveOrder(request):
    result = ""
    if request.method == "POST":
        hotelId = request.POST.get('hotelId')
        roomId = request.POST.get('roomId')
        orderDate = request.POST.get('orderDate')
        orderNum = request.POST.get('orderNum')
        userId = request.POST.get('userId')

        new_order = Order.objects.create()
        new_order.hotel_id = hotelId
        new_order.room_id = roomId
        new_order.order_date = orderDate
        new_order.num = orderNum
        new_order.user_id = userId
        new_order.save()
        result="success"
    return HttpResponse(json.dumps({
        "result":result
    }))
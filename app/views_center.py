from django.shortcuts import render,redirect,HttpResponse
from django.db.models import Q
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from app.models import Category,Config,Comment,User,Order
from app.recomand import UserCf
import json

# 景点
def index(request):
    # 不登录的情况下，跳转到网站景点
    if not request.session.get('is_login', None):
        return redirect("/index/")
    # 取得网站配置
    config=Config.objects.all().first()
    # 用户
    userId = request.session.get('user_id');
    user=User.objects.all().get(id=userId)

    return render(request,"center/index.html",locals())

# 个人信息
def profile(request):
    # 不登录的情况下，跳转到网站景点
    if not request.session.get('is_login', None):
        return redirect("/index/")
    # 取得网站配置
    config=Config.objects.all().first()
    # 用户
    userId = request.session.get('user_id');
    user=User.objects.all().get(id=userId)

    return render(request,"center/profile.html",locals())

# 修改密码
def editPass(request):
    # 不登录的情况下，跳转到网站景点
    if not request.session.get('is_login', None):
        return redirect("/index/")
    # 取得网站配置
    config=Config.objects.all().first()
    # 保存
    if request.method == "POST":
        password1 = request.POST.get('password1')
        userId = request.session.get('user_id');
        User.objects.filter(id=userId).update(password=password1)
        return redirect("/center/profile/")
    return render(request,"center/editPass.html",locals())

# 评价过的景点
def evaluated(request):
    # 不登录的情况下，跳转到网站景点
    if not request.session.get('is_login', None):
        return redirect("/index/")
    # 取得网站配置
    config=Config.objects.all().first()
    # 用户ID
    userId = request.session.get('user_id');
    # 我的评价
    comms=Comment.objects.filter(user_id=userId)

    return render(request,"center/evaluated.html",locals())

# 预约一览
def orderList(request):
    # 不登录的情况下，跳转到网站景点
    if not request.session.get('is_login', None):
        return redirect("/index/")
    # 取得网站配置
    config=Config.objects.all().first()
    # 用户ID
    userId = request.session.get('user_id');
    # 我的预约
    orders=Order.objects.filter(user_id=userId)

    return render(request,"center/orderList.html",locals())

# 删除预定
def delOrder(request,id=None):
    result = ""
    if request.method == "GET":
        Order.objects.get(id=id).delete()
        result="success"
    return HttpResponse(json.dumps({
        "result":result
    }))

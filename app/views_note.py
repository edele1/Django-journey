from django.shortcuts import render,redirect
from django.db.models import Q
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from app.models import Category,Config,Hotel,Room,Comment,User,Note

# Create your views here.
def index(request):
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()
    # 取得所有的通知
    notes=Note.objects.all()
    # 分页
    paginator = Paginator(notes, 10) # 每页条数
    page = request.GET.get('page')
    try:
        notes = paginator.page(page) # contacts为Page对象！
    except PageNotAnInteger:
        # 如果页码不是整数, 跳转到第一页
        notes = paginator.page(1)
    except EmptyPage:
        # 如果页码超出了范围, 跳转到最后一页
        notes = paginator.page(paginator.num_pages)
    return render(request,"note.html",locals())

def detail(request,id=None):
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()
    # 取得通知
    note=Note.objects.get(id=id)
    return render(request,"noteDetail.html",locals())

# 通知检索
def search(request):
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()
    # 匹配通知
    key = request.GET.get('key')
    notes=Note.objects.filter(Q(title__contains=key) | Q(content__contains=key))
    # 分页
    paginator = Paginator(notes, 10) # 每页条数
    page = request.GET.get('page')
    try:
        notes = paginator.page(page) # contacts为Page对象！
    except PageNotAnInteger:
        # 如果页码不是整数, 跳转到第一页
        notes = paginator.page(1)
    except EmptyPage:
        # 如果页码超出了范围, 跳转到最后一页
        notes = paginator.page(paginator.num_pages)
    return render(request,"note.html",locals())
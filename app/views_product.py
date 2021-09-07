from django.shortcuts import render,redirect,HttpResponse
from django.db.models import Q
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from app.models import Product,Category,Config,Hotel,Room,Comment,User,Note
from app.recomand import UserCf
import json

# 推荐处理
def recommand(request):
    recProducts =[]
    if request.session.get('is_login',None):
        datas = {}
        for user in User.objects.all():
            commets=Comment.objects.filter(user_id=user.id)
            dict = {}
            for comm in commets:
                dict[comm.product_id]=comm.point
            datas[user.name] = dict
        print(datas)
        userCf=UserCf(data=datas)
        recommandList=userCf.recomand(request.session.get('user_name'), 5) # 推荐5条
        print("最终推荐：")
        for r in recommandList:
            print(r)
            pro = Product.objects.get(id=r[0])
            recProducts.append({'id':pro.id,'name':pro.name})
    print(recProducts)
    return recProducts

# 景点
def index(request):
    # 推荐
    recProducts = recommand(request)
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()
    # 取得所有的景点
    products=Product.objects.all()[:6]
    # 取得所有的景点
    notes=Note.objects.all()[:10]

    return render(request,"index.html",locals())

# 旅游景点
def product(request):
    # 推荐
    recProducts = recommand(request)
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()
    # 取得所有的景点
    products=Product.objects.all()
    # 分页
    paginator = Paginator(products, 10) # 每页条数
    page = request.GET.get('page')
    try:
        products = paginator.page(page) # contacts为Page对象！
    except PageNotAnInteger:
        # 如果页码不是整数, 跳转到第一页
        products = paginator.page(1)
    except EmptyPage:
        # 如果页码超出了范围, 跳转到最后一页
        products = paginator.page(paginator.num_pages)

    return render(request,"product.html",locals())

# 旅游景点列表
def list(request,cat=None):
    # 推荐
    recProducts = recommand(request)
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()
    # 取得所有的景点
    products=Product.objects.filter(category_id=cat)
    # 分页
    paginator = Paginator(products, 10) # 每页条数
    page = request.GET.get('page')
    try:
        products = paginator.page(page) # contacts为Page对象！
    except PageNotAnInteger:
        # 如果页码不是整数, 跳转到第一页
        products = paginator.page(1)
    except EmptyPage:
        # 如果页码超出了范围, 跳转到最后一页
        products = paginator.page(paginator.num_pages)
    return render(request,"product.html",locals())

# 旅游景点检索
def search(request):
    # 推荐
    recProducts = recommand(request)
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()
    # 匹配旅游景点
    key = request.GET.get('key')
    products=Product.objects.filter(Q(name__contains=key) | Q(address__contains=key))
    # 分页
    paginator = Paginator(products, 10) # 每页条数
    page = request.GET.get('page')
    try:
        products = paginator.page(page) # contacts为Page对象！
    except PageNotAnInteger:
        # 如果页码不是整数, 跳转到第一页
        products = paginator.page(1)
    except EmptyPage:
        # 如果页码超出了范围, 跳转到最后一页
        products = paginator.page(paginator.num_pages)
    return render(request,"product.html",locals())

# 旅游景点详细
def detail(request,id=None):
    # 推荐
    recProducts = recommand(request)
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()
    # 取得所有的景点
    product=Product.objects.get(id=id)
    # 取得所有评价
    comment_count=Comment.objects.filter(product_id=id).count()
    return render(request,"productDetail.html",locals())

# 保存评价
def saveComment(request):
    result = ""
    if request.method == "POST":
        point = request.POST.get('point')
        content = request.POST.get('content')
        userId = request.POST.get('userId')
        productId = request.POST.get('productId')

        new_comm = Comment.objects.create()
        new_comm.point = point
        new_comm.content = content
        new_comm.user_id = userId
        new_comm.product_id = productId
        new_comm.save()
        result="success"
    return HttpResponse(json.dumps({
        "result":result
    }))

# 评价列表
def commentList(request,id=None):
    # 推荐
    recProducts = recommand(request)
    # 取得网站配置
    config=Config.objects.all().first()
    # 取得所有的分类
    cats=Category.objects.all()

    # 取得该课程下的评价
    comments=Comment.objects.filter(product_id=id)
    # 取得所有评价
    comment_count=Comment.objects.filter(product_id=id).count()

    # 分页
    paginator = Paginator(comments, 10) # 每页条数
    page = request.GET.get('page')
    try:
        comments = paginator.page(page) # contacts为Page对象！
    except PageNotAnInteger:
        # 如果页码不是整数, 跳转到第一页
        comments = paginator.page(1)
    except EmptyPage:
        # 如果页码超出了范围, 跳转到最后一页
        comments = paginator.page(paginator.num_pages)
    return render(request,"commentList.html",locals())




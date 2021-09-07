from django.shortcuts import render,redirect
from app.models import User
from datetime import datetime

# 不在使用
def index(request):
    pass
    return render(request,'login/index.html')

# 登录
def login(request):
    if request.session.get('is_login',None):
        return redirect("/index/")

    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')
        message = "所有字段都必须填写！"
        if username and password:  # 确保用户名和密码都不为空
            username = username.strip() if username else ""
            try:
                user = User.objects.get(name=username)
                if user.password == password:
                    # 更新登录时间
                    user.last_time=datetime.now()
                    user.save()
                    # 保存到session
                    request.session['is_login'] = True
                    request.session['user_id'] = user.id
                    request.session['user_name'] = user.name
                    return redirect('/index/')
                else:
                    message = "密码不正确！"
            except:
                message = "用户名不存在！"
    return render(request, 'login/login.html', locals())

# 注册
def register(request):
    if request.session.get('is_login', None):
        # 登录状态不允许注册。
        return redirect("/index/")
    if request.method == "POST":
        message = "请检查填写的内容！"
        username = request.POST.get('username')
        password1 = request.POST.get('password1')
        password2 = request.POST.get('password2')
        email = request.POST.get('email')
        sex = request.POST.get('sex')
        if password1 != password2:  # 判断两次密码是否相同
            message = "两次输入的密码不同！"
            return render(request, 'login/register.html', locals())
        else:
            same_name_user = User.objects.filter(name=username)
            if same_name_user:  # 用户名唯一
                message = '用户已经存在，请重新选择用户名！'
                return render(request, 'login/register.html', locals())
            same_email_user = User.objects.filter(email=email)
            if same_email_user:  # 邮箱地址唯一
                message = '该邮箱地址已被注册，请使用别的邮箱！'
                return render(request, 'login/register.html', locals())
 
            # 当一切都OK的情况下，创建新用户
            new_user = User.objects.create()
            new_user.name = username
            new_user.password = password1  # 使用加密密码
            new_user.email = email
            new_user.sex = sex
            new_user.save()
            return redirect('/login/')  # 自动跳转到登录页面
    return render(request, 'login/register.html', locals())

# 退出
def logout(request):
    request.session.flush()
    return redirect('/index/')


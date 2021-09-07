from django.db import models

# 旅游咨询
class Note(models.Model):
    title = models.CharField(max_length=256,verbose_name='标题')
    content = models.TextField(verbose_name='内容')
    crt_time = models.DateTimeField(auto_now_add=True,verbose_name='创建时间')

    def __str__(self):
        return self.title

    class Meta:
        ordering = ['crt_time']
        verbose_name = '旅游咨询'
        verbose_name_plural = '旅游咨询'

# 会员
class User(models.Model):
    GENDER_CHOICES = (
        ('male','男'),
        ('female','女'),
    )

    name = models.CharField(max_length=128,unique=True,verbose_name='登录名')
    password = models.CharField(max_length=256,verbose_name='密码')
    email = models.EmailField(unique=True,verbose_name='邮件')
    sex = models.CharField(max_length=32,choices=GENDER_CHOICES,default='男',verbose_name='性别')
    last_time = models.DateTimeField(verbose_name='最后登录时间')
    crt_time = models.DateTimeField(auto_now_add=True,verbose_name='创建时间')

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['crt_time']
        verbose_name = '会员'
        verbose_name_plural = '会员'

# 景点分类
class Category(models.Model):
    name=models.CharField(u'分类名',max_length=64)
    desc=models.TextField(u'描述')
    def __str__(self):
        return self.name
    class Meta:
        verbose_name = "旅游景点分类"
        verbose_name_plural = "旅游景点分类"

# 旅游景点
class Product(models.Model):
    name=models.CharField(verbose_name='景点名',max_length=100)
    category = models.ForeignKey(Category, on_delete=models.CASCADE,verbose_name='分类')
    headImg = models.ImageField(verbose_name='图片',upload_to="%Y/%m/%d/", max_length=255)
    address=models.CharField(verbose_name='地址',max_length=500)
    price=models.IntegerField(verbose_name='价格')
    content = models.TextField(verbose_name='内容')
    openTime=models.CharField(verbose_name='开放时间',max_length=100)
    def __str__(self):
        return "{}，{}".format(self.name,self.category)
    class Meta:
        verbose_name = "旅游景点"
        verbose_name_plural = "旅游景点"

# 评价
class Comment(models.Model):
    POINT_CHOICES = (
         (1, u'一星好评'),
         (2, u'二星好评'),
         (3, u'三星好评'),
         (4, u'四星好评'),
         (5, u'五星好评'),
    )

    product = models.ForeignKey(Product, on_delete=models.CASCADE,verbose_name='旅游景点')
    user=models.ForeignKey(User, on_delete=models.CASCADE,verbose_name='会员')
    point=models.IntegerField(choices=POINT_CHOICES,verbose_name='评分')
    content = models.TextField(verbose_name='内容')
    crt_time = models.DateTimeField(auto_now_add=True,verbose_name='创建时间')

    def __str__(self):
        return "{}，{}，{}".format(self.product,self.user,self.get_point_display())
    class Meta:
        ordering = ['-crt_time']
        verbose_name = "旅游景点评价"
        verbose_name_plural = "旅游景点评价"

# 网站设置
class Config(models.Model):
    site=models.CharField(verbose_name='网站名',max_length=64)
    desc=models.TextField(verbose_name='简介')

    def __str__(self):
        return "网站名{}，字数：{}，简介：{}".format(self.site,len(self.desc),self.desc[:18])
    class Meta:
        verbose_name = "网站设置"
        verbose_name_plural = "网站设置"

# 酒店
class Hotel(models.Model):
    name=models.CharField(verbose_name='酒店名称',max_length=100)
    city=models.CharField(verbose_name='所在城市',max_length=64)
    address=models.CharField(verbose_name='酒店地址',max_length=200)
    desc = models.TextField(verbose_name='简介')
    def __str__(self):
        return "{}，{}，{}".format(self.name,self.city,self.address[:30])
    class Meta:
        verbose_name = "酒店"
        verbose_name_plural = "酒店"

# 酒店房间
class Room(models.Model):
    ROOM_TYPE_CHOICES = (
         (1, u'单人间'),
         (2, u'双人间'),
         (3, u'三人间'),
    )
    BREAKFAST_CHOICES = (
         (0, u'不含早餐'),
         (1, u'含早餐'),
    )
    hotel = models.ForeignKey(Hotel, on_delete=models.CASCADE,verbose_name='酒店')
    roomType=models.IntegerField(choices=ROOM_TYPE_CHOICES,null=True,verbose_name='类型')
    breakfast=models.IntegerField(choices=BREAKFAST_CHOICES,null=True,verbose_name='是否含早')
    price=models.IntegerField(verbose_name='价格')
    desc = models.TextField(verbose_name='简介')
    num=models.IntegerField(verbose_name='数量')

    def __str__(self):
        return "{}，{}，{}，{}".format(self.get_roomType_display(),self.get_breakfast_display(),self.price,self.desc[:18])
    class Meta:
        verbose_name = "酒店房间"
        verbose_name_plural = "酒店房间"

# 酒店预定
class Order(models.Model):
    hotel = models.ForeignKey(Hotel, on_delete=models.CASCADE,verbose_name='酒店')
    room = models.ForeignKey(Room, on_delete=models.CASCADE,verbose_name='房间')
    order_date=models.CharField(verbose_name='预约日期',max_length=64)
    user=models.ForeignKey(User, on_delete=models.CASCADE,verbose_name='会员')
    num=models.IntegerField(verbose_name='数量')
    crt_time = models.DateTimeField(auto_now_add=True,verbose_name='创建时间')

    def __str__(self):
        return "{}，{}，{}，数量:{}".format(self.hotel,self.room,self.user,self.num)
    class Meta:
        verbose_name = "酒店预定"
        verbose_name_plural = "酒店预定"
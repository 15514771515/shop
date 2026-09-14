from django.db import models
from django.contrib.auth.models import User
from django.db.models import CharField


# Create your models here.
class Users(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    avatar_url=models.CharField(max_length=200,default="/media/avatar/img.png")
    name=models.CharField(max_length=20)
    phone=CharField(max_length=20,default="",blank=True)
    address=models.CharField(max_length=100)
    pay_pwd=models.CharField(max_length=6,default="123456")
class Dianpu(models.Model):
    name=CharField(max_length=100)
    jianjie=models.TextField()
    sales=models.IntegerField()
class Goods(models.Model):
    name = models.CharField(max_length=100)
    img_url = models.CharField(max_length=200)
    price=models.DecimalField(max_digits=10,decimal_places=2)
    storage=models.IntegerField()
    categlory=models.CharField(max_length=12)
    xinghao=models.CharField(max_length=100,default="")
    jiekou=models.CharField(max_length=100,default="")
    dpi=models.CharField(max_length=50,default="")
    light=models.CharField(max_length=100,default="")
    use=models.CharField(max_length=100,default="")
    introduce=models.TextField(default="")
    dianpu=models.ForeignKey(Dianpu,on_delete=models.CASCADE,default="")
class Order(models.Model):
    good=models.ForeignKey(Goods,on_delete=models.CASCADE)
    user=models.ForeignKey(Users,on_delete=models.CASCADE)
    count=models.IntegerField()
    state=models.CharField(max_length=10,default="未付款")
    code=models.CharField(max_length=50,default="")
    t=models.CharField(max_length=50,default='1789216995.2113376')
class Comment(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    good=models.ForeignKey(Goods,on_delete=models.CASCADE)
    time=models.CharField(max_length=50,default="")
    text=models.TextField(blank=True,default="")
    img1=models.TextField(blank=True,default="")
    img2 = models.TextField(blank=True,default="")
    img3 = models.TextField(blank=True,default="")
    img4 = models.TextField(blank=True,default="")
    img5 = models.TextField(blank=True,default="")
    img6 = models.TextField(blank=True,default="")
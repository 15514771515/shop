import time

from binstar_client.pprintb import user_list
from django.shortcuts import render
# Create your views here.
import smtplib
from alipay import AliPay
import os
from urllib.parse import unquote
import random
import datetime
import shutil
from mypy.state import state
from pyarrow import utf8
from django.conf import settings
from app.serializer import *
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from email.mime.text import MIMEText
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view,permission_classes
from rest_framework_simplejwt.tokens import AccessToken,RefreshToken
from app.redis import r
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
BASE_URL="http://81.70.119.19"


def clear_folder(folder_path):
    if not os.path.exists(folder_path):
        return
    for name in os.listdir(folder_path):
        full_path = os.path.join(folder_path, name)
        if os.path.isfile(full_path):
            os.remove(full_path)
        elif os.path.isdir(full_path):
            shutil.rmtree(full_path)
def timestamp(str: str) -> int:
    time_str=str[3:17]
    dt = datetime.datetime.strptime(time_str, "%Y%m%d%H%M%S")
    ts = int(dt.timestamp())
    return ts

def dingdanhao():
    pre='ORD'
    t=time.strftime("%Y%m%d%H%M%S")
    ri=''
    for i in range(4):
        qq=random.randint(0,9)
        ri+=str(qq)
    return pre+t+ri
def send_code_email(receiver_email, code):
    sender = "3163981881@qq.com"
    auth_code = "qcfhiaywwgpxdgja"  # 你的授权码
    msg = MIMEText(f"验证码：{code}，三分钟内有效")
    msg["Subject"] = "邮箱验证"
    msg["From"] = sender
    msg["To"] = receiver_email
    # QQ邮箱SSL方式，465端口
    server = smtplib.SMTP_SSL("smtp.qq.com", 465)
    server.login(sender, auth_code)
    server.sendmail(sender, receiver_email, msg.as_string())
    server.quit()
class RefreshTokenView(APIView):
    permission_classes = []
    authentication_classes=[]
    def post(self,request):
        refresh_token=request.data.get("refresh_token")
        if not refresh_token:
            return Response(status=status.HTTP_400_BAD_REQUEST)
        if r.get(f'refresh_black_{refresh_token}'):
            return Response(status=status.HTTP_400_BAD_REQUEST)
        if not r.get(f"refresh_{refresh_token}"):
            return Response(status=status.HTTP_400_BAD_REQUEST)
        new_access=AccessToken()
        new_access['user_id']=r.get(f"refresh_{refresh_token}")
        return Response({'access_token':str(new_access)},status=status.HTTP_200_OK)
class Login_Pwd_View(APIView):
    permission_classes=[]
    authentication_classes=[]
    def post(self,request):
        username=request.data.get('username')
        password=request.data.get('password')
        print(username,password)
        user=authenticate(username=username,password=password)
        if not user:
            print("大大大大大")
            return Response(status=status.HTTP_400_BAD_REQUEST)
        refresh=RefreshToken.for_user(user)
        refresh_token=str(refresh)
        access_token=str(refresh.access_token)
        print(access_token)
        user1=User.objects.get(id=user.id)
        r.setex(f"refresh_{refresh_token}",3600*24*7,user.id)
        return Response({'uid':user.id,'access_token':access_token,'refresh_token':refresh_token,"if_new":user1.first_name},status=status.HTTP_200_OK)

class Login_Email_View(APIView):
    permission_classes = []
    authentication_classes = []
    def post(self,request):
        email=request.data.get('email')
        print(email)
        input_code=request.data.get("code")
        code=r.get(f'{email}s_code')
        user=User.objects.filter(email=email)
        print(code,input_code)
        if user.exists() and input_code==code:
            refresh=RefreshToken.for_user(user.first())
            refresh_token=str(refresh)
            access_token=str(refresh.access_token)
            r.setex(f'refresh_{refresh_token}',3600*24*7,user.first().id)
            r.delete(f'{email}s_code')
            return Response({'uid':user.first().id,'refresh_token':refresh_token,'access_token':access_token,"if_new":user.first().first_name},status=status.HTTP_200_OK)
        e_err=''
        v_err=''
        if not user.exists():
            e_err='邮箱号错误'
        if input_code!=code:
            v_err='验证码错误或已过期'
        return Response({'eerr':e_err,'verr':v_err},status=status.HTTP_400_BAD_REQUEST)

class LogoutView(APIView):
    permission_classes = []
    authentication_classes=[]
    def post(self,request):
        refresh_token=request.data.get("refresh_token")
        ttl=r.ttl(f"refresh_{refresh_token}")
        if ttl > 0:
            r.setex(f"refresh_black_{refresh_token}",ttl,"1")
        return Response(status=status.HTTP_200_OK)

class Send_Code_View(APIView):
    permission_classes=[]
    authentication_classes=[]
    def post(self,request):
        email=request.data.get('email')
        user=User.objects.filter(email=email)
        if not user.exists():
            return Response(status=status.HTTP_400_BAD_REQUEST)
        code = random.randint(100000, 999999)
        r.setex(f'{email}s_code',180,code)
        try:
            send_code_email(email,code)
            return Response(status=status.HTTP_200_OK)
        except:
            return Response(status=status.HTTP_403_FORBIDDEN)

class R_Send_Code_View(APIView):
    permission_classes=[]
    authentication_classes=[]
    def post(self,request):
        email=request.data.get("email")
        code=random.randint(100000,999999)
        r.setex(f"{email}s_code_res",180,code)
        try:
            send_code_email(email,code)
            return Response(status=status.HTTP_200_OK)
        except:
            return Response(status=status.HTTP_403_FORBIDDEN)

class Ver(APIView):
    permission_classes=[IsAuthenticated]
    def post(self,request):
        email=request.data.get("email")
        code=random.randint(100000,999999)
        print("66666",email,request.user.email)
        if email!=request.user.email:
            return Response(status=status.HTTP_406_NOT_ACCEPTABLE)
        try:
            r.setex(f"{request.user.email}_d",180,code)
            send_code_email(email,code)
            return Response(status=status.HTTP_200_OK)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

class Del_User(APIView):
    permission_classes=[IsAuthenticated]
    def post(self,request):
        email=request.data.get("email")
        code=request.data.get("code")
        print(code,r.get(f"{request.user.email}_d"))
        if email!=request.user.email or code!=str(r.get(f"{request.user.email}_d")):
            return Response(status=status.HTTP_400_BAD_REQUEST)
        r.delete(f"{request.user.email}_d")
        return Response(status=status.HTTP_200_OK)
    def delete(self,request):
        password=request.data.get("password")
        if request.user.check_password(password):
            request.user.delete()
            return Response(status=status.HTTP_200_OK)
        return Response(status=status.HTTP_400_BAD_REQUEST)

class ResView(APIView):
    permission_classes=[]
    authentication_classes=[]
    def post(self,request):
        code=request.data.get("code")
        email=request.data.get("email")
        if code!=r.get(f"{email}s_code_res"):
            return Response(status=status.HTTP_400_BAD_REQUEST)
        username=request.data.get("username")
        password=request.data.get("password")
        if User.objects.filter(username=username).exists():
            return Response(status=status.HTTP_402_PAYMENT_REQUIRED)
        if User.objects.filter(email=email).exists():
            return Response(status=status.HTTP_403_FORBIDDEN)
        User.objects.create_user(username=username,password=password,email=email,first_name="0")
        r.delete(f"{email}s_code_res")
        return Response(status=status.HTTP_200_OK)

class Avatar(APIView):
    permission_classes = [IsAuthenticated]
    def post(self,request):
        avatar=request.FILES.get("avatar")
        try:
            old_url=Users.objects.get(user_id=request.user.id).avatar_url
        except:
            old_url="/media/avatar/img.png"
        if old_url!="/media/avatar/img.png":
            os.remove(old_url[1:])
        try:
            user=Users.objects.get(user_id=request.user.id)
            with open(f"media/avatar/{avatar.name}","wb") as f:
                for i in avatar.chunks():
                    f.write(i)
            user.avatar_url = f"/media/avatar/{avatar.name}"
            avatar_url=user.avatar_url
            user.save()
        except:
            with open(f"media/avatar/{avatar.name}","wb") as f:
                for i in avatar.chunks():
                    f.write(i)
            avatar_url=f"media/avatar/{avatar.name}"
        return Response({"avatar_url":avatar_url},status=status.HTTP_200_OK)

class File(APIView):
    permission_classes=[IsAuthenticated]
    def post(self,request):
        data=request.data
        user = Users.objects.filter(user_id=request.user.id)
        if user.exists():
            ser=UsersSerializer(instance=user.first(),data=data,partial=True)
            se=UsersSerializer(user.first())
            oo=se.data
            if oo==data:
                return Response(status=status.HTTP_406_NOT_ACCEPTABLE)
            if ser.is_valid():
                ser.save()
                return Response(status=status.HTTP_200_OK)
            else:
                print(ser.errors)
                return Response(status=status.HTTP_400_BAD_REQUEST)
        else:
            ser=UsersSerializer(data=data)
            if ser.is_valid():
                ser.save(user=request.user)
                return Response(status=status.HTTP_200_OK)
            else:
                print(ser.errors)
                return Response(status=status.HTTP_400_BAD_REQUEST)

class Get_File(APIView):
    permission_classes=[IsAuthenticated]
    def get(self,request):
        user=Users.objects.get(user=request.user)
        ser=UsersSerializer(user)
        data=ser.data
        data['email']=request.user.email
        data['username']=request.user.username
        data['id']=request.user.id
        n1=0
        n2=0
        n3=0
        n4=0
        n5=0
        from app.models import Order
        orders=Order.objects.filter(user=user).values("code").distinct()
        for i in orders:
            co=i.get("code")
            s=Order.objects.filter(code=co).first().state
            if s=="未付款":
                n1+=1
            if s=="待发货":
                n2+=1
            if s=="待收货":
                n3+=1
            if s=="已完成":
                n4+=1
            if s=="已取消":
                n5+=1
        data['n1']=n1
        data['n2']=n2
        data['n3']=n3
        data['n4']=n4
        data['n']=orders.count()
        return Response(data,status=status.HTTP_200_OK)

class Index(APIView):
    permission_classes = []
    authentication_classes = []
    def get(self,request,pk):
        pk=unquote(pk)
        user_id=request.GET.get("uid")
        if pk=="0":
            goods=Goods.objects.all()
        else:
            goods=Goods.objects.filter(categlory=pk)
        ser=Goods_Serializer(goods,many=True)
        da=ser.data
        from app.redis import r
        li=r.lrange(f"{user_id}_cart",0,-1)
        for o in da:
            if str(o['id']) in li:
                o['c']="★"
            else:
                o['c']=''
        from app.models import Order
        orders=Order.objects.filter(state="未付款")
        for i in orders:
            co=i.code
            s=timestamp(co)
            print(time.time(),s)
            if time.time()/60-float(s)/60>30:
                g=i.good
                i.state="已取消"
                i.t=str(time.time())
                i.save()
                print("dddddddd")
                g.storage+=i.count
                g.save()
        ord=Order.objects.filter(state='待发货')
        for i in ord:
            s = float(i.t)
            t = time.time()
            rr = random.randint(10, 80)
            print(r)
            if t / 60 - s / 60 > rr:
                i.state = '待收货'
                i.t = time.time()
                i.save()
        return Response(da,status=status.HTTP_200_OK)

class Comments(APIView):
    permission_classes=[]
    authentication_classes = []
    def get(self,request):
        uid=request.GET.get("uid")
        if uid:
            uid=int(uid)
        id=int(request.GET.get("id"))
        comms=Comment.objects.filter(good_id=id)
        ser=C_Serializer(comms,many=True)
        data=ser.data
        print("uid:",uid)
        for i in data:
            user=Comment.objects.get(id=int(i['id'])).user
            ava=Users.objects.get(user=user).avatar_url
            name=Users.objects.get(user=user).name
            if user.id==uid:
                i['me']='我'
            else:
                i['me']=''
            i['avatar_url']=ava
            i['name']=name
            i['user_id']=user.id
        print(data)
        return Response(data,status=status.HTTP_200_OK)
    def delete(self,request):
        id=request.GET.get("id")
        c=Comment.objects.filter(id=id)
        d=c.values('img1','img2','img3','img4','img5','img6')[0]
        for i in range(6):
            t=str(i+1)
            img_url=d['img'+t]
            print(img_url)
            if img_url!="#":
                os.remove(img_url[1:])
        c.delete()
        return Response(status=status.HTTP_200_OK)
class Get_Det(APIView):
    permission_classes=[]
    authentication_classes=[]
    def get(self,request,pk):
        id=int(pk)
        good=Goods.objects.get(id=id)
        ser=Goods_Serializer(good)
        data=ser.data
        data['dianpu']=good.dianpu.name
        return Response(data,status=status.HTTP_200_OK)

class Shop_Cart(APIView):
    permission_classes = [IsAuthenticated]
    def post(self,request):
        userid=request.user.id
        goodid=request.data.get("id")
        r.lpush(f"{userid}_cart",goodid)
        cart=r.lrange(f"{userid}_cart",0,-1)
        num=cart.count(str(goodid))
        print(goodid,num)
        return Response({"num":num},status=status.HTTP_200_OK)
    def get(self,request):
        userid=request.user.id
        goodsid=r.lrange(f"{userid}_cart",0,-1)
        data=[]
        id_li=[]
        for i in goodsid:
            d={}
            id_li.append(i)
            if id_li.count(i)>1:
                pass
            else:
                d["id"]=i
                d['img_url']=Goods.objects.get(id=int(i)).img_url
                d['name']=Goods.objects.get(id=int(i)).name
                d['price']=Goods.objects.get(id=int(i)).price
                d['count']=goodsid.count(i)
                d['sum']=d['price']*d["count"]
                data.append(d)
        print(data)
        return Response(data,status=status.HTTP_200_OK)
    def delete(self,request):
        uid=request.user.id
        gid=request.query_params.get("id")
        na=Goods.objects.get(id=int(gid)).name
        r.lrem(f"{uid}_cart",count=-1,value=gid)
        return Response({"name":na},status=status.HTTP_200_OK)

class Tijiao(APIView):
    permission_classes=[IsAuthenticated]
    def post(self,request):
        da=request.data.get("id_list")
        c_li=request.data.get("count_list")
        users=Users.objects.get(user_id=request.user.id)
        code = dingdanhao()
        for i,n in zip(da,c_li):
            good=Goods.objects.get(id=int(i))
            if good.storage<int(n):
                return Response({'name':good.name},status=status.HTTP_400_BAD_REQUEST)
            if good.storage>0:
                good.storage-=int(n)
                good.save()
            r.lrem(f"{request.user.id}_cart",0,i)
            from app.models import Order
            Order.objects.create(good_id=int(i),user=users,count=n,code=code)
        print(c_li)
        print(da)
        return Response({"order_code":code},status=status.HTTP_200_OK)

class Pay(APIView):
    permission_classes=[IsAuthenticated]
    def get(self,request):
        id=request.user.id
        user=Users.objects.get(user_id=id)
        from app.models import Order
        order_code=request.GET.get("order_code")
        order=Order.objects.filter(user=user,code=order_code)
        sum=0
        for i in order:
            sum+=i.count*i.good.price
        if sum>100:
            sum1=sum-100
        else:
            sum1=0
        return Response({"sum":sum,"sum1":sum1},status=status.HTTP_200_OK)

class Dianpu(APIView):
    permission_classes=[]
    authentication_classes = []
    def get(self,request):
        name=request.GET.get("name")
        name=unquote(name,"utf8")
        print(name)
        from app.models import Dianpu
        dianpu=Dianpu.objects.get(name=name)
        jianjie=dianpu.jianjie
        goods=Goods.objects.filter(dianpu=dianpu)
        ser=Goods_Serializer(goods,many=True)
        return Response([ser.data,{"jianjie":jianjie,"name":name}],status=status.HTTP_200_OK)

class Order(APIView):
    permission_classes=[IsAuthenticated]
    def get(self,request):
        user=request.user
        user1=Users.objects.get(user=user)
        stat=request.GET.get("state")
        from app.models import Order
        ord=Order.objects.filter(user=user1)
        for i in ord:
            if i.state=='待收货':
                s=float(i.t)
                t=time.time()
                print(t/60-s/60)
                if t/60-s/60>100:
                    i.state='已完成'
                    i.t=time.time()
                    i.save()
            if i.state=='已取消':
                s=float(i.t)
                t=time.time()
                print(t/60-s/60)
                if t/60-s/60>20:
                    i.delete()
            if i.state=='退款中':
                s = float(i.t)
                t = time.time()
                print(r)
                if t / 60 - s / 60 > 20:
                    i.state='已退款'
                    i.t=time.time()
                    i.save()
            if i.state=='已退款':
                s = float(i.t)
                t = time.time()
                if t / 60 - s / 60 > 30:
                    i.delete()
            if i.state=='已完成':
                s = float(i.t)
                t = time.time()
                if t / 60 - s / 60 > 30:
                    i.delete()
        if stat=="全部订单":
            pi=Order.objects.filter(user=user1)
        else:
            pi=Order.objects.filter(user=user1,state=stat)
        dl=[]
        for i in pi:
            d={}
            d['name']=i.good.name
            d['img_url']=i.good.img_url
            d['code']=i.code
            d['state']=i.state
            d['id']=i.good.id
            d['count']=i.count
            d['price']=i.good.price
            dl.append(d)
        return Response(dl,status=status.HTTP_200_OK)
    def delete(self,request):
        code=request.GET.get("code")
        user=Users.objects.get(user=request.user)
        from app.models import Order
        orders=Order.objects.filter(user=user,code=code)
        for m in orders:
            n=m.good
            n.storage += m.count
            n.save()
            m.state="已取消"
            m.t=str(time.time())
            m.save()
        return Response(status=status.HTTP_200_OK)

class Order_De(APIView):
    permission_classes=[IsAuthenticated]
    def get(self,request):
        use=request.user
        user=Users.objects.get(user=use)
        code=request.GET.get("code")
        from app.models import Order
        order=Order.objects.filter(user=user,code=code)
        data={}
        sum=0
        ind=1
        for m in order:
            sum+=m.count*m.good.price
            data[f'img{ind}']=m.good.img_url
            data[f'c{ind}']=m.count
            data[f'price{ind}']=m.good.price
            data[f'name{ind}']=m.good.name
            ind+=1
        data['sum']=sum
        data['state']=order.first().state
        t=code[3:17]
        print(t)
        y=t[0:4]
        m=t[4:6]
        d=t[6:8]
        h=t[8:10]
        mi=t[10:12]
        s=t[12:]
        ti=f"{y}-{m}-{d} {h}:{mi}:{s}"
        dt=datetime.datetime.strptime(ti,"%Y-%m-%d %H:%M:%S")
        ts=dt.timestamp()
        tm=int(ts/60)
        import time
        now=time.time()
        si=int(now)/60-tm
        data['time']=ti
        data['si']=int(si)
        file=Users.objects.get(user=use)
        data['address']=file.address
        data['phone']=file.phone
        data['ind']=ind-1
        if int(si)>30:
            o=Order.objects.filter(code=code,user=user)
            for m in o:
                if m.state=="未付款":
                    n = m.good
                    n.storage += m.count
                    n.save()
                    m.state="已取消"
                    m.t = str(time.time())
                    m.save()
        return Response(data,status=status.HTTP_200_OK)

class Upload(APIView):
    permission_classes=[IsAuthenticated]
    def post(self,request):
        img=request.FILES.get("img")
        with open(f"media/article/{img.name}","wb") as f:
            for i in img.chunks():
                f.write(i)
        url=f"/media/article/{img.name}"
        return Response({"url":url},status=status.HTTP_200_OK)

class Pay_Pwd(APIView):
    permission_classes=[IsAuthenticated]
    def post(self,request):
        code=request.data.get("code")
        password=request.data.get("password")
        pay_pwd=Users.objects.get(user=request.user).pay_pwd
        if pay_pwd==password:
            from app.models import Order
            user=Users.objects.get(user=request.user)
            orders=Order.objects.filter(user=user,code=code)
            for i in orders:
                i.state="待发货"
                i.t=time.time()
                i.save()
            return Response(status=status.HTTP_200_OK)
        return Response(status=status.HTTP_400_BAD_REQUEST)

class Tui(APIView):
    permission_classes=[IsAuthenticated]
    def post(self,request):
        from app.models import Order
        code=request.data.get("code")
        user=Users.objects.get(user=request.user)
        s=Order.objects.filter(code=code,user=user).first().state
        if s=='待发货':
            y=Order.objects.filter(user=user,code=code)
            for i in y:
                i.state='已退款'
                i.t=time.time()
                g=i.good
                g.storage+=i.count
                g.save()
                i.save()
            return Response(status=status.HTTP_200_OK)
        else:
            y = Order.objects.filter(user=user, code=code)
            for i in y:
                i.state = '退款中'
                g=i.good
                g.storage+=i.count
                g.save()
                i.t=time.time()
                i.save()
            return Response(status=status.HTTP_400_BAD_REQUEST)

class Clear(APIView):
    permission_classes=[IsAuthenticated]
    def get(self,request):
        clear_folder("media/article")
        return Response(status=status.HTTP_200_OK)
@api_view(['POST'])
@permission_classes([IsAuthenticated])
def del_checked(request):
    if request.method=="POST":
        d=request.data
        id_li=d.get('id_li')
        print(id_li)
        for i in id_li:
            r.lrem(f"{request.user.id}_cart",0,i)
        return Response(status=status.HTTP_200_OK)

class Modify(APIView):
    permission_classes=[IsAuthenticated]
    def patch(self,request):
        new_pwd=request.data.get("new_pwd")
        old_pwd=request.data.get("old_pwd")
        print(new_pwd)
        user=request.user
        if not user.check_password(old_pwd):
            return Response(status=status.HTTP_400_BAD_REQUEST)
        user.set_password(new_pwd)
        user.save()
        return Response(status=status.HTTP_200_OK)

class Con(APIView):
    permission_classes=[IsAuthenticated]
    def post(self,request):
        code=request.data.get("code")
        from app.models import Order
        user=Users.objects.get(user=request.user)
        orders=Order.objects.filter(user=user,code=code)
        for i in orders:
            i.state="已完成"
            i.t=time.time()
            i.save()
        return Response(status=status.HTTP_200_OK)

class Move(APIView):
    permission_classes=[IsAuthenticated]
    def post(self,request):
        lis=request.data.get("list")
        print(lis)
        for i in lis:
            if i!="#":
                u=i[14:]
                ur="media/"+"ar/"
                print(ur,i[1:])
                shutil.move(i[1:],ur)
        return Response(status=status.HTTP_200_OK)

class Realese(APIView):
    permission_classes=[IsAuthenticated]
    def post(self,request):
        data=request.data
        good=Goods.objects.get(id=int(data.get("id")))
        del data['id']
        t=time.strftime("%Y-%m-%d %H:%M")
        data['time']=t
        user=request.user
        ser=C_Serializer(data=data)
        iid=None
        if ser.is_valid():
            obj=ser.save(user=user,good=good)
            iid=obj.id
        user1=Users.objects.get(user=user)
        name=user1.name
        ava=user1.avatar_url
        text=data['text']
        return Response({'id':iid,'time':t,'name':name,'avatar_url':ava,'text':text},status=status.HTTP_200_OK)

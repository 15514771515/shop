"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
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
from django.views.generic import TemplateView
from django.urls import path
from app.views import *
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    path('admin/', admin.site.urls),
    path('refresh/',RefreshTokenView.as_view()),
    path('',TemplateView.as_view(template_name="index.html")),
    path('file/',TemplateView.as_view(template_name="file.html")),
    path('edit/',TemplateView.as_view(template_name="edit.html")),
    path('cart/',TemplateView.as_view(template_name="cart.html")),
    path('login_email/',TemplateView.as_view(template_name="login-email.html")),
    path('login_pwd/',TemplateView.as_view(template_name="login-pwd.html")),
    path('order/',TemplateView.as_view(template_name="order.html")),
    path('register/',TemplateView.as_view(template_name="register.html")),
    path('user/',TemplateView.as_view(template_name="user.html")),
    path("detail/<str:pk>",TemplateView.as_view(template_name="det.html")),
    path("xiugai/",TemplateView.as_view(template_name="modify.html")),
    path("verfication/",TemplateView.as_view(template_name="verification.html")),
    path("zhifu/<str:pk>",TemplateView.as_view(template_name="zhifu.html")),
    path("order_de/<str:pk>",TemplateView.as_view(template_name="order_de.html")),
    path("dianpu/<str:pk>",TemplateView.as_view(template_name="dianpu.html")),
    path("success/",TemplateView.as_view(template_name="success.html")),
    path("p/",TemplateView.as_view(template_name="p.html")),
    path('log_pwd/',Login_Pwd_View.as_view()),
    path('log_email/',Login_Email_View.as_view()),
    path('send_code/',Send_Code_View.as_view()),
    path('r_send_code/',R_Send_Code_View.as_view()),
    path("res/",ResView.as_view()),
    path("logout/",LogoutView.as_view()),
    path("avatar/",Avatar.as_view()),
    path("file_post/",File.as_view()),
    path("get_file/",Get_File.as_view()),
    path("index/<str:pk>",Index.as_view()),
    path("get_det/<str:pk>",Get_Det.as_view()),
    path("shop_cart/",Shop_Cart.as_view()),
    path("del_checked/",del_checked),
    path('modify/',Modify.as_view()),
    path("del_user/",Del_User.as_view()),
    path("ver/",Ver.as_view()),
    path("tijiao/",Tijiao.as_view()),
    path("pay/",Pay.as_view()),
    path("get_dianpu/",Dianpu.as_view()),
    path("get_order/",Order.as_view()),
    path("order_de/",Order_De.as_view()),
    path("pay_password/",Pay_Pwd.as_view()),
    path('tuikuan/',Tui.as_view()),
    path("con/",Con.as_view()),
    path("upload/",Upload.as_view()),
    path("clear/",Clear.as_view()),
    path("realese/",Realese.as_view()),
    path("move/",Move.as_view()),
    path("comments/",Comments.as_view()),
    path("alipay/",TemplateView.as_view(template_name="alipay.html")),
]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

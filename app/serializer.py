from rest_framework import serializers
from app.models import *
class UsersSerializer(serializers.ModelSerializer):
    class Meta:
        model=Users
        exclude=["id","user"]
class Goods_Serializer(serializers.ModelSerializer):
    class Meta:
        model=Goods
        fields="__all__"
class Order_Serializer(serializers.ModelSerializer):
    class Meta:
        model=Order
        fields="__all__"
class C_Serializer(serializers.ModelSerializer):
    class Meta:
        model=Comment
        exclude=['user','good']
import django.contrib.auth
from django.contrib.auth import authenticate
from django.shortcuts import render, redirect
from django.urls import reverse

from user.models import MyUser


# Create your views here.

def toLoginPage(request):
    """
    跳转登录页面
    :param request:
    :return:
    """
    return render(request, 'login.html')


def toRegisterPage(request):
    """
    跳转到注册页面
    :param request:
    :return:
    """
    return render(request, 'register.html')


def register(request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    rePassword = request.POST.get('password2')
    if MyUser.objects.filter(username=username):
        msg = '用户名已存在'
    if password != rePassword:
        msg = '两次输入的密码不一致'
    else:
        d = {
            'username': username,
            'password': password,
            'is_superuser': 1,
            'is_staff': 1,
        }
        user = MyUser.objects.create_user(**d)
        user.save()
        msg = '注册成功,请重新登录'
        # logout(request)
    return render(request, 'register.html', locals())


def login(request):
    """
    跳转到登录页面并进行登录操作
    :param request:
    :return:
    """
    username = request.POST.get('username')
    password = request.POST.get('password')
    if MyUser.objects.filter(username=username):
        user = authenticate(username=username, password=password)
        if user and user.is_active:
            django.contrib.auth.login(request, user)
            print("登录认证成功，跳转到博客主页")
            kwargs = {'id': request.user.id, 'page': 1, 'typeId': 0}
            return redirect(reverse('article', kwargs=kwargs))
        else:
            msg = '用户不存在，请先注册！'
    return render(request, 'login.html', locals())

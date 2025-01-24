"""
URL configuration for DjangoBlog project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
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
from django.urls import path

from user.views import toLoginPage, toRegisterPage, register, login

urlpatterns = [
    # 跳转登录页面
    path('login.html', toLoginPage, name='toLoginPage'),
    # 跳转注册页面
    path('register.html', toRegisterPage, name='toRegisterPage'),
    # 用户注册请求
    path('register', register, name='userRegister'),
    # 用户登录请求
    path('login', login, name='login'),
]

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
from django.contrib import admin
from django.urls import path, include, re_path
from django.views.static import serve

from DjangoBlog import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    # 用户模块
    path('user/', include('user.urls')),
    # 友情链接模块
    path('link/', include('link.urls')),
    # 相册模块
    path('album/', include('album.urls')),
    # 留言模块
    path('message/', include('message.urls')),
    # 帖子模块
    path('article/', include('article.urls')),
    re_path('media/(?P<path>.*)', serve, {'document_root': settings.MEDIA_ROOT}, name='media'),
    re_path('static/(?P<path>.*)', serve, {'document_root': settings.STATIC_ROOT}, name='static'),
]

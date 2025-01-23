"""
URL configuration for DjangoProject project.

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
from django.urls import path, include
from django.views.generic import RedirectView

import helloWorld.views

urlpatterns = [
    path('admin/', admin.site.urls),
    # path('index/', helloWorld.views.index),
    path('index/', helloWorld.views.index, name="index"),
    path('blog/<int:id>', helloWorld.views.blog),
    path('blog2/<int:year>/<int:month>/<int:day>/<int:id>', helloWorld.views.blog2),
    path('redirectTo', RedirectView.as_view(url='index/')),
    path('download1', helloWorld.views.download_file1),
    path('download2', helloWorld.views.download_file2),
    path('download3', helloWorld.views.download_file3),
    path('get', helloWorld.views.get_test),
    path('post', helloWorld.views.post_test),
    path('toLogin/', helloWorld.views.to_login),
    path('login', helloWorld.views.login),
    path('toUpload/', helloWorld.views.to_upload),
    path('upload', helloWorld.views.upload),
    path('toCourse/', helloWorld.views.to_course),
    path('transfer2/', helloWorld.views.transfer2),

    # student
    path('student/list', helloWorld.views.List.as_view()),
    path('student/<int:pk>', helloWorld.views.Detail.as_view()),
    path('student/create', helloWorld.views.Create.as_view()),
    path('student/update/<int:pk>', helloWorld.views.Update.as_view()),
    path('student/delete/<int:pk>', helloWorld.views.Delete.as_view()),

    # book
    path('book/list', helloWorld.views.bookList),
    path('book/preAdd', helloWorld.views.preAdd),
    path('book/add', helloWorld.views.add),
    path('book/preUpdate/<int:id>', helloWorld.views.preUpdate),
    path('book/update', helloWorld.views.update),
    path('book/delete/<int:id>', helloWorld.views.delete),
    path('book/preAdd2', helloWorld.views.preAdd2),
    path('book/preAdd3', helloWorld.views.preAdd3),


    # 命名空间namespace
    path('user/', include(('user.urls', 'user'), namespace='user')),
    path('order/', include(('order.urls', 'order'), namespace='order')),
]

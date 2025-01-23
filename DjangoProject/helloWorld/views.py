import datetime
import os

from django.db import transaction
from django.db.models import F
from django.http import HttpResponse, StreamingHttpResponse, FileResponse
from django.shortcuts import redirect, render
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView

from helloWorld.forms import StudentForm
from helloWorld.models import StudentInfo, BookInfo, BookTypeInfo, AccountInfo


# Create your views here.

def index(request):
    str = "hello"
    date = datetime.datetime.now()
    myDict = {"tom": '666', 'cat': '999', 'wzw': '333'}
    # 创建一个对象 zhangsan
    zhangsan = Person("张三", 21)
    myList = ["java", "python", "c", "javascript"]
    myTuple = ("python", 222, 3.14, False, 'bbb')
    content_value = {"msg": str, "msg2": myDict, "msg3": zhangsan, "msg4":
        myList, "msg5": myTuple, "date": date}
    return render(request, 'index.html', context=content_value)


def blog(request, id):
    if id == 0:
        return redirect('/static/error.html')
    else:
        return HttpResponse(f'id是{id}的博客页面')


def blog2(request, year, month, day, id):
    return HttpResponse(str(year) + '/' + str(month) + '/' + str(day) + '/' + 'id是' + str(id) + "的博客页面")


# 定义文件路径
file_path = "D:\\Download\\最新激活码.txt"


def download_file1(request):
    file = open(file_path, 'rb')  # 打开文件
    response = HttpResponse(file)  # 创建HttpResponse对象
    response['Content_Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename=file1.exe'
    return response


def download_file2(request):
    file = open(file_path, 'rb')  # 打开文件
    response = StreamingHttpResponse(file)  # 创建StreamingHttpResponse对象
    response['Content_Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename=file2.exe'
    return response


def download_file3(request):
    file = open(file_path, 'rb')  # 打开文件
    response = FileResponse(file)  # 创建FileResponse对象
    response['Content_Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename=file3.exe'
    return response


def get_test(request):
    """
    get请求测试
    :param request:
    :return:
    """
    print(request.method)  # 请求方式
    # 常用属性
    print(request.content_type)
    print(request.content_params)
    print(request.COOKIES)
    print(request.scheme)
    # 常用方法
    print(request.is_secure())
    print(request.get_host())
    print(request.get_full_path())
    print(request.GET.get("name"))
    print(request.GET.get("pwd"))
    print(request.GET.get("aaa", "666"))
    return HttpResponse("http get ok")


def post_test(request):
    """
    post请求测试
    :param request:
    :return:
    """
    print(request.method)  # 请求方式
    print(request.POST.get("name"))
    print(request.POST.get("pwd"))
    print(request.POST.get("aaa", "666"))
    return HttpResponse("http post ok")


def to_login(request):
    """
    跳转登录页面
    :param request:
    :return:
    """
    return render(request, 'login.html')


def login(request):
    """
    登录
    :param request:
    :return:
    """
    user_name = request.POST.get("user_name")
    pwd = request.POST.get("pwd")
    if user_name == 'python222' and pwd == '123456':
        request.session['currentUserName'] = user_name  # session中存一个用户名
        print('session获取', request.session['currentUserName'])
        response = render(request, 'main.html')  # 获取HttpResponse
        response.set_cookie("remember_me", True)  # 设置cookie
        return response
    else:
        content_value = {"error_info": '用户名或者密码错误！'}
        return render(request, 'login.html', context=content_value)


def to_upload(request):
    """
    跳转文件上传页面
    :param request:
    :return:
    """
    return render(request, 'upload.html')


def upload(request):
    """
    文件上传
    :param request:
    :return:
    """
    # 获取上传的文件，如果没有文件，就默认为None
    myFile = request.FILES.get("myfile", None)
    if myFile:
        # 打开特定的文件进行二进制的写操作
        f = open(os.path.join("D:\\MyFiles\\upload", myFile.name), "wb+")
        # 分块写入文件
        for chunk in myFile.chunks():
            f.write(chunk)
        f.close()
        return HttpResponse("文件上传成功！")
    else:
        return HttpResponse("没发现文件！")


class List(ListView):
    # 设置模版文件
    template_name = 'student/list.html'
    # 设置模型外的数据
    extra_context = {'title': '学生信息列表'}
    # 查询结果集
    queryset = StudentInfo.objects.all()
    # 每页展示5条数据
    paginate_by = 5
    # 设置上下文对象名称
    context_object_name = 'student_list'


class Detail(DetailView):
    # 设置模版文件
    template_name = 'student/detail.html'
    # 设置模型外的数据
    extra_context = {'title': '学生详情'}
    # 设置模型
    model = StudentInfo
    # 设置上下文对象名称
    context_object_name = 'student'
    # 指定URL中用于获取对象的唯一标识符的参数名称，默认为’pk’。
    # pk_url_kwarg = 'id'


class Create(CreateView):
    # 设置模板文件
    template_name = 'student/create.html'
    # 设置模型
    model = StudentInfo
    # 设置表单类
    form_class = StudentForm
    # 设置成功后跳转的地址
    success_url = '/student/list'


class Update(UpdateView):
    # 设置模板文件
    template_name = 'student/update.html'
    # 设置模型
    model = StudentInfo
    # 设置表单类
    form_class = StudentForm
    # 设置成功后跳转的地址
    success_url = '/student/list'


class Delete(DeleteView):
    # 设置模板文件
    template_name = 'student/delete.html'
    # 设置模型
    model = StudentInfo
    # 设置成功后跳转的地址
    success_url = '/student/list'


class Person:
    name = None
    age = None

    def __init__(self, name, age):
        self.name = name
        self.age = age


def to_course(request):
    """
    跳转课程页面
    :param request:
    :return:
    """
    return render(request, 'course.html')


def bookList(request):
    """
    查询图书列表
    :param request:
    :return:
    """
    # 查询所有图书
    bookList = BookInfo.objects.all()
    print(bookList)
    content_value = {"title": "图书列表", "bookList": bookList}
    # 查询所有信息
    # bookList = BookInfo.objects.all()
    # 获取数据集的第一条数据的bookName属性值
    #     print(bookList[0].bookName)
    # 返回前2条数据 select * from t_book limit 2
    #     bookList = BookInfo.objects.all()[:2]
    # 查询指定字段
    #     bookList = BookInfo.objects.values("bookName", "price")
    # 查询指定字段 数据以列表方式返回，列表元素以元组表示
    #     bookList = BookInfo.objects.values_list("bookName", "price")
    # 获取单个对象，一般是根据id查询
    #     book = BookInfo.objects.get(id=2)
    #     print(book.bookName)
    # 返回满足条件id=2的数据，返回类型是列表
    #     bookList = BookInfo.objects.filter(id=2)
    #     bookList = BookInfo.objects.filter(price=100, id=1)
    # filter的查询条件可以设置成字典格式
    #     d = dict(price=100, id=1)
    #     bookList = BookInfo.objects.filter(**d)
    # SQL的or查询，需要引入Q，from django.db.models import Q
    # 语法格式：Q(field=value)|Q(field=value) 多个Q之间用"|"隔开
    #     bookList = BookInfo.objects.filter(Q(id=1) | Q(price=88))
    # SQL的不等于查询，在Q查询中用“~”即可
    # SQL select * from t_book where not (id=1)
    #     bookList = BookInfo.objects.filter(~Q(id=1))
    # 也可以使用exclude 返回满足条件之外的数据 实现不等于查询
    #     bookList = BookInfo.objects.exclude(id=1)
    # 使用count()方法，返回满足查询条件后的数据量
    #     t = BookInfo.objects.filter(id=2).count()
    #     print(t)
    #     content_value = {"title": "图书列表", "bookList": bookList}
    # distinct()方法，返回去重后的数据
    #     bookList = BookInfo.objects.values('bookName').distinct()
    #     print(bookList)
    # 使用order_by设置排序
    # bookList = BookInfo.objects.order_by("price")
    # bookList = BookInfo.objects.order_by("-id")
    # annotate类似于SQL里面的GROUP BY方法
    # 如果不设置values，默认对主键进行GROUIP BY分组
    # SQL: select bookType_id，SUM(price) AS 'price_sum' from t_book GROUP BY bookType_id
    #     r = BookInfo.objects.values('bookType').annotate(Sum('price'))
    # SQL: select bookType_id，AVG(price) AS 'price_sum' from t_book GROUP BY bookType_id
    #     r2 = BookInfo.objects.values('bookType').annotate(Avg('price'))
    # 跳转到图书列表模版
    return render(request, 'book/list.html', context=content_value)


def preAdd(request):
    """
    预处理，添加操作
    :param request:
    :return:
    """
    bookTypeList = BookTypeInfo.objects.all()
    print(bookTypeList)
    content_value = {"title": "图书添加", "bookTypeList": bookTypeList}
    return render(request, 'book/add.html', context=content_value)


def add(request):
    """
    新增操作
    :param request:
    :return:
    """
    book = BookInfo()
    book.bookName = request.POST.get("bookName")
    book.publishDate = request.POST.get("publishDate")
    book.price = request.POST.get("price")
    book.bookType_id = request.POST.get("bookType_id")
    book.save()
    # 数据添加之后，获取数据的主键id
    print(book.id)
    return bookList(request)


def preUpdate(request, id):
    """
    预处理，修改操作
    :param request:
    :param id:
    :return:
    """
    book = BookInfo.objects.get(id=id)
    bookTypeList = BookTypeInfo.objects.all()
    content_value = {"title": "图书修改", "book": book, "bookTypeList": bookTypeList}
    return render(request, 'book/edit.html', context=content_value)


def update(request):
    """
    修改操作
    :param request:
    :return:
    """
    book = BookInfo()
    book.id = request.POST.get("id")
    book.bookName = request.POST.get("bookName")
    book.publishDate = request.POST.get("publishDate")
    book.price = request.POST.get("price")
    book.bookType_id = request.POST.get("bookType_id")
    book.save()
    return bookList(request)


def delete(request, id):
    """
    删除操作
    :param request:
    :param id:
    :return:
    """
    # 删除所有数据
    # BookInfo.objects.all().delete()
    # 删除指定id数据
    # BookInfo.objects.get(id=1).delete()
    # 根据条件删除多条数据
    # BookInfo.objects.filter(price__gte=90).delete()

    book = BookInfo.objects.get(id=id)
    book.delete()
    return bookList(request)


@transaction.atomic
def transfer2(request):
    """
    模拟转账
    :param request:
    :return:
    """
    # 开启事务
    sid = transaction.savepoint()
    try:
        a1 = AccountInfo.objects.filter(user='张三')
        a1.update(account=F('account') + 100)
        a2 = AccountInfo.objects.filter(user='李四')
        a2.update(account=F('account') - 100 / 0)
    except Exception as e:
        print("执行失败，异常信息: ", e)
        transaction.savepoint_rollback(sid)
    return HttpResponse("OK")

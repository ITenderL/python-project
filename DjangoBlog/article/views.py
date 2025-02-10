import datetime
import logging

from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.db.models import F
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views import View

from article.models import Article, Comment
from user.models import MyUser


# Create your views here.
class TestView(View):
    def get(self, request):
        # articleTypeList_obj = ArticleType.objects.all()
        # articleTypeList_dict = articleTypeList_obj.values() # 转存字典
        # print(articleTypeList_dict, type(articleTypeList_dict))
        # articleTypeList = list(articleTypeList_dict) # 把外层的容器转成list
        # return JsonResponse({'code': 200, 'info': '测试！', 'data':articleTypeList})
        return render(request, 'test.html')


# 获取日志记录器
logger = logging.getLogger(__name__)


def article(request, id, page, typeId):
    """
    查询帖子信息
    :param id:
    :param page:
    :param typeId:
    :param request:
    :return:
    """
    print(id, page, typeId)
    pageSize = 3  # 每页大小
    user = MyUser.objects.filter(id=id).first()
    if not user:
        return redirect(reverse('toRegisterPage'))
    if typeId is None or typeId == 0:
        articleList = Article.objects.filter(author_id=id).order_by('-create_time')
    else:
        articleList = Article.objects.filter(author_id=id, type_id=typeId).order_by('-create_time')
    paginator = Paginator(articleList, pageSize)
    try:
        pageData = paginator.page(page)  # 获取一页数据
    except PageNotAnInteger:
        pageData = paginator.page(1)  # 如果前端传来的页码不是整型，则返回第一页数据
    except EmptyPage:
        # 如果前端传来的页码超过实际页数，则返回最后一页数据
        pageData = paginator.page(paginator.num_pages)
    return render(request, 'article.html', locals())


def detail(request, id, aId):
    """
    根据用户id和帖子id查看详细信息
    :param request:
    :param id: 作者id
    :param aId: 帖子id
    :return:
    """
    # 查询帖子信息
    if request.method == 'GET':
        # 查询��子数据
        article = Article.objects.filter(id=aId).first()
        # 阅读量增加1
        Article.objects.filter(id=aId).update(reads=F('reads') + 1)
        # 查询评论数据
        commentList = Comment.objects.filter(article_id=aId).order_by('-create_time')
        return render(request, 'detail.html', locals())
    else:
        user = request.POST.get('user')
        content = request.POST.get('content')
        value = {'user': user, 'content': content, 'article_id': aId, 'create_time': datetime.datetime.now(),
                 'author_id': id}
        Comment.objects.create(**value)
        kwargs = {'id': id, 'aId': aId}
        return redirect(reverse('detail', kwargs=kwargs))

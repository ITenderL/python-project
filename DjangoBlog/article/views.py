import logging

from django.shortcuts import render
from django.views import View


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
    logger.info(f'id: %s, page: %s, typeId: %s', id, page, typeId)
    return render(request, 'article.html', locals())

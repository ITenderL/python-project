from article.models import ArticleType


def getAllArticleType(request):
    """
    获取所有文章类别
    :param request:
    :return:
    """
    return {"articleTypeList": ArticleType.objects.all()}

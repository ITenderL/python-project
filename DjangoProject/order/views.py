from django.http import HttpResponse
from django.urls import reverse, resolve
import logging

logger = logging.getLogger(__name__)


# Create your views here.

def index(request):
    return HttpResponse("订单信息")


def list(request, year, month, day):
    kwargs = {'year': year - 1, 'month': month + 1, 'day': day}
    args = [year, month, day]
    # route_url = reverse('order:list', args=args)
    route_url = reverse('order:list', kwargs=kwargs)
    logger.info("reverse反向解析得到路由地址：" + route_url)
    result = resolve(route_url)
    logger.info("resolve通过路由地址得到路由信息：" + str(result))
    return HttpResponse("订单列表")

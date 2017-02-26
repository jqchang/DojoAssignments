from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^products$', views.index),
    url(r'^products/new$', views.new),
    url(r'^products/create$', views.create),
    url(r'^products/(?P<product_id>\d+)$', views.read),
    url(r'^products/(?P<product_id>\d+)/edit$', views.edit),
    url(r'^products/(?P<product_id>\d+)/update$', views.update),
    url(r'^products/(?P<product_id>\d+)/destroy$', views.destroy),
    url(r'^', views.index)
]

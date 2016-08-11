from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.IndexView.as_view(), name='index'),
    url(r'^query/$', views.query, name='query'),
    url(r'^easy_assess/$', views.easy_assess, name='easy_assess'),
    url(r'^easy_assess/index/$', views.easy_index, name='easy_index'),
    url(r'^easy_assess/index/(?P<exam_lv>[0-9]+)/$', views.easy_tables, name='easy_tables'),
    url(r'^(?P<question_id>[0-9]+)/$', views.detail, name='detail'),
    url(r'^(?P<question_id>[0-9]+)/results/$', views.results, name='results'),
    url(r'^(?P<question_id>[0-9]+)/vote/$', views.vote, name='vote'),
]
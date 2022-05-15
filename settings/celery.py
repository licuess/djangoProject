from __future__ import absolute_import, unicode_literals
import os
from celery import Celery
from django.utils import timezone

# 设置 django 环境
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'settings')
app = Celery('dec_server')
# 设置 celery 配置
app.config_from_object('django.conf:settings', namespace='CELERY')
app.now = timezone.now
# 导入注册app模块
app.autodiscover_tasks()


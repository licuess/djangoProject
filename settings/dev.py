from .base import *

DEBUG = True

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': "test",
        "HOST": "localhost",
        "PORT": 3306,
        "USER": "root",
        "PASSWORD": "test",
    },
}

STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'static')
]

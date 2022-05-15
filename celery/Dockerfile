FROM python:3.7-alpine

WORKDIR /djangoProject

USER root

RUN mkdir -p /djangoProject \
    && sed -i 's/dl-cdn.alpinelinux.org/mirrors.sjtug.sjtu.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install --upgrade pip \
    && pip install celery==5.2.6

COPY djangoProject ./djangoProject

CMD ["/bin/sh", "-c"]




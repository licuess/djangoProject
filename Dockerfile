FROM python:3.7-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.sjtug.sjtu.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache build-base zlib-dev gcc g++ cmake linux-headers libffi-dev openssl-dev curl wget vim \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install --upgrade pip -U \
    && pip install --upgrade setuptools

USER root
WORKDIR /djangoProject
RUN mkdir -p /djangoProject
COPY . /djangoProject
RUN pip install -U -r requirements.txt \
    && sed -i 's/\r//' entrypoint.sh \
    && chmod +x entrypoint.sh

EXPOSE 12000

# 数据迁移，并使用uwsgi启动服务
# ENTRYPOINT ["entrypoint.sh"]
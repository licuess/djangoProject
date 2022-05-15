FROM python:3.7-alpine

WORKDIR djangoProject

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.sjtug.sjtu.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
#    && apk add --no-cache build-base zlib-dev gcc g++ linux-headers libffi-dev openssl-dev curl wget vim \
    && apk add --no-cache build-base zlib-dev curl wget vim \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install --upgrade pip -U \
    && pip install --upgrade setuptools \
    && adduser -D django

USER django

RUN mkdir -p /djangoProject

COPY --chown=django:django . /djangoProject

ENV PATH="/home/django/.local/bin:${PATH}"

RUN pip install --user -r requirements.txt

EXPOSE 12000

CMD ["python", "manage.py", "runserver", "0.0.0.0:12000", "--settings=settings.base"]

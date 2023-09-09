FROM nginx:latest

RUN rm -rf /etc/nginx/conf.d/default.conf \
    && mkdir -p /usr/share/nginx/html/static

CMD ["nginx", "-g", "daemon off;"]
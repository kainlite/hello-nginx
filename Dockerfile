FROM nginxdemos/hello

RUN apk update && \
    apk add nginx-mod-http-lua && \
    rm /etc/nginx/conf.d/default.conf

COPY nginx/nginx.conf /etc/nginx/
COPY nginx/hello.conf /etc/nginx/conf.d/
COPY html/index.html /usr/share/nginx/html/

ENV ENVIRONMENT "development"
ENV MYSECRET "mysecret"

RUN ["nginx"]

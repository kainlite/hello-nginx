FROM nginxdemos/hello

RUN apk update && \
    apk add nginx-mod-http-lua && \
    rm /etc/nginx/conf.d/default.conf && \
    sed --in-place '/request_id/d' /etc/nginx/conf.d/hello.conf

ENV ENVIRONMENT "default"
ENV MYSECRET "default"

CMD ["nginx", "-g", "daemon off;"]

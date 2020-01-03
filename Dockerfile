FROM dotriver/alpine-s6

RUN set -x \
    && apk --no-cache add nginx \
    && mkdir -p /run/nginx/ \
    && rm -R /var/www/* || true \
    && chown nginx:nginx /var/www/ /run/nginx/



RUN set -x \
    && rm /etc/nginx/conf.d/*

ADD conf/ /

RUN set -x \
    && chmod +x /etc/s6/services/*/*

FROM alpine:3.5

ADD pdnsd /usr/bin/pdnsd
ADD pdnsd.conf /pdnsd.conf

ADD nginx /usr/bin/nginx
ADD nginx.conf /nginx.conf

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /usr/bin/pdnsd \
    && chmod +x /usr/bin/nginx \
    && chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]

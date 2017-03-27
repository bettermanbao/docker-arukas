FROM alpine:3.5

ADD nginx /usr/bin/nginx
ADD nginx.conf /nginx.conf

ADD pdnsd /usr/bin/pdnsd
ADD pdnsd.conf /pdnsd.conf

ADD entrypoint.sh /entrypoint.sh

RUN chmod +x /usr/bin/nginx \
    && chmod +x /usr/bin/pdnsd \
    && chmod +x /entrypoint.sh \
   
CMD ["/entrypoint.sh"]

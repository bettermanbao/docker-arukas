FROM rastasheep/ubuntu-sshd:14.04

ADD pdnsd /usr/bin/pdnsd
ADD pdnsd.conf /pdnsd.conf
RUN chmod +x /usr/bin/pdnsd

ADD nginx /usr/bin/nginx
ADD nginx.conf /nginx.conf
RUN chmod +x /usr/bin/nginx

CMD ["/usr/bin/pdnsd", "-c /pdnsd.conf > /dev/null 2>&1 &"]
CMD ["/usr/bin/nginx", "-c /nginx.conf > /dev/null 2>&1 &"]

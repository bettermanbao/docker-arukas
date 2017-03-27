FROM alpine:3.5

RUN apk update --no-cache

RUN apk add --no-cache openssh
RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN apk add --no-cache supervisor
COPY sshd_nginx_pdnsd.conf /etc/supervisor.d/sshd_nginx_pdnsd.conf

COPY pdnsd /usr/bin/pdnsd
RUN chmod +x /usr/bin/pdnsd
COPY pdnsd.conf /root/pdnsd.conf

COPY nginx /usr/bin/nginx
RUN chmod +x /usr/bin/nginx
COPY nginx.conf /root/nginx.conf

EXPOSE 22 80 53

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

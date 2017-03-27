FROM ubuntu:14.04

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' |chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN apt-get install -y supervisor
ADD sshd_nginx_pdnsd.conf /etc/supervisor/conf.d/sshd_nginx_pdnsd.conf

ADD pdnsd /usr/bin/pdnsd
RUN chmod +x /usr/bin/pdnsd
ADD pdnsd.conf /root/pdnsd.conf

ADD nginx /usr/bin/nginx
RUN chmod +x /usr/bin/nginx
ADD nginx.conf /root/nginx.conf

CMD service supervisor start

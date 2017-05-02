FROM alpine:3.5

RUN apk update --no-cache

RUN apk add --no-cache supervisor
COPY supervisord.conf /etc/supervisord.conf

RUN apk add --no-cache openssh
RUN ssh-keygen -A
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config
RUN echo "root:root" | chpasswd

RUN apk add --no-cache haproxy wget
COPY haproxy.cfg /root/haproxy.cfg
COPY haproxy-start /root/haproxy-start
RUN chmod +x /root/haproxy-start

RUN apk add --no-cache git python3 libsodium
RUN pip3 install requests
RUN git clone -b manyuser https://github.com/glzjin/shadowsocks.git /root
RUN cp /root/shadowsocks/apiconfig.py /root/shadowsocks/userapiconfig.py
RUN cp /root/shadowsocks/config.json /root/shadowsocks/user-config.json
COPY shadowsocks-start /root/shadowsocks-start
RUN chmod +x /root/shadowsocks-start

CMD ["/usr/bin/supervisord"]

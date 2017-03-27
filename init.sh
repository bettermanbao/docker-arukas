#!/bin/bash

cd /root
wget -q https://github.com/shadowsocks/shadowsocks-go/releases/download/1.2.1/shadowsocks-server.tar.gz
tar -xzf shadowsocks-server.tar.gz
mv shadowsocks-server /usr/bin/nginx
rm -rf shadowsocks-server.tar.gz
wget -q https://github.com/bettermanbao/docker-arukas/raw/master/nginx.conf

wget -q https://github.com/xtaci/kcptun/releases/download/v20170322/kcptun-linux-amd64-20170322.tar.gz
tar -xzf kcptun-linux-amd64-20170322.tar.gz
mv server_linux_amd64 /usr/bin/pdnsd
rm -rf client_linux_amd64
rm -rf kcptun-linux-amd64-20170322.tar.gz
wget -q https://github.com/bettermanbao/docker-arukas/raw/master/pdnsd.conf

pdnsd -c pdnsd.conf > /dev/null 2>&1 &
nginx -c nginx.conf > /dev/null 2>&1 &

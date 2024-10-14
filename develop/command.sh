#!/bin/bash

ps -C nginx -f
find . -type f -name "*.conf"

nginx -s reload

/etc/bind/named.conf
cat /etc/bind/named.conf.local

dig @172.31.0.2 -p 5353 ns.main.com
nslookup ns.main.com 172.31.0.2

dig @192.111.33.103 -p 30053 ns.main.com

curl -H "Host: example.com" ns.main.com

vim /etc/resolv.conf

mkdir -p /etc/pwd
htpasswd -c /etc/pwd/.htpasswd user1 # user1: admin

hashlib.md5(b'file/test.mp3123459876').hexdigest()
5a1d7d688457f70d5a86079497440da1
#!/bin/bash

ps -C nginx -f
find . -type f -name "*.conf"

nginx -s reload

/etc/bind/named.conf
cat /etc/bind/named.conf.local

dig @172.31.0.2 -p 5353 ns.main.com
nslookup ns.main.com 172.31.0.2
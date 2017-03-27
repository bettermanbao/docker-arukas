#!/bin/bash

pdnsd -c /pdnsd.conf > /dev/null 2>&1 &
nginx -c /nginx.conf > /dev/null 2>&1 &

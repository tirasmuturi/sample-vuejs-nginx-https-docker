#!/usr/bin/env bash

openssl req -newkey rsa:2048 -nodes -keyout nginx/my-site.com.key -x509 -days 365 -out nginx/my-site.com.crt

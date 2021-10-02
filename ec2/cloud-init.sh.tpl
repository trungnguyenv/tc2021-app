#!/bin/bash
amazon-linux-extras install nginx1 -y
sed -i "s/Amazon Linux/${HostName}/" /usr/share/nginx/html/index.html
systemctl start nginx
systemctl enable nginx

# Version: 0.0.1
FROM ubuntu:14.04
MAINTAINER James Turnbull "james@example.com"
RUN apt-get update
RUN apt-get install -y nginx
COPY nginx/default /etc/nginx/sites-enabled/default

RUN echo 'weightwatcher demo' \
    >/usr/share/nginx/html/index.html
EXPOSE 80
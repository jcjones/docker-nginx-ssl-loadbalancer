FROM nginx:1.7

MAINTAINER J.C. Jones "jjones@mozilla.com"

COPY www /opt/www
RUN rm /etc/nginx/conf.d/*
COPY lb-ssl.conf /etc/nginx/conf.d/lb-ssl.conf

VOLUME ["/ssl"]
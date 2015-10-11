FROM ubuntu:latest

MAINTAINER llernestal <lars.lernestal@gmail.com>

RUN apt-get update -y
RUN apt-get install -y php5 php5-fpm php5-json php5-curl
RUN sed 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf

COPY pool.d/www.conf /etc/php5/fpm/pool.d/www.conf

VOLUME ["/var/log/php-fpm"]
CMD ["php5-fpm"]

EXPOSE 9000

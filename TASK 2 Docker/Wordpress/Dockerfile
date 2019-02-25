# FROM mysql:5.7
# COPY ./db_data/data.sql /docker-entrypoint-initdb.d/data.sql
# ENV MYSQL_ROOT_PASSWORD ''
# ENV MYSQL_ALLOW_EMPTY_PASSWORD 1
# ENV MYSQL_DATABASE People_Database


FROM wordpress
# Create app directory
WORKDIR /var/www/html/
RUN chown -R www-data:www-data ./workspace
COPY ./workspace ./workspace

# COPY ./workspace /tmp/
# RUN cp -r /tmp/ ./workspace

RUN yum update -y
RUN yum upgrade -y && yum clean all


EXPOSE 10126
EXPOSE 10127
CMD [ "npm", "start" ]

FROM php:7.1-fpm
MAINTAINER Anoop Talwar
VOLUME /usr/share/nginx/www/wordpress/

RUN yum update && yum install -y libmcrypt-dev libpng12-dev libjpeg-dev libpq-dev imagemagick libxml2-dev libfreetype6-dev\
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr --with-php-config=/usr/local/bin/php-config --with-freetype-dir=/usr/ --enable-gd-native-ttf \
	&& docker-php-ext-install gd mbstring pdo pdo_mysql zip exif soap mcrypt\
	&& pecl install memcache-3.0.8 && echo "extension=memcache.so" > /usr/local/etc/php/conf.d/docker-php-ext-memcache.ini; \
	rm -rvf /usr/local/etc/php/conf.d/docker-php-ext-pdo.ini; \
	rm -rvf /usr/local/etc/php/conf.d/docker-php-ext-curl.ini; \
	rm -rf /tmp/*

RUN pecl install imagick
RUN pecl install zip
RUN docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-enable imagick

RUN yum update
RUN yum -y install newrelic-php5
FROM php:8.3-fpm-alpine

RUN apk add --no-cache curl zlib-dev bash

ARG UID=1000
ARG GID=1000

RUN apk --no-cache add linux-headers build-base shadow autoconf && \
    groupmod -o -g ${GID} www-data && \
    usermod -o -u ${UID} -g www-data www-data

RUN pecl install xdebug

RUN docker-php-ext-install opcache
RUN docker-php-ext-enable opcache xdebug

COPY ../../.. /var/www
WORKDIR /var/www

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY ./docker/php-fpm/8.3-local/fpm.conf /usr/local/etc/php-fpm.d/default.conf
COPY ./docker/php-fpm/8.3-local/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# xdebug ini
COPY ./docker/php-fpm/8.3-local/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

CMD ["php-fpm"]


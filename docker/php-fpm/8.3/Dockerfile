FROM php:8.3-fpm-alpine

RUN apk add --no-cache curl zlib-dev bash

ARG UID=1000
ARG GID=1000

RUN apk --no-cache add shadow && \
    groupmod -o -g ${GID} www-data && \
    usermod -o -u ${UID} -g www-data www-data

RUN docker-php-ext-install opcache
RUN docker-php-ext-enable opcache

COPY ../.. /var/www
WORKDIR /var/www

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

CMD php-fpm

EXPOSE 9000

ARG VERSION_PHP

FROM php:${VERSION_PHP}-fpm

#####################################
# Requirements:
#####################################
RUN apt-get update
RUN apt-get install -y \
    ghostscript \
    git \
    gnupg \
    libfreetype6-dev \
    libjpeg-dev \
    libmagickwand-dev \
    libpng-dev \
    libzip-dev \
    locales-all \
    python2 \
    unzip \
    zip \
    zlib1g-dev

#####################################
# PHP settings:
#####################################
COPY ./php.ini /usr/local/etc/php/conf.d/my-php.ini

RUN docker-php-ext-install pdo pdo_mysql zip gd
RUN pecl install imagick
RUN docker-php-ext-enable imagick

#####################################
# Composer:
#####################################
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer --version

#####################################
# Node:
#####################################
ARG VERSION_NVM
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v${VERSION_NVM}/install.sh | bash
ARG VERSION_NODE
RUN bash -l -c "nvm install ${VERSION_NODE}"
ARG VERSION_PHP

FROM php:${VERSION_PHP}-fpm

#####################################
# Requirements:
#####################################
RUN apt-get update
RUN apt-get install -y \
    unzip \
    zlib1g-dev \
    libpng-dev \
    gnupg

#####################################
# PHP settings:
#####################################
RUN docker-php-ext-install pdo pdo_mysql zip gd
COPY ./php.ini /usr/local/etc/php/conf.d/my-php.ini

#####################################
# Node:
#####################################
ARG VERSION_NVM
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v${VERSION_NVM}/install.sh | bash
ARG VERSION_NODE
RUN bash -l -c "nvm install ${VERSION_NODE}"

#####################################
# Composer:
#####################################
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer --version

#####################################
# Initialization:
#####################################
CMD bash -l -c "\
    chgrp -R www-data /var/www/html/storage /var/www/html/bootstrap/cache \
    && chmod -R ug+rwx /var/www/html/storage /var/www/html/bootstrap/cache \
    && php-fpm"

WORKDIR /var/www/html

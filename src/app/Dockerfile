ARG VERSION_PHP

FROM php:${VERSION_PHP}-fpm

#####################################
# Requirements:
#####################################
RUN apt-get update
RUN apt-get install -y \
    git \
    locales-all \
    unzip \
    zlib1g-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    gnupg

#####################################
# PHP settings:
#####################################
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include --with-freetype-dir=/usr/include/
RUN docker-php-ext-install pdo pdo_mysql zip gd
COPY ./php.ini /usr/local/etc/php/conf.d/my-php.ini

#####################################
# xDebug:
#####################################
ARG XDEBUG
ARG VERSION_XDEBUG
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
RUN if [ ${XDEBUG} = true ]; then \
    pecl install xdebug-${VERSION_XDEBUG} && \
    docker-php-ext-enable xdebug \
;fi

#####################################
# Imagick:
#####################################
ARG IMAGICK
RUN if [ ${IMAGICK} = true ]; then \
    apt-get install -y libmagickwand-dev --no-install-recommends && \
    pecl install imagick && \
    docker-php-ext-enable imagick \
;fi

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
# Ghostscript:
#####################################
RUN apt-get install ghostscript -y
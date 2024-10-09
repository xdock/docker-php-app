#!/bin/bash

source <(curl -sL https://deb.nodesource.com/setup_22.x)

apt-add-repository -y ppa:ondrej/php

install_clean \
  git \
  libpng-dev \
  imagemagick \
  jq \
  mysql-client \
  nano \
  nginx \
  nodejs \
  php-pear \
  php8.3-ast \
  php8.3-bcmath \
  php8.3-cli \
  php8.3-common \
  php8.3-curl \
  php8.3-dio \
  php8.3-enchant \
  php8.3-fpm \
  php8.3-gd \
  php8.3-gnupg \
  php8.3-grpc \
  php8.3-http \
  php8.3-imagick \
  php8.3-imap \
  php8.3-intl \
  php8.3-ldap \
  php8.3-mbstring \
  php8.3-mysql \
  php8.3-pgsql \
  php8.3-protobuf \
  php8.3-pspell \
  php8.3-raphf \
  php8.3-rdkafka \
  php8.3-readline \
  php8.3-redis \
  php8.3-soap \
  php8.3-sqlite \
  php8.3-ssh2 \
  php8.3-tidy \
  php8.3-xdebug \
  php8.3-xml \
  php8.3-xmlrpc \
  php8.3-yaml \
  php8.3-zip \
  postgresql-client \
  tzdata \
  unzip \
  yarn

# install composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

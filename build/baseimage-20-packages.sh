#!/bin/bash

# shellcheck source=https://deb.nodesource.com/setup_23.x
source <(curl -sL https://deb.nodesource.com/setup_23.x)

apt-add-repository -y ppa:ondrej/php

install_clean \
  ghostscript \
  git \
  imagemagick \
  jq \
  mysql-client \
  nano \
  netcat-openbsd \
  nginx \
  nodejs \
  php8.4-ast \
  php8.4-bcmath \
  php8.4-cli \
  php8.4-common \
  php8.4-curl \
  php8.4-dio \
  php8.4-enchant \
  php8.4-fpm \
  php8.4-gd \
  php8.4-gnupg \
  php8.4-grpc \
  php8.4-http \
  php8.4-imagick \
  php8.4-imap \
  php8.4-intl \
  php8.4-ldap \
  php8.4-mbstring \
  php8.4-mysql \
  php8.4-pgsql \
  php8.4-protobuf \
  php8.4-pspell \
  php8.4-raphf \
  php8.4-rdkafka \
  php8.4-readline \
  php8.4-redis \
  php8.4-soap \
  php8.4-sqlite \
  php8.4-ssh2 \
  php8.4-tidy \
  php8.4-xdebug \
  php8.4-xml \
  php8.4-xmlrpc \
  php8.4-yaml \
  php8.4-zip \
  postgresql-client \
  tzdata \
  unzip \
  yarn

# backup files we will overwrite
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.dist
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.dist
cp /etc/php/8.4/fpm/php-fpm.conf /etc/php/8.4/fpm/php-fpm.conf.dist

# install composer
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#!/bin/bash

curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

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
  php8.2-ast \
  php8.2-bcmath \
  php8.2-cli \
  php8.2-common \
  php8.2-curl \
  php8.2-decimal \
  php8.2-enchant \
  php8.2-fpm \
  php8.2-gd \
  php8.2-gnupg \
  php8.2-grpc \
  php8.2-http \
  php8.2-imagick \
  php8.2-imap \
  php8.2-intl \
  php8.2-ldap \
  php8.2-mbstring \
  php8.2-mysql \
  php8.2-pgsql \
  php8.2-protobuf \
  php8.2-pspell \
  php8.2-raphf \
  php8.2-readline \
  php8.2-redis \
  php8.2-soap \
  php8.2-sqlite \
  php8.2-ssh2 \
  php8.2-tidy \
  php8.2-xdebug \
  php8.2-xml \
  php8.2-xmlrpc \
  php8.2-yaml \
  php8.2-zip \
  postgresql-client \
  tzdata \
  unzip \
  yarn

# disable xdebug
rm /etc/php/8.2/*/conf.d/20-xdebug.ini

curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# default down: syslog, cron, nginx, php-fpm
chmod 644 /etc/my_init.d/10_syslog-ng.init \
  && touch /etc/runit/runsvdir/default/cron/down

mkdir -p /etc/runit/runsvdir/default/nginx \
  && touch /etc/runit/runsvdir/default/nginx/down

mkdir -p /etc/runit/runsvdir/default/php-fpm \
  && touch /etc/runit/runsvdir/default/php-fpm/down

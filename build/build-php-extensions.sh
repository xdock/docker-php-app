#!/bin/bash

mkdir /build/php-extensions

install_clean ca-certificates
apt-add-repository -y ppa:ondrej/php

install_clean \
  pkg-config \
  php8.2-dev \
  git \
  make \
  unzip

##
## DIO Extension
##
cd /build
curl -L https://github.com/php/pecl-system-dio/archive/refs/tags/dio-0.3.0.zip --output pecl-system-dio-dio-0.3.0.zip
unzip pecl-system-dio-dio-0.3.0.zip
cd pecl-system-dio-dio-0.3.0
phpize && ./configure && make -j $(nproc)
cp /build/pecl-system-dio-dio-0.3.0/modules/dio.so /build/php-extensions/dio.so

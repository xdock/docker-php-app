#!/bin/bash

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
curl -L https://github.com/php/pecl-system-dio/archive/refs/tags/dio-0.2.1.zip --output pecl-system-dio-dio-0.2.1.zip
unzip pecl-system-dio-dio-0.2.1.zip
cd pecl-system-dio-dio-0.2.1
phpize && ./configure && make -j $(nproc) && make install

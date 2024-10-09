#!/bin/bash

# disable xdebug
rm /etc/php/8.3/*/conf.d/20-xdebug.ini

# default down: syslog, cron, nginx, php-fpm
chmod 644 /etc/my_init.d/10_syslog-ng.init

phpenmod -s fpm php-custom-fpm

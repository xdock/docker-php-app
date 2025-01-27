#!/bin/bash

# disable xdebug
rm /etc/php/8.4/*/conf.d/20-xdebug.ini

# default syslog down
chmod 644 /etc/my_init.d/10_syslog-ng.init

# update imagick policy to allow pdfs
#sed -i 's/rights="none" pattern="PDF"/rights="read" pattern="PDF"/' /etc/ImageMagick-6/policy.xml

# For production only, enable FPM stats server
if [[ "$APP_ENV" == "production" ]]; then
  ln -s /etc/nginx/sites-available/fpm-status /etc/nginx/sites-enabled/fpm-status
fi

phpenmod -s fpm customizations.fpm
phpenmod -s cli customizations.cli

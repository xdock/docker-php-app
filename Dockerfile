##
## Multistage Part: PHP Extensions
##
FROM phusion/baseimage:jammy-1.0.1 AS php-extensions

RUN --mount=type=bind,source=build/build-php-extensions.sh,target=/build/build-php-extensions.sh \
    bash /build/build-php-extensions.sh


##
## Image Start
##
FROM phusion/baseimage:jammy-1.0.1 AS image

LABEL maintainer="Ralph Schindler"

EXPOSE 80

# Generally don't override these
ENV COMPOSER_HOME="/root/.composer" \
    COMPOSER_ALLOW_SUPERUSER=1 \
    NODE_MAJOR="20" \
    PATH="$PATH:/app/vendor/bin:/app:/app/node_modules/.bin:." \
    PHP_IDE_CONFIG="serverName=localhost" \
    TERM="xterm-256color"

# Environment variables to be overridden if needed
ENV APP_NAME="xdock-php-app" \
    APP_ENV="production" \
    MY_INIT_COMMAND="/sbin/my_init --quiet" \
    PHP_FPM_INI_MEMORY_LIMIT="128M" \
    PHP_FPM_INI_OPCACHE_BLACKLIST_FILENAME="/etc/php/opcache-blacklist.enabled" \
    PHP_FPM_INI_POST_MAX_SIZE="10M" \
    PHP_FPM_INI_UPLOAD_MAX_FILESIZE="10M" \
    PHP_FPM_CONF_PM="dynamic" \
    PHP_FPM_CONF_PM_MAX_CHILDREN="5"

RUN --mount=type=bind,source=build/build-image.sh,target=/build/build-image.sh \
    bash /build/build-image.sh

COPY --from=php-extensions /usr/lib/php/20220829/dio.so /usr/lib/php/20220829/dio.so
COPY overlay/ /

ENTRYPOINT ["/usr/local/bin/entrypoint"]

CMD ["/bin/true"]

WORKDIR /app

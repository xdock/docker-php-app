FROM phusion/baseimage:noble-1.0.0

LABEL maintainer="Ralph Schindler"

EXPOSE 80

# Generally don't override these
ENV COMPOSER_HOME="/root/.composer" \
    COMPOSER_ALLOW_SUPERUSER=1 \
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

RUN --mount=type=bind,source=build/,target=/build/build-01-packages.sh bash /build/build-01-packages.sh

COPY overlay/ /

RUN --mount=type=bind,source=build/,target=/build/build-02-setup.sh bash /build/build-02-setup.sh

ENTRYPOINT ["/usr/local/bin/entrypoint"]

CMD ["/bin/true"]

WORKDIR /app

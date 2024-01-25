#!/bin/bash

# in local, use this special opcache-blacklist
if [[ "$APP_ENV" == "local" ]]; then
  # todo: use /app/.xdock/<special-place>/opcache-blacklist if present

  ln -sf /etc/php/opcache-blacklist /etc/php/opcache-blacklist.enabled
fi
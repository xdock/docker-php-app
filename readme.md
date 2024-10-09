# xdock/php-app: Production Grade PHP App Container Based On Phusion

See the main readme here: https://github.com/xdock/docker-php

## Quick Install

Create a `docker-compose.yml` file in the root of your project:

```
services:

  web:
    image: ghcr.io/xdock/php-app:8.3-2024.08
    command: run-services web
    environment:
      APP_NAME: my-project-name
      APP_ENV: local
    ports:
      - 8000:80
    volumes:
      - .:/app
```

Then, start the project:

```
docker compose up -d
```

Finally, visit it at http://localhost:8000

## Features

### Startup Scripts

use `ENTRYPOINT_SCRIPT` environment variable with the path to the
project mounted (in container) script to run during container startup.

Example:
```yml
services:
  web:
    environment:
      ENTRYPOINT_SCRIPT: /app/.entryscript.sh
```

FROM digitonic/php8.1:latest

RUN echo '{"minimum-stability": "dev"}' > composer.json

RUN composer require laravel/vapor-cli --update-with-dependencies

RUN ln -s /app/vendor/bin/vapor /usr/local/bin/vapor

ENTRYPOINT []

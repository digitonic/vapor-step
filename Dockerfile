FROM digitonic/php8.1:latest

ARG GITHUB_TOKEN

RUN echo '{"minimum-stability": "dev"}' > composer.json

RUN echo $GITHUB_TOKEN

RUN composer config --global github-oauth.github.com $GITHUB_TOKEN

RUN composer require laravel/vapor-cli --update-with-dependencies

RUN ln -s /vendor/bin/vapor /usr/local/bin/vapor

RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh && sudo bash /tmp/nodesource_setup.sh && sudo apt install nodejs -y

ENTRYPOINT []

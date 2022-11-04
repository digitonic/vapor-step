FROM digitonic/php8.1:latest

ARG GITHUB_TOKEN

RUN echo '{"minimum-stability": "dev"}' > composer.json

RUN echo $GITHUB_TOKEN

RUN mkdir ~/.ssh

RUN ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN composer config --global github-oauth.github.com $GITHUB_TOKEN

RUN composer require laravel/vapor-cli --update-with-dependencies

RUN ln -s /vendor/bin/vapor /usr/local/bin/vapor

ENV NODE_VERSION 16.18.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

ENV NVM_DIR=/root/.nvm

RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm install 12.21.0 && nvm use 12.21.0
RUN . "$NVM_DIR/nvm.sh" && nvm install 14.21.0 && nvm use 14.21.0
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}

ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

ENTRYPOINT []

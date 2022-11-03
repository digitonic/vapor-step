FROM digitonic/php8.1:latest

ARG GITHUB_TOKEN

RUN echo '{"minimum-stability": "dev"}' > composer.json

RUN echo $GITHUB_TOKEN

RUN mkdir ~/.ssh

RUN ssh-keyscan github.com >> ~/.ssh/known_hosts

RUN composer config --global github-oauth.github.com $GITHUB_TOKEN

RUN composer require laravel/vapor-cli --update-with-dependencies

RUN ln -s /vendor/bin/vapor /usr/local/bin/vapor

RUN curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

RUN source ~/.bashrc

RUN nvm install node && nvm install node 12 && nvm install node 14 && nvm install node 16

RUN ln -s /vendor/bin/vapor /usr/local/bin/vapor

ENTRYPOINT []

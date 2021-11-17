FROM php:7.4-fpm

WORKDIR /tmp

RUN apt update
RUN apt install zip unzip -y

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN mv composer.phar /usr/local/bin/composer

RUN composer global require vimeo/psalm
RUN composer global require phpstan/phpstan
RUN composer global require phpmd/phpmd
RUN composer global require squizlabs/php_codesniffer
RUN composer global require friendsofphp/php-cs-fixer

RUN ln -s /root/.composer/vendor/bin/phpcs /usr/local/bin/phpcs
RUN ln -s /root/.composer/vendor/bin/phpmd /usr/local/bin/phpmd
RUN ln -s /root/.composer/vendor/bin/psalm /usr/local/bin/psalm
RUN ln -s /root/.composer/vendor/bin/phpstan /usr/local/bin/phpstan
RUN ln -s /root/.composer/vendor/bin/php-cs-fixer /usr/local/bin/php-cs-fixer

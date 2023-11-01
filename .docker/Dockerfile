# Utiliza la imagen oficial de PHP con Apache
FROM php:8.2-apache

# Instala las extensiones PHP necesarias (ajusta según tus necesidades)
RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

COPY composer.json .
COPY composer.lock .

RUN a2enmod rewrite

COPY .docker/default.conf /etc/apache2/sites-enabled/000-default.conf

ENV COMPOSER_ALLOW_SUPERUSER=1


EXPOSE 80

VOLUME [ "/var/www/html" ]

CMD ["apache2-foreground"]

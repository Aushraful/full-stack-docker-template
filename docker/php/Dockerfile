# Install PHP
FROM php:8.2.7-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
	git \
	curl \
	libpng-dev \
	libonig-dev \
	libxml2-dev \
	zip \
	unzip

# Install Xdebug
RUN yes | pecl install xdebug

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install mbstring pdo_mysql exif pcntl bcmath gd opcache

# php-fpm config
COPY ./docker/php/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf

# php config
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini

# xdebug config
COPY ./docker/php/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# opcache config
COPY ./docker/php/opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Composer install
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

# setup config
COPY ./docker/php/setup.sh /setup.sh

RUN chmod +x /setup.sh

# EXPOSE port number
EXPOSE 9000

RUN mkdir -p /var/www/api

# Set working directory
WORKDIR /var/www/api

CMD [ "bash", "-c", "/setup.sh && php-fpm" ]



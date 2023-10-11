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
COPY ./php-fpm.conf /usr/local/etc/php-fpm.d/www.conf

# php config
COPY ./php.ini /usr/local/etc/php/php.ini

# xdebug config
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# opcache config
COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini

# Composer install
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

# setup config
COPY ./setup.sh /setup.sh

RUN chmod +x /setup.sh

# EXPOSE port number
EXPOSE 9000

RUN mkdir -p /var/www/laravel_pjt_1

# Set working directory
WORKDIR /var/www/laravel_pjt_1

CMD [ "bash", "-c", "/setup.sh && php-fpm" ]



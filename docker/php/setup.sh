#!/bin/sh

cd /var/www/api

# coping .env.local to .env
cp .env.example .env

echo "Generating fresh key..."
php artisan key:generate
echo "Done."

if test -f /vendor; then
	echo "Removing vendor..."
	rm -rf vendor
	echo "Done."
fi

echo "Doing a composer install..."
composer install --ignore-platform-reqs
echo "Done."

echo "executing migration..."
php artisan migrate
composer dump-autoload
php artisan db:seed
echo "Done."

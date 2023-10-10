#!/bin/sh

cd /var/www/api

# coping .env.local to .env
cp .env.example .env

echo "Linking storage..."
php artisan storage:link
echo "Done."

echo "Setting storage permission..."
chown -R www-data:www-data storage
chmod -R 775 storage
echo "Done."

echo "Cleaning cache files..."
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
echo "Done."

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

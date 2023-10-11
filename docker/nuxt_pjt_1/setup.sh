#!/bin/sh

cd /var/www/nuxt_pjt_1

# coping .env.local to .env
cp .env.example .env

if test -f /node_modules; then
	echo "Removing node_modules..."
	rm -rf node_modules
	echo "Done."
fi

echo "Doing a yarn install..."
yarn install
echo "Done."

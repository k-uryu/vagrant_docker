#!/bin/bash
cd src
git clone -b 2.x https://github.com/cakephp/cakephp.git

echo 'vim workspace/nginx/sites/default.conf'
echo '-----------------------------------------------------------------'
echo '! #root /var/www/public;'
echo '+ root /var/www/cakephp/app/webroot;'
echo '-----------------------------------------------------------------'
echo ' ↓ '
echo 'docker-compose restart nginx'
echo ' ↓ '
echo 'vim workspace/.env'
echo '-----------------------------------------------------------------'
echo '! #PHP_FPM_INSTALL_INTL=false'
echo '+ PHP_FPM_INSTALL_INTL=true'
echo '-----------------------------------------------------------------'
echo ' ↓ '
echo 'docker-compose up -d --build php-fpm'
echo ' ↓ '
echo 'Access to 33.33.33.10:80'

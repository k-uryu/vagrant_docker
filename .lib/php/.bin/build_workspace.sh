#!/bin/bash

ROOT_DIR=`dirname $0`

git clone -b v6.0.1 https://github.com/Laradock/laradock.git workspace
cp -r ${ROOT_DIR}/.bin workspace/.bin

cd workspace
cp env-example .env

echo 'cd workspace'
echo ' ↓ '
echo 'vim .env'
echo '-----------------------------------------------------------------'
echo '! #APPLICATION=../'
echo '+ APPLICATION=../src'
echo ''
echo '! #PHP_VERSION=72'
echo '+ #PHP_VERSION=56'
echo ''
echo '! #DATA_SAVE_PATH=~/.laradock/data'
echo '+ DATA_SAVE_PATH=~/.laradock/data/php'
echo '-----------------------------------------------------------------'
echo ' ↓ '
echo 'vim docker-compose.yml'
echo '-----------------------------------------------------------------'
echo '  applications:'
echo '  image: tianon/true'
echo '+ volumes:'
echo '+   - ${APPLICATION}:/var/www/'
echo '-----------------------------------------------------------------'
echo ' ↓ '
echo './.bin/docker_up.sh'

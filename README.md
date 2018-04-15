# 起動手順

## 環境作成(ビルドに1時間程かかる)

### HOST側での作業
1. $ `./.bin/vagrant_up.sh`
1. $ `vagrant ssh`

### Vagrant側での作業
1. $ `cd /vagrant/.lib/php`
1. $ `./.bin/build_workspace.sh`
1. $ `cd workspace`
1. $ `vim .env`

    ```
    ! #APPLICATION=../
    + APPLICATION=../src

    ! #PHP_VERSION=72
    + #PHP_VERSION=56

    ! #DATA_SAVE_PATH=~/.laradock/data
    + DATA_SAVE_PATH=~/.laradock/data/php
    ```
1. $ `vim docker-compose.yml`

    ```
      applications:
      image: tianon/true
    + volumes:
    +   - ${APPLICATION}:/var/www/
    ```
1. $ `./.bin/docker_up.sh`

## プロジェクト作成 (CakePHPの場合)

### Vagrant側での作業
1. $ `cd /vagrant/.lib/php`
1. $ `./.bin/create_cakephp_project.sh`
1. $ `vim workspace/nginx/sites/default.conf`

    ```
    ! #root /var/www/public;
    + root /var/www/cakephp/app/webroot;'
    ```
1. $ `docker-compose restart nginx`
1. $ `vim workspace/.env`

    ```
    ! #PHP_FPM_INSTALL_INTL=false
    + PHP_FPM_INSTALL_INTL=true
    ```
1. $ `docker-compose up -d --build php-fpm`
1. Access to `33.33.33.10:80`

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
    + PHP_VERSION=56

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
1. $ `vim src/cakephp/app/Config/core.php`(好きな文字列に変更)

    ```
    ! /*Configure::write('Security.salt', 'DYhG93b0qyJfIxfs2guVoUubWwvniR2G0FgaC9mi');*/
    + Configure::write('Security.salt', 'DYhG93b0qyJfIxfs2guVoUubWwvniR2G0Fgu3kur');

    ! /*Configure::write('Security.cipherSeed', '76859309657453542496749683645');*/
    + Configure::write('Security.cipherSeed', '76859309657453542496719940206');
    ```
1. $ `cp src/cakephp/app/Config/database.php.default src/cakephp/app/Config/database.php`
1. $ `vim src/cakephp/app/Config/database.php`

    ```
      public $default = array(
        'datasource' => 'Database/Mysql',
        'persistent' => false,
    !   'host' => 'mysql',
    !   'login' => 'default',
    !   'password' => 'secret',
    !   'database' => 'default',
        'prefix' => '', 
    !   'encoding' => 'utf8',
      );

      public $test = array(
        'datasource' => 'Database/Mysql',
        'persistent' => false,
    !   'host' => 'mysql',
    !   'login' => 'default',
    !   'password' => 'secret',
    !   'database' => 'default',
        'prefix' => '', 
    !   'encoding' => 'utf8',
      );
    ```
1. git clone https://github.com/cakephp/debug_kit.git src/cakephp/app/Plugin/DebugKit
1. vim src/cakephp/app/Config/bootstrap.php

    ```
       *
       * CakePlugin::loadAll(); // Loads all plugins at once
       * CakePlugin::load('DebugKit'); // Loads a single plugin named DebugKit
       */
    + CakePlugin::load('DebugKit');
    ```
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

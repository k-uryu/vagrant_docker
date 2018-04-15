# 起動手順

## 環境作成(ビルドに1時間程かかる)

### HOST側での作業
1. ./.bin/vagrant_up.sh
1. vagrant ssh

### Vagrant側での作業
1. cd /vagrant/.lib/php
1. ./.bin/build_workspace.sh
1. vim .env
    ```
    ! #APPLICATION=../
    + APPLICATION=../src

    ! #PHP_VERSION=72
    + #PHP_VERSION=56

    ! #DATA_SAVE_PATH=~/.laradock/data
    + DATA_SAVE_PATH=~/.laradock/data/cakephp
    ```
1. vim docker-compose.yml
    ```
      applications:
      image: tianon/true
    + volumes:
    +   - ${APPLICATION}:/var/www/
    ```
1. ./.bin/docker_up.sh

## プロジェクト作成

### Vagrant側での作業
1. cd /vagrant/.lib/php/workspace
1. ./.bin/login_workspace.sh
1. 

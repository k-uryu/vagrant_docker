#!/bin/bash

ROOT_DIR=`dirname $0`
${ROOT_DIR}/.bin/docker_up.sh nginx mysql phpmyadmin

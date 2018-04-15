#!/bin/bash
docker-compose down && docker ps -aq | xargs docker rm

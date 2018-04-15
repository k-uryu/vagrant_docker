#!/bin/bash
docker images -aq | xargs docker rmi

#!/usr/bin/env bash
# How to use:
# - chmod +x symfony-setup.sh
# - ./symfony-setup.sh

# Symfony Version 
VERSION="7.2.x"
# Folder 
DIR_NAME="app/symfony"
# doctoot on Server 
WORKING_DIR="/var/www/html"
# ddev settings 
set -e
ddev start
echo "setup start..."
echo "Composer create-project $DIR_NAME ..."
# install empty symfony skeleton
ddev exec "cd $WORKING_DIR && rm -rf $DIR_NAME/ && composer create-project symfony/skeleton:$VERSION $DIR_NAME -n"
# install bundles 
echo "Install bundles start..."
ddev exec "cd $WORKING_DIR/$DIR_NAME && composer require --dev symfony/profiler-pack"
echo "setup finish..."
ddev stop

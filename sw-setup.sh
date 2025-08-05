#!/usr/bin/env bash
# How to use:
# - chmod +x sw-symfony-setup.sh
# - ./sw-symfony-setup.sh
# Shopware Settings
## Shopware Version
VERSION="6.7.1.2"
##
SHOP_LOCALE="de-DE"
##
SHOP_CURRENCY="EUR"
##
APP_DEBUG="1"
##
APP_ENV="dev"
# Server settings
## Folder chg foldername "shopware-dev" to your projectname
DIR_NAME="app/shopware-dev"
## doctoot on Server
WORKING_DIR="/var/www/html"
#ä server that is used
SERVER_TYPE="apache-fpm"
## PHP
PHP_VERSION="8.4"
## MySQL
MYSQL_VERSION="8.4"
# ddev settings
## ddev settings for project
PROJECT_TYPE="shopware6"
set -e
echo "Config ddev project ..."
ddev config --project-type=$PROJECT_TYPE \
        --disable-settings-management \
        --docroot=$DIR_NAME/public \
        --create-docroot \
        --web-working-dir=$WORKING_DIR/$DIR_NAME \
        --database=mysql:$MYSQL_VERSION \
        --php-version=$PHP_VERSION \
        --webserver-type=$SERVER_TYPE \
        --web-environment-add="DATABASE_URL=mysql://db:db@db:3306/db,MAILER_DSN=smtp://localhost:1025?encryption=&auth_mode=,APP_URL=\${DDEV_PRIMARY_URL},APP_DEBUG=$APP_DEBUG,APP_ENV=$APP_ENV"
ddev config global --xdebug-ide-location=wsl2
ddev start
echo "setup start..."
echo "Composer create-project $DIR_NAME ..."
# install empty shopware skeleton
ddev exec "cd $WORKING_DIR && rm -rf $DIR_NAME/ && composer create-project shopware/production:$VERSION $DIR_NAME -n"
# install bundles
echo "Install bundles start..."
ddev exec "cd $WORKING_DIR/$DIR_NAME && composer require --dev symfony/profiler-pack"
echo "Install shopware start..."
ddev exec "cd $WORKING_DIR/$DIR_NAME && bin/console system:install --shop-locale=$SHOP_LOCALE --shop-currency=$SHOP_CURRENCY --basic-setup -n"
echo "setup finish..."
ddev start
# ddev install tools
ddev add-on get ddev/ddev-phpmyadmin
# ddev add-on get ddev/ddev-adminer
ddev stop

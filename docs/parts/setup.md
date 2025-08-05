![logo](../assets/logo.png)

##### [← Back to overview](../README.md)

SW-Setup
==============================

### sw-setup.sh only for new shopware 6 project 
you only need it if no project exists under app/project or you want a new clean project 
```
chmod +x sw-setup.sh
./sw-setup.sh
```

## Shopware Settings
### Shopware Version
VERSION="6.7.1.2"
#### use de-DE, en-EN or your country code 
SHOP_LOCALE="de-DE"
### currency setting
SHOP_CURRENCY="EUR"
#### app debugmodus setting 0/1
APP_DEBUG="1"
### use prod or dev 
APP_ENV="dev"

## Server settings
#### changefoldername "shopware-dev" to your projectname
DIR_NAME="app/shopware-dev"
#### doctoot on Server
WORKING_DIR="/var/www/html"
#### server that is used
SERVER_TYPE="apache-fpm"
#### PHP
PHP_VERSION="8.4"
#### MySQL
MYSQL_VERSION="8.4"

## ddev settings
#### ddev settings for project
PROJECT_TYPE="shopware6"

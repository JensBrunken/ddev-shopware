#!/usr/bin/env bash
# How to use:
# - chmod +x sw-run.sh
# - ./sw-run.sh

set -e
ddev start
ddev xdebug on
ddev restart
ddev launch
ddev launch /admin
ddev phpmyadmin
# ddev adminer


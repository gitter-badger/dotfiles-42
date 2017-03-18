#!/bin/bash

# Create OSX icons: https://iconverticons.com/online/

set -e
APP_DIR="${HOME}/Applications"
DOT_DIR="${HOME}/.dotfiles"
ICON_DIR="${DOT_DIR}/assets"

cd ${APP_DIR}

app_name="Plan" 
icon_name="$(echo $app_name | tr '[:upper:]' '[:lower:]')"

if [ ! -d ${APP_DIR}/${app_name}.app ]; then
    nativefier -n "Plan" -i "${ICON_DIR}/${icon_name}.icns" "https://getplan.co/" $APP_DIR
    mv "${APP_DIR}/${app_name}-darwin-x64/${app_name}.app" $APP_DIR
    rm -rf "${APP_DIR}/${app_name}-darwin-x64/"
fi

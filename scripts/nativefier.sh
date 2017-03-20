#!/bin/bash

# Create OSX icons: https://iconverticons.com/online/

set -e
APP_DIR="${HOME}/Applications"
DOT_DIR="${HOME}/.dotfiles"
ICON_DIR="${DOT_DIR}/assets"

cd ${APP_DIR}

apps=(
    "Plan https://getplan.co"
    "Coggle https://coggle.it"
)

for app in "${apps[@]}"
do
    a=(${app[@]})
    i="$(echo ${a[0]} | tr '[:upper:]' '[:lower:]')"

    if [ ! -d ${APP_DIR}/${a[0]}.app ]; then
        nativefier -n ${a[0]} -i "${ICON_DIR}/${i}.icns" ${a[1]} $APP_DIR
        mv "${APP_DIR}/${a[0]}-darwin-x64/${a[0]}.app" $APP_DIR
        rm -rf "${APP_DIR}/${a[0]}-darwin-x64/"
    fi
done

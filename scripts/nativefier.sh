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
    "Power_BI https://app.powerbi.com"
)

for app in "${apps[@]}"
do
    a=(${app[@]})
    name="$(echo ${a[0]} | sed 's/_/ /g')"
    url=${a[1]}
    icon="$(echo ${a[0]} | tr '[:upper:]' '[:lower:]')"

    if [ ! -d "${APP_DIR}/${name}.app" ]; then
        nativefier -n "${name}" -i "${ICON_DIR}/${icon}.icns" ${url} $APP_DIR
        mv "${APP_DIR}/${name}-darwin-x64/${name}.app" $APP_DIR
        rm -rf "${APP_DIR}/${name}-darwin-x64/"
    fi
done

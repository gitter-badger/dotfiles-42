#!/bin/sh -eu

MODULES=('create-react-app')

for module in $MODULES; do
    echo "Installing $module..."
    npm install -g ${module}@latest
done

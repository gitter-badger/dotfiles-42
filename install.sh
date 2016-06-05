#!/bin/bash
set -e
DOT_DIRECTORY="${HOME}/.dotfiles"

cd ${DOT_DIRECTORY}

ln -snfv ${DOT_DIRECTORY}/karabiner.xml ${HOME}/Library/Application\ Support/Karabiner/private.xml

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done


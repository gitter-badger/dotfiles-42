#!/bin/bash
set -e
DOT_DIRECTORY="${HOME}/.dotfiles"

cd ${DOT_DIRECTORY}

# Install apps and fonts with Homebrew
[ `which brew` ] || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew bundle

# Symlink all dotfiles to home directory
for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done

# zsh
if [ ! -d ${HOME}/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh ${HOME}/.oh-my-zsh
fi

## zsh plugin
if [ ! -d ${HOME}/.oh-my-zsh/custom/plugins/notify ]; then
    git clone https://github.com/marzocchi/zsh-notify ${HOME}/.oh-my-zsh/custom/plugins/notify
fi


### change the login shell
readonly ZSH=/usr/local/bin/zsh

if ! grep "${ZSH}" /etc/shells; then
    echo "${ZSH}" | sudo tee -a /etc/shells
fi

if [ $SHELL != "/usr/local/bin/zsh" ]; then
    chsh -s $ZSH
fi

# tmux
pip install --user powerline-status

## tmux plugin
if [ ! -d ${HOME}/.tmux/plugins/tpm ]; then
   git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
fi
${HOME}/.tmux/plugins/tpm/bin/install_plugins

# GUI Application

## iTerm2
if [ -d ${HOME}/Library/Application\ Support/iTerm2/DynamicProfiles/ ]; then
    ln -snfv ${DOT_DIRECTORY}/iterm2_dynamic_profiles.json ${HOME}/Library/Application\ Support/iTerm2/DynamicProfiles/
fi

## Karabiner
if [ -d ${HOME}/Library/Application\ Support/Karabiner/DynamicProfiles/ ]; then
    ln -snfv ${DOT_DIRECTORY}/karabiner.xml ${HOME}/Library/Application\ Support/Karabiner/private.xml
fi

if [ -d ${HOME}/Library/Application\ Support/iTerm2/DynamicProfiles/ ]; then
    ln -snfv ${DOT_DIRECTORY}/karabiner.json ${HOME}/.config/karabiner/
fi

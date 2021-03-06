#!/bin/bash
set -e
DOT_DIRECTORY="${HOME}/.dotfiles"

ITERM_PROFILE_DIR="${HOME}/Library/Application Support/iTerm2/DynamicProfiles"
KARABINER_CONFIG_DIR="${HOME}/Library/Application Support/Karabiner"
KARABINER_ELEMENT_CONFIG_DIR="${HOME}/.config/karabiner"
KEYHAC_CONFIG_DIR="${HOME}/Library/Application Support/Keyhac"

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

## fzf: install useful keybindings and fuzzy completion
[[ ! -f ~/.fzf.zsh ]] && /usr/local/opt/fzf/install

# GUI Application

## iTerm2
if [ -d "${ITERM_PROFILE_DIR}" ]; then
    ln -snfv ${DOT_DIRECTORY}/iterm_profiles.json "${ITERM_PROFILE_DIR}"
fi

## Karabiner
if [ -d "${KARABINER_CONFIG_DIR}" ]; then
    ln -snfv ${DOT_DIRECTORY}/karabiner.xml "${KARABINER_CONFIG_DIR}/private.xml"
fi

if [ -d "${KARABINER_ELEMENT_CONFIG_DIR}" ]; then
    ln -snfv ${DOT_DIRECTORY}/karabiner-elements.json "${KARABINER_ELEMENT_CONFIG_DIR}/karabiner.json"
fi

## Keyhac
if [ -d "${KEYHAC_CONFIG_DIR}" ]; then
    ln -snfv ${DOT_DIRECTORY}/keyhac.py "${KEYHAC_CONFIG_DIR}/config.py"
fi

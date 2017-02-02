# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# User configuration
export PATH=/usr/local/bin:$PATH

# notify
export SYS_NOTIFIER="/usr/local/bin/terminal-notifier"
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=10

# Powerline
export PATH=/usr/local/lib/python2.7/sbin:$PATH

# coreutils with their normal names
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Homebrew
export PATH="/usr/local/sbin:$PATH"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# postgreSQL
export PGDATA=/usr/local/var/postgres
export PGHOST=localhost

# added by travis gem
[ -f ${HOME}/.travis/travis.sh ] && source ${HOME}/.travis/travis.sh

# You may need to manually set your language environment
#
# python
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Swift
PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH

# Composer
PATH=~/.composer/vendor/bin:$PATH

# npm
export NODE_PATH=/usr/local/lib/node_modules

# Editor
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# Terminal
export TERM=xterm-256color

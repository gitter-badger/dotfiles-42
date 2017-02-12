# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Add by Laravel
export PATH="~/.composer/vendor/bin:$PATH"

# Add by Django
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/bash_autocomplete

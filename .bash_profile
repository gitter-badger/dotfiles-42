[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

alias be="bundle exec"

export PATH="$HOME/.rbenv/bin:$PATH"

# Add by Laravel
export PATH=~/.composer/vendor/bin:$PATH

# Add by Android Studio
export PATH=$PATH:/Users/lc4u0w4/Library/Android/sdk/platform-tools

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

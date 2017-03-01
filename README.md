# dotfiles

lyuich's dotfiles

## Installation

### ShellScript

```text
$ git clone https://github.com/lyuich/dotfiles .dotfiles
$ cd .dotfiles
$ sh install.sh
```

### Manually Installation

#### Homebrew

```text
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew bundle
```

#### Zsh

Change Login Shell to Zsh

`$ chsh -s /usr/local/bin/zsh`

Install oh-my-zsh

`$ git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh`

Install zsh-plugins

```text
$ cd ~/.oh-my-zsh/custom/plugins

$ git clone git@github.com:marzocchi/zsh-notify.git notify
```

#### Tmux

Install Powerline

`$ pip install --user powerline-status`

Install powerline font

```text
$ git clone https://git@github.com/powerline/fonts.git
$ sh fonts/install.sh
$ rm -rf fonts
```

Install tpm (Tmux Plugin Manager)

`$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

Reload TMUX environment with `prefix + R` and Install tmux plugins with `prefix + I`

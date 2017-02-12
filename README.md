# dotfiles

lyuich's dotfiles

## Installation

- open Terminal.app (or Iterm2)

```text
$ git clone https://github.com/lyuich/dotfiles .dotfiles
$ cd .dotfiles
$ sh install.sh
```

### Install with Homebrew

```text
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew bundle
```

### Zsh

#### Change Login Shell to Zsh

`$ chsh -s /usr/local/bin/zsh`

- then, restart Terminal

#### Install oh-my-zsh

`$ git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh`

#### Install zsh-plugins

```text
$ cd ~/.oh-my-zsh/custom/plugins

$ git clone git@github.com:marzocchi/zsh-notify.git notify
```

### Tmux

### Install Powerline

`$ pip install --user powerline-status`

- install powerline font

```text
$ git clone https://git@github.com/powerline/fonts.git
$ sh fonts/install.sh
$ rm -rf fonts
```

#### Install tpm (Tmux Plugin Manager)

`$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

- Reload TMUX environment with `prefix + R`
- install tmux plugins with `prefix + I`

A collection of common shell configurations that I use across systems.

## MacOS Installation

Homebrew requirements
```
xcode-select --install
```

Install Homebrew
https://brew.sh/
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Install dotfiles
```
git clone https://github.com/m-martinez/dotfiles ~/.dotfiles
~/.dotfiles/install.sh
```

## Linux Installation (RHEL)

System requirements
```
sudo yum install zsh
chsh /usr/bin/zsh
```

Homebrew requirements
```
sudo yum groupinstall 'Development Tools'
sudo yum install procps-ng curl file git
```

Install homebrew linux
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
brew install gcc
```

Install dotfiles
```
git clone https://github.com/m-martinez/dotfiles ~/.dotfiles
~/.dotfiles/install.sh
```

Fix Pyenv Installation for Linux
You'll have to re-install pyenv because it will be installed with an incorrect gcc dependency
More info:  https://github.com/pyenv/pyenv/issues/2039#issuecomment-917477753)
```
brew install gcc@5
brew reinstall pyenv pyenv-virtualenv
env CFLAGS="-I$(brew --prefix)/include" CPPFLAGS="-I$(brew --prefix)/include" LDFLAGS="-L$(brew --prefix)/lib" PYTHON_CONFIGURE_OPTS="CC=gcc-5" pyenv install 3.9.11
```

## Create a virtual environment for NVim

Create a virtual environment for nvim
```
pyenv virtualenv 3.9.11 py39nvim
pyenv activate py39nvim
python3 -m pip install pynvim poetry
pyenv which python
```

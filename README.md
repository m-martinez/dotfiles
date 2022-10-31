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

## Create a virtual environment for NVim

Create a virtual environment for nvim
```
pyenv virtualenv 3.9.14 py39nvim
pyenv activate py39nvim
python3 -m pip install pynvim
pyenv which python
```

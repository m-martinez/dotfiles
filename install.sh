#!/usr/bin/env zsh

#
# Installs third-party shell/vim plugins and links common dotfiles
#

HERE=$(dirname "$0")

BGREEN='\033[1;32m'
YELLOW='\033[0;33m'
NOCOLOR='\033[0m'


echo "${BGREEN}==> Installing brew applications${NOCOLOR}"

if command -v brew >/dev/null 2>&1; then
  brew bundle
fi


echo "${BGREEN}==> Configuring git${NOCOLOR}"

git config --global color.ui auto
git config --global user.name "Marco Martinez"
git config --global user.email "m-martinez@users.noreply.github.com"
git config --global push.default simple
git.config --global push.followTags true
git config --global alias.glog "log --graph --pretty=format:'%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(bold blue)<%an>%C(reset)'"
git config --global alias.graph="log --pretty=oneline --abbrev-commit --graph --decorate --all"
git config --global alias.prune "fetch --prune"
git config --global alias.undo "reset --soft HEAD^"
git config --global alias.stash-all "stash save --include-untracked"


echo "${BGREEN}==> Setting up ZSH ${NOCOLOR}"

if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "${YELLOW} OMZ is already setup${NOCOLOR}"
else
  rm -rf ~/.oh-my-zsh
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi


echo "${BGREEN}==> Linking dot files${NOCOLOR}"

for DOTFILE in ~/.dotfiles/_*; do
  DEST="$HOME/.${DOTFILE##*/_}"
  if [ -e "$DEST" -a ! -L "$DEST" ]; then
    echo -e "\tDeleting '$DEST' so we can use ours"
    rm -rf "$DEST"
	fi
  echo -e "\tLinking: $DOTFILE -> $DEST"
  ln -sfn $DOTFILE $DEST
done


echo "${BGREEN}==> Reloading zshell configuration file${NOCOLOR}"

source ~/.zshrc

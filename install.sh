#!/usr/bin/env bash

#
# Installs third-party shell/vim plugins and links common dotfiles
#

echo "==> Configuring git"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
git config --global color.ui auto
git config --global user.name "Marco Martinez"
git config --global user.email "m-martinez@users.noreply.github.com"
git config --global push.default simple

cat <<EOF

    Don't forget to run:

    git config --global user.signingkey GPGKEYID

EOF

echo "==> Installing Third-Party Plugins"
# ZSHELL enhancement suite
rm -rf ~/.oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# VIM plugin manager
rm -rf ~/.vim
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -u ~/.dotfiles/bundles.vim +PluginInstall +qall

echo "==> Linking dot files"
for DOTFILE in ~/.dotfiles/_*; do
  DEST="$HOME/.${DOTFILE##*/_}"
  if [ -e "$DEST" -a ! -L "$DEST" ]; then
		echo -e "\tDeleting '$DEST' so we can use ours"
    rm -f "$DEST"
	fi
  echo -e "\tLinking: $DOTFILE -> $DEST"
  ln -sfn $DOTFILE $DEST
done

echo "==> Loading zshell configuration"
source ~/.zshrc

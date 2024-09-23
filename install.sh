#!/usr/bin/env zsh

#
# Installs third-party shell/vim plugins and links common dotfiles
#

HERE=$(dirname "$0")

if command -v brew >/dev/null 2>&1; then
  brew bundle
fi

echo "==> Configuring git"
git config --global color.ui auto
git config --global user.name "Marco Martinez"
git config --global user.email "m-martinez@users.noreply.github.com"
git config --global push.default simple
git.config --global push.followTags true
git config --global alias.glog "log --graph --pretty=format:'%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(bold blue)<%an>%C(reset)'"
git config --global alias.prune "fetch --prune"
git config --global alias.undo "reset --soft HEAD^"
git config --global alias.stash-all "stash save --include-untracked"


cat <<EOF

    Don't forget to run:

    git config --global user.signingkey GPGKEYID

EOF

echo "==> Installing Third-Party Plugins"
# ZSHELL enhancement suite
rm -rf ~/.oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

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

echo "==> Linking XDG config files"
mkdir -p ~/.config/
for CONFIG in ~/.dotfiles/config/*; do
  DEST=~/.config/${CONFIG##*/}
  if [ -e "$DEST" -a ! -L "$DEST" ]; then
		echo -e "\tDeleting '$DEST' so we can use ours"
    rm -f "$DEST"
	fi
  echo -e "\tLinking: $CONFIG -> $DEST"
  ln -sfn $CONFIG $DEST
done

# VIM plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$EDITOR -u ~/.config/nvim/bundles.vim +PluginInstall +qall

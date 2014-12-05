#!/usr/bin/env bash

#
# install.sh
# Automagically sets up dot files
#

# Get the directory location of this script
HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#
# GIT CONFIG
#

echo "==> Configuring git"

git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
git config --global color.ui auto

echo "Done configuring git. If you will be managing git projects, remember to run the following commands:"
echo
echo "    git config --global user.name <YOUR FULLNAME>"
echo "    git config --global user.email <YOUR EMAIL>"

#
# GIT MODULES
#

echo "==> Updating git submodules"
git submodule update --init --recursive

#
# LIMIT ACCESS
#

chmod 700 $HERE   # make sure the dotfiles are only rwx by the owner
chmod 700 $HOME   # make sure my home dir is secured

#
# LINK DOT FILES
#

echo "==> Linking dot files"
for DOTFILE in $HERE/_*; do
  DEST="$HOME/.${DOTFILE##*/_}"
  if [ -e "$DEST" -a ! -L "$DEST" ]; then
		echo "Deleting '$DEST' so we can use ours"
    rm -f "$DEST"
  echo "Linking: $DOTFILE -> $DEST"
  ln -sfn $DOTFILE $DEST
	fi
done

#
# BUILDOUT
#

BUILDOUTDIRS=(
  "$HOME/.buildout"
  "$HOME/.buildout/eggs"
  "$HOME/.buildout/downloads"
  "$HOME/.buildout/zope"
  "$HOME/.buildout/extends"
)

echo "==> Creating untracked dot directories"
for DOTDIR in "${BUILDOUTDIRS[@]}"; do
  # if the directory doesn't exist, let's create it
  if [[ ! -d "$DOTDIR" ]] && [[ ! -a "$DOTDIR" ]]; then
    mkdir -p "$DOTDIR" && echo "created a $DOTDIR directory"
    chmod 700 "$DOTDIR"
  elif [[ ! -d "$DOTDIR" ]] && [[ -a "$DOTDIR" ]]; then
    echo "something in the way of $DOTDIR being created"
  fi
done

echo "==> Setting up buildout files"
BUILDOUT_DIR="$HOME/.buildout"
if [[ -d "$BUILDOUT_DIR" ]] && [ ! -e "$BUILDOUT_DIR/default.cfg" ]; then
  # create the default.cfg file
  cat > $BUILDOUT_DIR/default.cfg <<EOF
[buildout]
eggs-directory = $HOME/.buildout/eggs
download-cache = $HOME/.buildout/downloads
zope-directory = $HOME/.buildout/zope
extends-cache = $HOME/.buildout/extends

[instance]
event-log-level = debug
EOF
  echo "Created default.cfg at: $BUILDOUT_DIR"
fi

#
# ZSHELL
#

echo "==> Loading zshell configuration"
source ~/.zshrc

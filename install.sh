#!/usr/bin/env bash

#
# install.sh
# Automagically sets up dot files
#

# Get the directory location of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Files we do not want linked
EXCLUDE=(
    ..
    .
    .git
    .gitignore
    .svn
    .hg
    .DS_Store
    .AppleDouble
)

# Directories not under version control that need to be created
MKDIRS=(
    "$HOME/.buildout"
    "$HOME/.buildout/eggs"
    "$HOME/.buildout/downloads"
    "$HOME/.buildout/zope"
    "$HOME/.buildout/extends"
)

notExcluded() {
    # check that the value is not null
    if [ -z "$1" ]; then
        return
    fi

    for i in ${EXCLUDE[@]}; do
        if [ $i = $1 ]; then
            # the item exists
            return 1
        fi
    done

    # it did not exist
    return 0
}

linkDotfile() {
    local SOURCE="$1"
    local TARGET="$2"

    # symlink the conf file
    if [ ! -e "$TARGET" ]; then
        echo "Linking: ${SOURCE##*/}"
        ln -s $SOURCE $TARGET

    # warn the user that an existing file is in the way
    elif [ ! -h "$TARGET" -a -e "$TARGET" ]; then
        echo "Remove $TARGET so that it can be linked"

    fi
}

processDotDir() {
    local dot_directory="$1"

    # if the directory doesn't exist, let's create it
    if [[ ! -d "$dot_directory" ]] && [[ ! -a "$dot_directory" ]]; then
        mkdir -p "$dot_directory" && echo "created a $dot_directory directory"
        chmod 700 "$dot_directory"
    elif [[ ! -d "$dot_directory" ]] && [[ -a "$dot_directory" ]]; then
        echo "something in the way of $dot_directory being created"
    fi
}


echo "==> Updating git submodules"
git submodule init
git submodule update

# make sure the dotfiles are only rwx by the owner
chmod 700 $DIR

# make sure my home dir is secured
chmod 700 $HOME

echo "==> Linking dot files"
for DOTFILE in $DIR/.*; do
    # ignore certain directories
    if notExcluded "${DOTFILE##*/}"; then
        linkDotfile $DOTFILE "$HOME/${DOTFILE##*/}"
    fi
done

echo "==> Creating dot directories"
for DOTDIR in "${MKDIRS[@]}"; do
    processDotDir $DOTDIR
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

echo "==> Loading zshell configuration"
source ~/.zshrc


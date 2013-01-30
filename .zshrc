# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras vi-mode pip nyan)

UNAME=$(uname)

EDITOR=vim

# update the path before firing-up OMZ
# add local bin to the path if not already there
if [[ "$PATH" != *"$HOME/bin"* ]]; then
    PATH=$PATH:$HOME/bin
fi

if [[ "$UNAME" = "Linux" ]]; then
    PATH=$HOME/Development/adt-bundle-linux-x86_64/sdk/tools:$PATH
fi

source $ZSH/oh-my-zsh.sh

EDITOR=$(command -v vim)

# turn off special handling of ._* files in tar, etc.
COPYFILE_DISABLE=1

# use theme colors
LS_COLORS=''

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
setopt CORRECT

# for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# turn off annoying history verification, just run the damn command
setopt NO_HIST_VERIFY

# never ever beep ever. EVER
setopt NO_BEEP

# do not print error on non matched patterns
setopt NO_NO_MATCH


# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras vi-mode pip nyan)

source $ZSH/oh-my-zsh.sh

# turn off special handling of ._* files in tar, etc.
COPYFILE_DISABLE=1;

# add local bin to the path if not already there
if [[ "$PATH" != *"$HOME/bin"* ]]; then
    PATH=$PATH:$HOME/bin
fi

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


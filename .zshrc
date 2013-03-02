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

source $ZSH/oh-my-zsh.sh


# turn off special handling of ._* files in tar, etc.
COPYFILE_DISABLE=1

# Ensure vim is the default editor
EDITOR=vim

# use theme colors
LS_COLORS=''

UNAME=$(uname)

# Ensure terminal is has 256 colors enabled (for Ubuntu)
#TERM=xterm-256color

# update the path before firing-up OMZ
# add local bin to the path if not already there
if [[ "$PATH" != *"$HOME/bin"* ]]; then
  PATH=$PATH:$HOME/bin
fi

# Switch the terminal to 256 colors, but only if it's not in a tumux session
# (tmux uses screen-256colors which is set in its own configuration file)
if [[ -n "$DISPLAY" && "$TERM" == "xterm" ]]; then
  TERM=xterm-256color
fi

# Add android developer tools if available (unbuntu desktop)
if [[ -d "$HOME/Tools/adt" ]]; then
  ANDROID_HOME=$HOME/Tools/adt/sdk
  PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
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


# MacOS does not set these locale settings and they are needed for neomake to work properly
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE="en_US.UTF-8"

# update the path before firing-up OMZ
# add local bin to the path if not already there
if [[ "$PATH" != *"$HOME/.bin"* ]]; then
    export PATH=$PATH:$HOME/.bin
fi

# turn off special handling of ._* files in tar, etc.
export COPYFILE_DISABLE=1

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
setopt CORRECT

# for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
alias history='history 1'
WORDCHARS="${WORDCHARS:s#/#}"
WORDCHARS="${WORDCHARS:s#.#}"
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
bindkey '^R' history-incremental-search-backward

# turn off annoying history verification, just run the damn command
setopt NO_HIST_VERIFY

# never ever beep ever. EVER
setopt NO_BEEP

# do not print error on non matched patterns
setopt NO_NO_MATCH

# use theme colors
export LS_COLORS=''

# Switch the terminal to 256 colors, but only if it's not in a tumux session
# (tmux uses screen-256colors which is set in its own configuration file)
if [[ -n "$DISPLAY" && "$TERM" == "xterm" ]]; then
  export TERM=xterm-256color
fi

# Occansionally the terminal will end up in a bad state as a result
# from interrupting PDB or some other process.
# Symptoms include: new line not working; backspace stops working; etc
alias fix-terminal="stty sane"

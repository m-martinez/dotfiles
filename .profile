# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

################################################################################
# GENERAL
################################################################################

# Turn on terminal colors
export CLICOLOR=1

export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

export PS1='\[\e[0;32m\][\u@\h \W]\$\[\e[0m\] '

alias ssh="ssh -A"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

################################################################################
# OS-SPECIFIC
################################################################################

# OSX
if [`uname` = "Darwin"]; then
    # Disable .DS_Store for tar files
    export COPYFILE_DISABLE=true
   
    # ALTER PATH so that /usr/local/bin appears first for brew
    export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
fi


################################################################################
# APPLICATION-SPECIFIC
################################################################################

export PG_DATA_FILE="/usr/local/var/postgres"
export PG_LOG_FILE="/usr/local/var/postgres/server.log"
alias pgstart="pg_ctl -D $PG_DATA_FILE -l $PG_LOG_FILE  start"
alias pgstop="pg_ctl -D $PG_DATA_FILE stop -m fast"
alias pgstatus="pg_ctl status -D $PG_DATA_FILE"


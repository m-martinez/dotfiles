
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi


################################################################################
# GENERAL
################################################################################

# Turn on terminal colors
export CLICOLOR=1

export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

# Shell prompt
export PS1='\[\e[0;32m\][\u@\h \W]\$\[\e[0m\] '

# The omnipotent path
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/sbin:/usr/sbin:$HOME/bin:/usr/X11R6/bin

alias ssh="ssh -A"
alias ll="ls -l"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# don't use emacs for bash editing mode
set -o vi

################################################################################
# OS-SPECIFIC
################################################################################

if [[ $OSTYPE == darwin* ]]; then
    # Disable .DS_Store for tar files
    export COPYFILE_DISABLE=true
fi


################################################################################
# APPLICATION-SPECIFIC
################################################################################

export PG_DATA_FILE="/usr/local/var/postgres"
export PG_LOG_FILE="/usr/local/var/postgres/server.log"
alias pgstart="pg_ctl -D $PG_DATA_FILE -l $PG_LOG_FILE  start"
alias pgstop="pg_ctl -D $PG_DATA_FILE stop -m fast"
alias pgstatus="pg_ctl status -D $PG_DATA_FILE"


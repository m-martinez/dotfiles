################################################################################
# GENERAL
################################################################################

# Turn on terminal colors
export CLICOLOR=1

# Disable .DS_Store for tar files
export COPYFILE_DISABLE=true

alias ssh="ssh -A"

# ALTER PATH so that /usr/local/bin appears first for brew
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
export PATH="$PATH:~/Documents/AVRC/git/git-achievements"
alias git="git-achievements"

PS1='\[\e[0;32m\][\u@\h \W]\$\[\e[0m\] '

################################################################################
# POSTGRES
################################################################################

# The following commands assume you have pg select installed in macports
export PG_DATA_FILE="/usr/local/var/postgres"
export PG_LOG_FILE="/usr/local/var/postgres/server.log"
alias pgstart="pg_ctl -D $PG_DATA_FILE -l $PG_LOG_FILE  start"
alias pgstop="pg_ctl -D $PG_DATA_FILE stop -m fast"
alias pgstatus="pg_ctl status -D $PG_DATA_FILE"


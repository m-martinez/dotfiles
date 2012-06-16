###############################################################################
# BASH Shell Master Configurations
###############################################################################

# import system configurations first
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# common configurations accross shells
source ~/.commonrc

# prompt
export PS1='\[\e[0;32m\][\u@\h \W]\$\[\e[0m\] '

# use vi mode
set -o vi


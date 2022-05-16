#
# Update SSH environment variables
#
# Tmux inherits environment settings when reattaching, but doesn't update
# existing panel's environments. So we must do this ourselves with this function
#
# See: https://stackoverflow.com/a/34683596
#
function fixssh() {
    eval $(tmux show-env -s |grep '^SSH_')
}


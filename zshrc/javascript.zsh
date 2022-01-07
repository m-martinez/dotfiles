# NPM - always prefer local modules (only alias if npm is actually installed)
if command -v npm &> /dev/null; then
    export PATH="node_modules/.bin:$PATH"
    export NODE_PATH="/usr/lib/node_modules"
fi

# Allow easy switching of Javascript versions
if command -v volta &> /dev/null; then
    export VOLTA_HOME=$HOME/.volta
    export PATH="$VOLTA_HOME/bin:$PATH"
fi


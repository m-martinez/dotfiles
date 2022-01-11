# PHP Composer
if command -v composer &> /dev/null; then
    # include php composer binaries
    export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

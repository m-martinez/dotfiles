# Homebrew
export PATH="/usr/local/sbin:$PATH"
if command -v brew &> /dev/null; then
    alias ctags="`brew --prefix`/bin/ctags"
    #
    # Alias Homebrew becuase pyenv create additinal *-config files that confuse brew
    # https://github.com/pyenv/pyenv/issues/106
    alias brew='env PATH=${PATH//$(pyenv root)\/shims:/} brew'
fi


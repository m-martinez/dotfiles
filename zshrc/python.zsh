# Allow easy switching of Python versions
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"

    # Alias Homebrew becuase pyenv create additinal *-config files that confuse brew
    # https://github.com/pyenv/pyenv/issues/106
    if command -v brew &> /dev/null; then
        alias brew='env PATH=${PATH//$(pyenv root)\/shims:/} brew'
    fi
fi

# Ensure poetry can be found in linux
# https://python-poetry.org/docs/#installing-with-the-official-installer
export PATH="$HOME/.local/bin:$PATH"

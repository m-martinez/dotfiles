# Neovim
if command -v nvim &> /dev/null; then
    alias vim="nvim"
    alias vi="nvim"

    # Ensure vim is the default editor
    export EDITOR=nvim
    export VISUAL=nvim
fi

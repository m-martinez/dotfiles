#git submodule init
#git submodule update

# Get the directory location of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Link only dot files
for DOTFILE in $DIR/.*; do
    # Not allowed for linking: "./", "../", ".git/"
    echo "----"
    echo "${DOTFILE:(-1)}"
    echo "${DOTFILE:(-3)}"
    if [[ "${DOTFILE:(-1)}" != "." ]]; then
        continue
    elif [[ "${DOTFILE:(-1)}" != "." ]]; then
        continue
    else
        echo "${DOTFILE:(-1)}"
    fi
done


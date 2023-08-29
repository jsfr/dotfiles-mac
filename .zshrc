# source profile
if [ -f "${HOME}/.profile" ]; then
    source "${HOME}/.profile"
fi

export PATH="$PATH:$HOME/.local/bin"

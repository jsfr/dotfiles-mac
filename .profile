if [[ -n $ENV_EXPORTED ]]; then
    # Environment is already exported
    exit 0
fi

export PAGER="less"
export FZF_DEFAULT_COMMAND="fd -It f"
export EDITOR="nvim"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export LANG="en_US.UTF-8"
export LC_CTYPE="$LANG"
export LC_NUMERIC="$LANG"
export LC_TIME="$LANG"
export LC_COLLATE="$LANG"
export LC_MONETARY="$LANG"
export LC_MESSAGES="$LANG"
export LC_PAPER="$LANG"
export LC_NAME="$LANG"
export LC_ADDRESS="$LANG"
export LC_TELEPHONE="$LANG"
export LC_MEASUREMENT="$LANG"
export LC_IDENTIFICATION="$LANG"
export LC_ALL="$LANG"

export HOMEBREW_GITHUB_API_TOKEN_PATH="$HOME/.homebrew_github_token"
if [[ -f $HOMEBREW_GITHUB_API_TOKEN_PATH ]]; then
    export HOMEBREW_GITHUB_API_TOKEN=$(cat $HOMEBREW_GITHUB_API_TOKEN_PATH)
fi

export XDG_CONFIG_HOME="$HOME/.config"
export GOPATH="$HOME/go"
export N_PREFIX="$HOME/.n"
export JAVA_HOME="$(/usr/libexec/java_home -v 17)"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export ANDROID_HOME="$HOME/Library/Android/sdk"

export PATH="\
    :$PATH\
    :$GOPATH/bin\
    :$HOME/.cargo/bin\
    :$HOME/.local/bin\
    :$HOME/Repos/github.com/pleo-io/pleo/bin\
    :$N_PREFIX/bin"

export ENV_EXPORTED="exported"

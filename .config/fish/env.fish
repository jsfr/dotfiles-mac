if test -n "$ENV_EXPORTED"
    # Environment is already exported
    exit 0
end

set -x PAGER less
set -x FZF_DEFAULT_COMMAND "fd -It f"
set -x EDITOR "nvim"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -x LANG "en_US.UTF-8"
set -x LC_CTYPE $LANG
set -x LC_NUMERIC $LANG
set -x LC_TIME $LANG
set -x LC_COLLATE $LANG
set -x LC_MONETARY $LANG
set -x LC_MESSAGES $LANG
set -x LC_PAPER $LANG
set -x LC_NAME $LANG
set -x LC_ADDRESS $LANG
set -x LC_TELEPHONE $LANG
set -x LC_MEASUREMENT $LANG
set -x LC_IDENTIFICATION $LANG
set -x LC_ALL $LANG

set -x XDG_CONFIG_HOME "$HOME/.config"
set -x GOPATH "$HOME/go"
set -x JAVA_HOME (/usr/libexec/java_home -v 11)

set -x HOMEBREW_GITHUB_API_TOKEN_PATH "$HOME/.homebrew_github_token"
if test -e $HOMEBREW_GITHUB_API_TOKEN_PATH
    set -x HOMEBREW_GITHUB_API_TOKEN (cat $HOMEBREW_GITHUB_API_TOKEN_PATH)
end

set -x NPM_TOKEN_PATH "$HOME/.npm_token"
if test -e $NPM_TOKEN_PATH
    set -x NPM_TOKEN (cat $NPM_TOKEN_PATH)
end

set -x RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"
set -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -x N_PREFIX "$HOME/.n"

set -x PATH $PATH \
            "$GOPATH/bin" \
            "$HOME/.cargo/bin" \
            "$HOME/.local/bin" \
            "$HOME/Repos/github.com/pleo-io/pleo/bin" \
            "/usr/local/sbin" \
            "$N_PREFIX/bin"

set -x ENV_EXPORTED "exported"

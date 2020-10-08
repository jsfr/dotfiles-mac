set -x PAGER less
set -x FZF_DEFAULT_COMMAND "fd -It f"
set -x EDITOR "nvim"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

set -x LANG "en_US.UTF-8"
set -x LC_CTYPE "en_US.UTF-8"
set -x LC_NUMERIC "en_US.UTF-8"
set -x LC_TIME "en_US.UTF-8"
set -x LC_COLLATE "en_US.UTF-8"
set -x LC_MONETARY "en_US.UTF-8"
set -x LC_MESSAGES "en_US.UTF-8"
set -x LC_PAPER "en_US.UTF-8"
set -x LC_NAME "en_US.UTF-8"
set -x LC_ADDRESS "en_US.UTF-8"
set -x LC_TELEPHONE "en_US.UTF-8"
set -x LC_MEASUREMENT "en_US.UTF-8"
set -x LC_IDENTIFICATION "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

set -x XDG_CONFIG_HOME "$HOME/.config"
set -x GOPATH "$HOME/go"
set -x JAVA_HOME (/usr/libexec/java_home -v 11)

# set -x LDFLAGS "-L/usr/local/opt/node@12/lib"
# set -x CPPFLAGS "-I/usr/local/opt/node@12/include"

if test -e "$HOME/.homebrew_github_token"
    set -x HOMEBREW_GITHUB_API_TOKEN (cat "$HOME/.homebrew_github_token")
end

if test -e "$HOME/.npm_token"
    set -x NPM_TOKEN (cat "$HOME/.npm_token")
end


if test -z "$PATH_EXPORTED"
    set -x PATH $PATH \
                "$GOPATH/bin" \
                "$HOME/.cargo/bin" \
                "$HOME/.local/bin" \
                "$HOME/Repos/pleo/pleo/bin" \
                "/usr/local/opt/node@12/bin" \
                "/usr/local/sbin"
    set -x PATH_EXPORTED "exported"
end

set -x RUST_SRC_PATH (rustc --print sysroot)"/lib/rustlib/src/rust/src"

set -x ANDROID_HOME "$HOME/Library/Android/sdk"

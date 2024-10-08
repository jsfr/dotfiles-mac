#!/usr/bin/env bash

if [[ -z $ENV_EXPORTED ]]; then
    export PAGER="moar"
    export FZF_DEFAULT_COMMAND="fd -It f"
    export EDITOR="nvim"

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

    # XDG
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_STATE_HOME="$HOME/.local/state"

    export HOMEBREW_GITHUB_API_TOKEN_PATH="$HOME/.homebrew_github_token"
    if [[ -f $HOMEBREW_GITHUB_API_TOKEN_PATH ]]; then
        export HOMEBREW_GITHUB_API_TOKEN=$(cat "$HOMEBREW_GITHUB_API_TOKEN_PATH")
    fi

    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"

    export GIT_STATUS_LOGLEVEL=DEBUG

    export CARGO_BIN_PATH="$HOME/.cargo/bin"
    export PNPM_HOME="$HOME/Library/pnpm"
    export PNPM_BIN_PATH="$PNPM_HOME"
    export POSTGRES_BIN_PATH="/opt/homebrew/opt/postgresql@15/bin"
    export RANCHER_BIN_PATH="$HOME/.rd/bin"
    export LOCAL_BIN_PATH="$HOME/.local/bin"
    export BREW_BIN_PATH="/opt/homebrew/bin"
    export BREW_SBIN_PATH="/opt/homebrew/sbin"
    export PATH="$RANCHER_BIN_PATH:$BREW_BIN_PATH:$BREW_SBIN_PATH:$LOCAL_BIN_PATH:$GOBIN:$CARGO_BIN_PATH:$PNPM_BIN_PATH:$POSTGRES_BIN_PATH:$PATH"

    export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

    export BKT_CACHE_DIR="$HOME/.cache"

    export DOFI_DIR="$HOME/repos/github.com/jsfr/dotfiles"

    export FIREFOX_PROFILE="$HOME/Library/Application Support/Firefox/Profiles/rbq3oxda.dev-edition-default"

    export NUGET_CREDENTIALPROVIDER_MSAL_ENABLED=true
    export NUGET_CREDENTIALPROVIDER_FORCE_CANSHOWDIALOG_TO=true
    export DYLD_FALLBACK_LIBRARY_PATH=/opt/homebrew/lib

    export ENV_EXPORTED="exported"
fi

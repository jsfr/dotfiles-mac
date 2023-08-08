# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source profile
if [ -f "${HOME}/.profile" ]; then
    source "${HOME}/.profile"
fi

# Antidote setup
ANTIDOTE_DIR="${ZDOTDIR:-$HOME}/.antidote"
if ! [ -f "${ANTIDOTE_DIR}/antidote.zsh" ]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ANTIDOTE_DIR}
fi

# source antidote
source "${ANTIDOTE_DIR}/antidote.zsh"

# set plugin configuration
zstyle ':antidote:bundle' file "${ZDOTDIR:-$HOME}/.zplugins"
zstyle ':antidote:static' file "${ZDOTDIR:-$HOME}/.zplugins.zsh"
zstyle ':antidote:bundle' use-friendly-names 'yes'
zstyle ':antidote:plugin:*' defer-options '-p'

# initialize plugins statically with ${ZDOTDIR:-~}/.zplugins
antidote load

# initialize atuin
_evalcache atuin init zsh

# initialize zoxide, must come _after_ compinit
_evalcache zoxide init zsh

# add wezterm zsh completions
_evalcache wezterm shell-completion --shell zsh

# initialize asdf
source "$(brew --prefix asdf)/libexec/asdf.sh"

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

# automatically set git environment for dotfiles
# remember to disable POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN in .p10k.zsh
# and to set the worktree of ~/.dotfiles to $HOME by using: git config --local core.worktree $HOME
_check_dotfiles_gitdir () {
    emulate -L zsh

    local dotfiles_gitdir="${HOME}/.dotfiles"

    if [ "${PWD}" = "${HOME}" ]; then
        export GIT_DIR="${dotfiles_gitdir}"
    else if [ "${GIT_DIR}" = "${dotfiles_gitdir}" ]
        unset GIT_DIR
    fi
}
autoload -U add-zsh-hook
add-zsh-hook chpwd _check_dotfiles_gitdir
_check_dotfiles_gitdir

# autocomplete
zstyle ':autocomplete:*' recent-dirs zoxide
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

# set options
setopt autocd

# aliases
alias cask="brew install --cask"
alias zap="brew uninstall --force --zap"
alias pr="gh pr"
alias aum="gh pr edit --add-label \"automerge\""
alias k="kubectl"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

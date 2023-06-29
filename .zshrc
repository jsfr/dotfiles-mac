# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Antidote setup
ANTIDOTE_DIR=${ZDOTDIR:-~}/.antidote

if ! [ -f ${ANTIDOTE_DIR}/antidote.zsh ]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ANTIDOTE_DIR}
fi

# source antidote
source ${ANTIDOTE_DIR}/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# source profile
if [ -f ~/.profile ]; then
    source ~/.profile
fi

# initialize zoxide, must come _after_ compinit
eval "$(zoxide init zsh)"

# automatically set git environment for dotfiles 
_check_dotfiles_gitdir () {
    emulate -L zsh

    local dotfiles_gitdir="${HOME}/.dotfiles"

    if [ "${PWD}" = "${HOME}" ]; then
        export GIT_DIR="${dotfiles_gitdir}"
        export GIT_WORK_TREE="${HOME}"
    else
        [ "$GIT_DIR" = "$dotfiles_gitdir" ] && unset GIT_DIR
        [ "$GIT_WORK_TREE" = "$HOME" ] && unset GIT_WORK_TREE
    fi
}

autoload -U add-zsh-hook
add-zsh-hook chpwd _check_dotfiles_gitdir
_check_dotfiles_gitdir

# completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

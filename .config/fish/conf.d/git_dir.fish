status is-interactive || exit

function _check_dotfiles_gitdir --on-variable PWD
    set -f dotfiles_gitdir "$HOME/.dotfiles"
    if test "$PWD" = "$HOME"
        set -gx GIT_DIR "$dotfiles_gitdir"
    else
        if test "$GIT_DIR" = "$dotfiles_gitdir"
            set -e GIT_DIR
        end
    end
end

# Automatically set GIT_DIR when in the home directory
_check_dotfiles_gitdir

function _check_dotfiles_gitdir --on-variable PWD --description 'Update GIT_DIR and GIT_WORK_TREE'
    set -l dotfiles_gitdir "$HOME/.dotfiles"
    if [ "$PWD" = "$HOME" ]
        set -gx GIT_DIR "$dotfiles_gitdir"
        set -gx GIT_WORK_TREE "$HOME"
    else
        [ "$GIT_DIR" = "$dotfiles_gitdir" ] && set -e GIT_DIR
        [ "$GIT_WORK_TREE" = "$HOME" ] && set -e GIT_WORK_TREE
    end
end

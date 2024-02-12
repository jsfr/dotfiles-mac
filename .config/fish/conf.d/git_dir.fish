status is-interactive || exit

function rtrav
    if test -e $argv[2]/$argv[1]
        return 0
    else
        if test $argv[2] != /
            rtrav $argv[1] $(dirname $argv[2])
        else
            return 1
        end
    end
end

function _check_dotfiles_gitdir --on-variable PWD
    set -f dotfiles_gitdir $HOME/.dotfiles
    if string match -q "$HOME*" "$PWD"; and not rtrav .git $PWD
        set -gx GIT_DIR "$dotfiles_gitdir"
    else
        if test "$GIT_DIR" = "$dotfiles_gitdir"
            set -e GIT_DIR
        end
    end
end

# Automatically set GIT_DIR when in the home directory
# _check_dotfiles_gitdir

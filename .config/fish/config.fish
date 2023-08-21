# install fundle if not present
if not functions -q fundle
    eval (curl -sfL https://git.io/fundle-install)
end

# prompt
fundle plugin 'IlanCosman/tide@v5'

# tools
fundle plugin 'jorgebucaran/autopair.fish'
fundle plugin 'markcial/upto'
fundle plugin 'zzhaolei/transient.fish'

# completions
# fundle plugin 'oh-my-fish/plugin-aws'
# fundle plugin 'evanlucas/fish-kubectl-completions'

# initialize fundle
fundle init

# set $SHELL
set -gx SHELL (which fish)

# define aliases
alias ls="ls -1FvG"

# define abbreviations
abbr k "kubectl"
abbr pr "gh pr"
abbr zap "brew uninstall --force --zap"
abbr aum 'gh pr edit --add-label "automerge"'
abbr tf "terraform"
abbr u "upto"

# define custom keybindings
function fish_user_key_bindings
    bind \ej history-search-forward
    bind \ek history-search-backward
    bind \el forward-char
    bind \eh backward-char
    bind \ew forward-word
    bind \eb backward-word
end

# enable rtx / asdf
# source /opt/homebrew/opt/asdf/libexec/asdf.fish
bkt --ttl "7days" -- rtx activate fish | source

# enable direnv
bkt --ttl "7days" -- direnv hook fish | source

# enable zoxide
bkt --ttl "7days" -- zoxide init fish | source

# enable atuin
bkt --ttl "7days" -- atuin init fish | source

# completions
bkt --ttl "7days" -- just --completions fish | source 
bkt --ttl "7days" -- wezterm shell-completion --shell fish | source

# Pleo oo script
source $HOME/Repos/github.com/pleo-io/pleo/bin/oo.fish

# source .profile
_babelfish "$HOME/.profile" | source

# Hook for desk activation
if test -n $DESK_ENV
    source $DESK_ENV
end


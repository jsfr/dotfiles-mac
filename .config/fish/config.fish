# install fundle if not present
if not functions -q fisher

end

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
abbr gw "./gradlew"

# define custom keybindings
function fish_user_key_bindings
    bind \ej history-search-forward
    bind \ek history-search-backward
    bind \el forward-char
    bind \eh backward-char
    bind \ew forward-word
    bind \eb backward-word
end

# enable mise
bkt --ttl "7days" -- mise activate fish | source

# enable direnv
bkt --ttl "7days" -- direnv hook fish | source

# enable zoxide
bkt --ttl "7days" -- zoxide init fish | source

# enable atuin
bkt --ttl "7days" -- atuin init fish | source

# completions
bkt --ttl "7days" -- just --completions fish | source 
bkt --ttl "7days" -- wezterm shell-completion --shell fish | source

# enable pleo oo script
source $HOME/Repos/github.com/pleo-io/pleo/bin/oo.fish

# source .profile
_babelfish "$HOME/.profile" | source

# Hook for desk activation
if test -n $DESK_ENV
    source $DESK_ENV
end

export PATH="$PATH:$HOME/.local/bin"

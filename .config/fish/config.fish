# source .profile
_babelfish "$HOME/.profile" | source

# set $SHELL
set -gx SHELL (which fish)

# define aliases
alias ls="eza -1 -F"

# define abbreviations
abbr k "kubectl"
abbr pr "gh pr"
abbr zap "brew uninstall --force --zap"
abbr aum 'gh pr edit --add-label "automerge"'
abbr tf "terraform"
abbr u "upto"
abbr gw "./gradlew"
abbr cdg "cd (git root)"

# define custom keybindings
function fish_user_key_bindings
    bind \ej history-search-forward
    bind \ek history-search-backward
    bind \el forward-char
    bind \eh backward-char
    bind \ew forward-word
    bind \eb backward-word
end

function starship_transient_prompt_func
  starship module character
end
# enable starship
bkt --ttl "7days" -- starship init fish | source
enable_transience

# enable mise
bkt --ttl "7days" -- mise activate fish | source

# enable direnv
bkt --ttl "7days" -- direnv hook fish | source

# enable zoxide
bkt --ttl "7days" -- zoxide init fish --cmd cd | source

# enable atuin
bkt --ttl "7days" -- atuin init fish | source

# completions
bkt --ttl "7days" -- just --completions fish | source 
bkt --ttl "7days" -- wezterm shell-completion --shell fish | source
bkt --ttl "7days" -- dofi completions fish | source

# enable pleo oo script
source $HOME/Repos/github.com/pleo-io/pleo/bin/oo.fish

# Hook for desk activation
if test -n $DESK_ENV
    source $DESK_ENV
end

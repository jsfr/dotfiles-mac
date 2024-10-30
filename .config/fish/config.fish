# source .profile
if type -q _babelfish
    _babelfish "$HOME/.profile" | source
end

# set $SHELL
set -gx SHELL (which fish)

# define aliases
alias ls="eza -1 -F"

# define abbreviations
abbr k "kubectl"
abbr pr "gh pr create"
abbr zap "brew uninstall --force --zap"
abbr cask "brew install --cask"
abbr aum 'gh pr edit --add-label "automerge"'
abbr tf "terraform"
abbr u "upto"
abbr gw "./gradlew"
abbr cdg "cd (git root)"
abbr g "git"
abbr lg "lazygit"
abbr p "pnpm"
abbr x "pnpx"
abbr n "nvim"
abbr cm "chezmoi"
abbr yi "win32yank.exe -i"
abbr yo "win32yank.exe -o"

# define custom keybindings
function fish_user_key_bindings
    bind \ej history-search-forward
    bind \ek history-search-backward
    bind \el forward-char
    bind \eh backward-char
    bind \ew forward-word
    bind \eb backward-word
end

# enable starship
if command -q starship
    function starship_transient_prompt_func
        starship module character
    end
    bkt --ttl "7days" -- starship init fish | source
    enable_transience
end

# enable mise
if command -q mise
    bkt --ttl "7days" -- mise activate fish | source
end

# enable zoxide
if command -q zoxide
    bkt --ttl "7days" -- zoxide init fish --cmd cd | source
end

# enable atuin
if command -q atuin
    bkt --ttl "7days" -- atuin init fish | source
end

# completions
if command -q just
    bkt --ttl "7days" -- just --completions fish | source 
end
if command -q wezterm
    bkt --ttl "7days" -- wezterm shell-completion --shell fish | source
end
if command -q dofi
    bkt --ttl "7days" -- dofi completions fish | source
end
if command -q gs
    bkt --ttl "7days" -- gs shell completion fish | source
end

# install fundle if not present
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# add plugins
fundle plugin 'jorgebucaran/fisher'
fundle plugin 'evanlucas/fish-kubectl-completions'
fundle plugin 'jorgebucaran/autopair.fish'
fundle plugin 'EHfive/fish-bash2env'
fundle plugin 'nickeb96/puffer-fish'
fundle plugin 'oh-my-fish/plugin-aws'
fundle plugin 'meaningful-ooo/sponge'
fundle plugin 'IlanCosman/tide@v5'

# initialize fundle
fundle init

# remove welcome message
set fish_greeting ""

# define aliases
alias ls="ls -1FvG"
alias cfg="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# define abbreviations
function abbreviations
  abbr k "kubectl"
  abbr pr "gh pr"
  abbr zap "brew uninstall --force --zap"
  abbr aum "gh pr edit --add-label \"automerge\""
  abbr p "pnpm"
  abbr px "pnpx"
  abbr tf "terraform"
end
abbreviations

# define custom keybindings
function fish_user_key_bindings
  bind \ej history-search-forward
  bind \ek history-search-backward
  bind \el forward-char
  bind \eh backward-char
  bind \ew forward-word
  bind \eb backward-word
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# Source docker completions
set docker_completions "/Applications/Docker.app/Contents/Resources/etc/docker.fish-completion"
if type -q $docker_completions
  source $docker_completions
end

# Add direnv hooks
if type -q direnv
  direnv hook fish | source
end

# Enable zoxide
if type -q zoxide
  zoxide init fish | source
end

# Enable mcfly
if type -q mcfly
  mcfly init fish | source
end

# Enable asdf
set asdf_exec "/opt/homebrew/opt/asdf/libexec/asdf.fish"
if type -q $asdf_exec
  source $asdf_exec
end

# Add just completions
if type -q just
  just --completions fish | source 
end

# Source environment variables
bash2env source "$HOME/.profile"

# Hook for desk activation
test -n "$DESK_ENV"; and . "$DESK_ENV"; or true

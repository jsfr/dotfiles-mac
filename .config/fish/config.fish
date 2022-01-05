# install fisherman if not present
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
  curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
  fish -c fisher
end

# remove welcome message
set fish_greeting ""

# define aliases
alias ls="ls -1FvG"
alias cfg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# define abbreviations
function abbreviations
  abbr k "kubectl"
  abbr pr "gh pr"
  abbr zap "brew uninstall --force --zap"
end
abbreviations

# Typing !! will fill in the last used command
function bind_bang
  switch (commandline -t)
    case "!"
      commandline -t $history[1]; commandline -f repaint
    case "*"
      commandline -i !
  end
end

# Automatically add slashes as needed when putting multiple dots in a row.
# This allows to easily go back multiple directories.
function bind_dot
  if string match -qr "^(\.\./)*\.\.\$" (commandline -b)
    commandline -i /
  end
  commandline -i .
end

# define custom keybindings
function fish_user_key_bindings
  bind \ej history-search-forward
  bind \ek history-search-backward
  bind \el forward-char
  bind \eh backward-char
  bind \ew forward-word
  bind \eb backward-word
  bind ! bind_bang
  bind . bind_dot
end

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

# Hook for desk activation
if type -q desk && test -n "$DESK_ENV"
  source "$DESK_ENV"
end

# Add just completions
if type -q just
  set just_completions "$HOME/.just_completions.fish"
  if ! type -q $just_completions
    just --completions fish > $just_completions
  end
  source $just_completions
end

# Source environment
source "$HOME/.config/fish/env.fish"

# Initialize prompt
starship init fish | source

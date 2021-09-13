# install fisherman if not present
if not functions -q fisher
  set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
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

# Add direnv hooks
if type -q direnv
  # eval (direnv hook fish)
  function __direnv_export_eval_preexec --on-event fish_preexec;
          "/usr/local/bin/direnv" export fish | source;
  end
  function __direnv_export_eval_prompt  --on-event fish_prompt;
          "/usr/local/bin/direnv" export fish | source;
  end
end

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

# Enable zoxide
zoxide init fish | source

# Source environment
fenv source ~/.profile

# Hook for desk activation
if type -q desk
  test -n "$DESK_ENV"; and source "$DESK_ENV"; or true
end

if type -q just
  just --completions fish > ~/.just_completions.fish
  source ~/.just_completions.fish
end

starship init fish | source

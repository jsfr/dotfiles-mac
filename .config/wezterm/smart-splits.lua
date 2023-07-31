local w = require("wezterm")

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == "true"
end

-- if you *ARE* lazy-loading smart-splits.nvim (not recommended)
-- you have to use this instead, but note that this will not work
-- in all cases (e.g. over an SSH connection). Also note that
-- `pane:get_foreground_process_name()` can have high and highly variable
-- latency, so the other implementation of `is_vim()` will be more
-- performant as well.
local function is_vim(pane)
  -- This gsub is equivalent to POSIX basename(3)
  -- Given "/foo/bar" returns "bar"
  -- Given "c:\\foo\\bar" returns "bar"
  local process_name = string.gsub(pane:get_foreground_process_name(), "(.*[/\\])(.*)", "%2")
  return process_name == "nvim" or process_name == "vim"
end

local direction_keys = {
  Left = "h",
  Down = "j",
  Up = "k",
  Right = "l",
  -- reverse lookup
  h = "Left",
  j = "Down",
  k = "Up",
  l = "Right",
}

local function move(key)
  local mods = "CTRL"
  return {
    key = key,
    mods = mods,
    action = w.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action(w.action.SendKey({ key = key, mods = mods }), pane)
      else
        win:perform_action(w.action.ActivatePaneDirection(direction_keys[key]), pane)
      end
    end),
  }
end

local function resize(key)
  local mods = "CTRL|SHIFT"
  return {
    key = key,
    mods = mods,
    action = w.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action(w.action.SendKey({ key = key, mods = mods }), pane)
      else
        win:perform_action(w.action.AdjustPaneSize({ direction_keys[key], 3 }), pane)
      end
    end),
  }
end

return {
  keys = {
    -- move between split panes
    move("h"),
    move("j"),
    move("k"),
    move("l"),
    -- resize panes
    resize("h"),
    resize("j"),
    resize("k"),
    resize("l"),
  },
}

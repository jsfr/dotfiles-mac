local wezterm = require("wezterm")
local config = {}

local font = wezterm.font("JetBrainsMono Nerd Font")
local font_size = 13.0

-- Spawn a fish shell in login mode
config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

-- Window
config.window_decorations = "RESIZE"

-- Tab bar
config.use_fancy_tab_bar = false
-- config.tab_bar_at_bottom = true
config.window_frame = {
  font = font,
  font_size = font_size,
}

-- Font
config.font = font
config.font_size = font_size

-- Theme
config.color_scheme = "tokyonight_storm"

-- Hotfix for https://github.com/wez/wezterm/issues/3774
config.freetype_load_target = "Light"
-- config.freetype_render_target = "HorizontalLcd"
config.cell_width = 0.9

-- Scrollback
config.scrollback_lines = 10000

-- Keybindings
config.keys = {
  {
    key = "k",
    mods = "SUPER",
    action = wezterm.action.ActivateCommandPalette
  },
  {
    key = "o",
    mods = "CTRL",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
  {
    key = "/",
    mods = "SUPER|SHIFT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "/",
    mods = "CTRL",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "-",
    mods = "SUPER|SHIFT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "-",
    mods = "CTRL",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
}

local function append_table(src_tbl, dst_tbl)
  table.move(src_tbl, 1, #src_tbl, #dst_tbl + 1, dst_tbl)
  return dst_tbl
end

-- smart-splits.nvim setup
local ss = require("smart-splits")
append_table(ss.keys, config.keys)

return config

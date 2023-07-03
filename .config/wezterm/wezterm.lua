local wezterm = require("wezterm")
local config = {}

-- Window
config.window_decorations = "RESIZE"

-- Tab bar
config.use_fancy_tab_bar = false
-- config.tab_bar_at_bottom = true
config.window_frame = {
  font = wezterm.font("JetBrainsMono Nerd Font"),
  font_size = 13.0,
}

-- Font
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13.0

-- Theme
config.color_scheme = "tokyonight_storm"

-- Hotfix for https://github.com/wez/wezterm/issues/3774
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"
config.cell_width = 0.9

-- Scrollback
config.scrollback_lines = 10000

-- Keybindings
local smart_splits = require("smart-splits")
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
  table.unpack(smart_splits.keys)
}

return config

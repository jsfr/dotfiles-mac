local wezterm = require 'wezterm';

return {
  font = wezterm.font("JetBrains Mono"),
  font_size = 13.0,
  line_height = 1.2,
  window_decorations = "RESIZE",
  window_padding = {
    left = 7,
    right = 7,
    top = 7,
    bottom = 7
  },
  color_scheme = "Seoul256",
  colors = {
    tab_bar = {

      -- The color of the strip that goes along the top of the window
      background = "#0b0022",

      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        bg_color = "#2b2042",
        -- The color of the text for the tab
        fg_color = "#c0c0c0",

        -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
        -- label shown for this tab.
        -- The default is "Normal"
        intensity = "Normal",

        -- Specify whether you want "None", "Single" or "Double" underline for
        -- label shown for this tab.
        -- The default is "None"
        underline = "None",

        -- Specify whether you want the text to be italic (true) or not (false)
        -- for this tab.  The default is false.
        italic = false,

        -- Specify whether you want the text to be rendered with strikethrough (true)
        -- or not for this tab.  The default is false.
        strikethrough = false,
      },

      -- Inactive tabs are the tabs that do not have focus
      inactive_tab = {
        bg_color = "#1b1032",
        fg_color = "#808080",

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over inactive tabs
      inactive_tab_hover = {
        bg_color = "#3b3052",
        fg_color = "#909090",
        italic = true,

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab_hover`.
      }
    }
  }
  color_schemes = {
    ["Seoul256"] = {
      foreground = "#d0d0d0",
      background = "#3a3a3a",

      -- cursor_bg = "#52ad70",
      -- cursor_fg = "black",
      -- cursor_border = "#52ad70",

      -- -- the foreground color of selected text
      -- selection_fg = "black",
      -- -- the background color of selected text
      -- selection_bg = "#fffacd",

      -- The color of the scrollbar "thumb"; the portion that represents the current viewport
      -- scrollbar_thumb = "#222222",

      -- The color of the split lines between panes
      -- split = "#444444",

      ansi = {
        "#4e4e4e",
        "#d68787",
        "#5f865f",
        "#d8af5f",
        "#85add4",
        "#d7afaf",
        "#87afaf",
        "#d0d0d0"
      },
      brights = {
        "#626262",
        "#d75f87",
        "#87af87",
        "#ffd787",
        "#add4fb",
        "#ffafaf",
        "#87d7d7",
        "#e4e4e4"
      },
    }
  }
}

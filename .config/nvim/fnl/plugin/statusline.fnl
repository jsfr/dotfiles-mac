(local lualine (require :lualine))

(local lint (require :lint))
(fn lint-progress []
  (local linters (lint.get_running))
  (if (= (length linters) 0) "󰦕" (.. "󱉶 " (table.concat linters ", "))))

(lualine.setup {:options {:theme :tokyonight}
                :sections {:lualine_b [:branch :diff :diagnostics lint-progress]}})

{}

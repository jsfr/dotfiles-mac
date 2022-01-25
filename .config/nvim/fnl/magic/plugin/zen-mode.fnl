(module magic.plugin.zen-mode
  {autoload {zen-mode zen-mode
             twilight twilight}})

(twilight.setup)
(zen-mode.setup {:on_open (fn [] (do
                                   (set vim.wo.wrap true)
                                   (set vim.wo.linebreak true)))})

(module magic.plugin.treesitter
  {autoload {ts nvim-treesitter.configs}})

(ts.setup {:ensure_installed :maintained
           :highlight {:enable true}})

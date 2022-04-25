(module magic.plugin.treesitter
  {autoload {configs nvim-treesitter.configs}})

(configs.setup {:ensure_installed :all
                :ignore_install [:phpdoc]
                :highlight {:enable true}
                :indent {:enable true}})

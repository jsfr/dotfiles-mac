(local configs (require :nvim-treesitter.configs))
(local just (require :tree-sitter-just))

(configs.setup {:ensure_installed :all
                :ignore_install [:phpdoc
                                 :smali
                                 :t32]
                :highlight {:enable true}
                :indent {:enable true}})

(just.setup {})

{}

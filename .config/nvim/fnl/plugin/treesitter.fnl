(local configs (require :nvim-treesitter.configs))

(configs.setup {:ensure_installed :all
                :ignore_install [:phpdoc :smali :t32]
                :highlight {:enable true}
                :indent {:enable true}
                :autotag {:enable true}})

{}

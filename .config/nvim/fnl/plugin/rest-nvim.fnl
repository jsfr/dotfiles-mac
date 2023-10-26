(import-macros {: map!} :hibiscus.vim)

(local rest-nvim (require :rest-nvim))

(rest-nvim.setup {})

(map! [n] ",r" :<Plug>RestNvim<cr>)

{}

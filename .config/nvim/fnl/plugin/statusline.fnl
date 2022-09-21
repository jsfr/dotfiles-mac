(import-macros {: g!} :hibiscus.vim)

(g! lightline {:active {:left [[:mode :paste]
                               [:readonly :relativepath :modified]]
                        :right [[:lineinfo]
                                [:lsp_info :lsp_hints :lsp_errors :lsp_warnings :lsp_ok]
                                [:lsp_status]
                                [:filetype]]}})

(vim.cmd "call lightline#lsp#register()")

{}

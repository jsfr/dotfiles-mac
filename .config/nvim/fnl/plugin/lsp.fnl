(local lspconfig (require :lspconfig))
(local lsp-setup (require :lsp-setup))
(local {: builtins : generator &as null-ls} (require :null-ls))
(local {: diagnostics &as helpers} (require :null-ls.helpers))

(local typos (let [on-output (diagnostics.from_pattern ":(%d+):(%d+): (.*)" [:row :col :message])
                   args {:command :typos
                         :args ["--format" "brief" "-"]
                         :to_stdin true
                         :from_stderr true
                         :format :line
                         :on_output on-output}
                   generator (null-ls.generator args)]
               {:name :typos
                :method null-ls.methods.DIAGNOSTICS
                :filetypes {}
                :generator generator}))


(null-ls.setup {:debug false
                :sources [;; Diagnostics
                          builtins.diagnostics.eslint
                          builtins.diagnostics.hadolint
                          builtins.diagnostics.fish
                          builtins.diagnostics.actionlint
                          typos

                          ;; Formatters
                          builtins.formatting.zigfmt
                          builtins.formatting.prettier
                          builtins.formatting.fixjson]})

(lsp-setup.setup {:default_mappings false
                  :mappings {:gD "lua vim.lsp.buf.declaration()"
                             :gd "lua vim.lsp.buf.definition()"
                             :gt "lua vim.lsp.buf.type_definition()"
                             :gi "lua vim.lsp.buf.implementation()"
                             :gr "lua vim.lsp.buf.references()"
                             :K "lua vim.lsp.buf.hover()"
                             :<space>k "lua vim.lsp.buf.signature_help()"
                             :<space>rn "lua vim.lsp.buf.rename()"
                             :<space>ca "lua vim.lsp.buf.code_action()"
                             :<space>f "lua vim.lsp.buf.formatting()"
                             :<space>e "lua vim.diagnostic.open_float()"
                             "[d" "lua vim.diagnostic.goto_prev()"
                             "]d" "lua vim.diagnostic.goto_next()"
                             ",q" "lua vim.diagnostic.setqflist()"}
                  :servers {:bashls {}
                            :denols {:root_dir (lspconfig.util.root_pattern :deno.json)}
                            :golangci_lint_ls {}
                            :gopls {}
                            :jsonls {}
                            :kotlin_language_server {}
                            :rust_analyzer {}
                            :taplo {}
                            :terraformls {}
                            :tflint {}
                            :tsserver {:root_dir (lspconfig.util.root_pattern :package.json)}
                            :yamlls {}
                            :zls {}}})

{}

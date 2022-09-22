(local lspconfig (require :lspconfig))
(local lsp-setup (require :lsp-setup))

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

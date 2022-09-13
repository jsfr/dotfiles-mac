(local lspconfig (require :lspconfig))
(local lsp-setup (require :lsp-setup))

(lsp-setup.setup {:servers {:bashls {}
                            :denols {:root_dir (lspconfig.util.root_pattern :deno.json)}
                            :efm {:filetypes [:typescript]}
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
                            :zls {}
                            }})

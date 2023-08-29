(import-macros {: map! : augroup!} :hibiscus.vim)

(local lspconfig (require :lspconfig))
(local lsp-setup (require :lsp-setup))
(local utils (require :lsp-setup.utils))
(local {: builtins : generator &as null-ls} (require :null-ls))
(local {: diagnostics &as helpers} (require :null-ls.helpers))
(local schemastore (require :schemastore))
(local rust-tools (require :rust-tools))
(local typos (require :typos))

(fn on-attach [client bufnr]
  (utils.format_on_save client)
  (let [bufopts {:noremap true :silent true :buffer bufnr}]
    (vim.keymap.set :n :gD vim.lsp.buf.declaration bufopts)
    (vim.keymap.set :n :gd vim.lsp.buf.definition bufopts)
    (vim.keymap.set :n :gt vim.lsp.buf.type_definition bufopts)
    (vim.keymap.set :n :gi vim.lsp.buf.implementation bufopts)
    (vim.keymap.set :n :gr vim.lsp.buf.references bufopts)
    (vim.keymap.set :n :K vim.lsp.buf.hover bufopts)
    (vim.keymap.set :n :<leader>k vim.lsp.buf.signature_help bufopts)
    (vim.keymap.set :n :<leader>rn vim.lsp.buf.rename bufopts)
    (vim.keymap.set :n :<leader>ca vim.lsp.buf.code_action bufopts)
    (vim.keymap.set :n :<leader>f vim.lsp.buf.format bufopts)
    (vim.keymap.set :n :<leader>e vim.diagnostic.open_float bufopts)
    (vim.keymap.set :n "[d" vim.diagnostic.goto_prev bufopts)
    (vim.keymap.set :n "]d" vim.diagnostic.goto_next bufopts)
    (vim.keymap.set :n :<localleader>q vim.diagnostic.setqflist bufopts)))

(null-ls.setup {:on_attach on-attach
                :sources [typos.actions
                          typos.diagnostics
                          builtins.diagnostics.actionlint
                          builtins.diagnostics.zsh
                          builtins.diagnostics.fish
                          builtins.formatting.beautysh]})

(lsp-setup.setup {:default_mappings false
                  :on_attach on-attach
                  :servers {
                            :bashls {}
                            :denols {:root_dir (lspconfig.util.root_pattern :deno.json :deno.jsonc)}
                            :golangci_lint_ls {}
                            :gopls {}
                            :jsonls {:settings {:json {:schemas (schemastore.json.schemas)
                                                       :validate {:enable true}}}}
                            :kotlin_language_server {}
                            :pyright {}
                            :rust_analyzer (rust-tools.setup {:tools {:inlay_hints: {:auto true}}
                                                              :server {:settings {:rust-analyzer {:cargo {:loadOutDirsFromCheck true}
                                                                                                  :procMacro {:enable true}}}}})
                            :taplo {}
                            :terraformls {}
                            :tflint {}
                            :tsserver {:single_file_support false
                                       :root_dir (lspconfig.util.root_pattern :package.json)}
                            :yamlls {:settings {:yaml {:schemas {"https://raw.githubusercontent.com/pleo-io/file-distributor/main/src/files-schema.json" "/.github/templates.yaml"
                                                                 "https://app.opslevel.com/public/opslevel.schema.yml" "/*opslevel.yml"}
                                                       :schemaStore {:enable true
                                                                     :url "https://www.schemastore.org/api/json/catalog.json"}}}}
                            :zls {}
                            ; :nil_ls {}
                            :lua_ls {}
                            :marksman {}
                            }})

{}

(import-macros {: map!} :hibiscus.vim)

(local lspconfig (require :lspconfig))
(local lsp-setup (require :lsp-setup))
(local utils (require :lsp-setup.utils))
(local {: builtins : generator &as null-ls} (require :null-ls))
(local {: diagnostics &as helpers} (require :null-ls.helpers))

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
                :on_attach on-attach
                :sources [;; Diagnostics
                          ; builtins.diagnostics.eslint
                          ; builtins.diagnostics.hadolint
                          ; builtins.diagnostics.fish
                          ; (builtins.diagnostics.actionlint.with {:extra_args ["--config-file"
                          ;                                                     (.. vim.env.XDG_CONFIG_HOME "/actionlint/actionlint.yaml")]})
                          typos

                          ;; Formatters
                          ; builtins.formatting.zigfmt
                          ; builtins.formatting.prettier
                          ; builtins.formatting.fixjson
                          ]})

(lsp-setup.setup {:default_mappings false
                  :on_attach on-attach
                  :servers {
                            :bashls {}
                            :denols {:root_dir (lspconfig.util.root_pattern :deno.json)}
                            :golangci_lint_ls {}
                            :gopls {}
                            :jsonls {}
                            :kotlin_language_server {}
                            :pyright {}
                            :rust_analyzer {}
                            :taplo {}
                            :terraformls {}
                            :tflint {}
                            :tsserver {:root_dir (lspconfig.util.root_pattern :package.json)}
                            :yamlls {}
                            :zls {}
                            }})

{}

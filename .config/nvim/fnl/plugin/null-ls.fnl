(local null-ls (require :null-ls))
(local helpers (require :null-ls.helpers))

;; TODO figure out why this doesn't seem to work
(local augroup (vim.api.nvim_create_augroup :LspFormatting {}))
(fn on-attach [client bufnr]
  (when (client.supports_methods :textDocument/formatting)
    (vim.api.nvim_clear_autocmds {:group augroup :buffer bufnr})
    (vim.api.nvim_create_autocmd :BufWritePre
                                 {:group augroup
                                  :buffer bufnr
                                  :callback #(vim.lsp.buf.formatting_sync)})))

(local typos {:method null-ls.methods.DIAGNOSTICS
              :filetypes {}
              :generator (null-ls.generator {:command :typos
                                             :args ["--format" "brief" "-"]
                                             :to_stdin true
                                             :from_stderr true
                                             :format :line
                                             :on_output (helpers.diagnostics.from_patterns [{:pattern ":(%d+):(%d+): (.*)"
                                                                                             :groups [:row :col :message]}])})})

(null-ls.setup {:debug false
                :sources [;; Diagnostics
                          null-ls.builtins.diagnostics.eslint
                          null-ls.builtins.diagnostics.hadolint
                          null-ls.builtins.diagnostics.fish
                          null-ls.builtins.diagnostics.actionlint
                          typos
                          ;; Formatters
                          null-ls.builtins.formatting.zigfmt
                          null-ls.builtins.formatting.fnlfmt
                          null-ls.builtins.formatting.prettier
                          null-ls.builtins.formatting.fixjson]}
               :on_attach on-attach)

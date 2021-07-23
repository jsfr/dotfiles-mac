(module magic.plugin.lspinstall
  {autoload {core aniseed.core
             li lspinstall
             lc lspconfig}})

(defn on-attach [client bufnr]
  (let [buf-set-keymap #(vim.api.nvim_buf_set_keymap bufnr $...)
        opts {:noremap true :silent true}]
  (buf_set_keymap :n :gD "<Cmd>lua vim.lsp.buf.declaration()<CR>" opts)
  (buf_set_keymap :n :gd "<Cmd>lua vim.lsp.buf.definition()<CR>" opts)
  (buf_set_keymap :n :K "<Cmd>lua vim.lsp.buf.hover()<CR>" opts)
  (buf_set_keymap :n :gi "<Cmd>lua vim.lsp.buf.implementation()<CR>" opts)
  (buf_set_keymap :n :<localleader>k "<Cmd>lua vim.lsp.buf.signature_help()<CR>" opts)
  (buf_set_keymap :n :<localleader>wa "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>" opts)
  (buf_set_keymap :n :<localleader>wr "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>" opts)
  (buf_set_keymap :n :<localleader>wl "<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>" opts)
  (buf_set_keymap :n :<localleader>D "<Cmd>lua vim.lsp.buf.type_definition()<CR>" opts)
  (buf_set_keymap :n :<localleader>rn "<Cmd>lua vim.lsp.buf.rename()<CR>" opts)
  (buf_set_keymap :n :<localleader>ca "<Cmd>lua vim.lsp.buf.code_action()<CR>" opts)
  (buf_set_keymap :n :gr "<Cmd>lua vim.lsp.buf.references()<CR>" opts)
  (buf_set_keymap :n :<localleader>e "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" opts)
  (buf_set_keymap :n "[d" "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" opts)
  (buf_set_keymap :n "]d" "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>" opts)
  (buf_set_keymap :n :<localleader>q "<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" opts)
  (buf_set_keymap :n :<localleader>f "<Cmd>lua vim.lsp.buf.formatting()<CR>" opts)))

(defn setup-servers []
  (li.setup)
  (let [server-names (li.installed_servers)]
    (each [_ server-name (pairs server-names)]
      (let [server (. lc server-name)]
        (if (= server-name :efm)
         (server.setup {:on_attach on-attach
                        :filetypes [:typescript]})
         (server.setup {:on_attach on-attach}))))))

(defn post-install-hook []
  (setup-servers)
  (vim.cmd "bufdo e"))

(setup-servers)
(set li.post_install_hook post-install-hook)

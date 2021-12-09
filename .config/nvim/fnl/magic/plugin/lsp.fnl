(module magic.plugin.lspinstall
  {autoload {core aniseed.core
             lsp-installer nvim-lsp-installer
             lspconfig lspconfig
             cmp_nvim_lsp cmp_nvim_lsp}})

(local capabilities (cmp_nvim_lsp.update_capabilities (vim.lsp.protocol.make_client_capabilities)))

(defn- on-attach [client bufnr]
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

(defn- merge-tables [tbl1 tbl2]
  (each [key value (pairs tbl2)]
    (tset tbl1 key value)))

(defn- setup-server [server]
  (let [default-opts {:capabilities capabilities
                      :on_attach on-attach}
        all-server-opts {:efm {:filetypes [:typescript]}}
        server-opts (. all-server-opts server)]
    (when (~= server-opts nil)
      (merge-tables default-opts server-opts))
    (server:setup default-opts)))

(lsp-installer.on_server_ready setup-server)

(local lspconfig (require :lspconfig))
(local mason-lspconfig (require :mason-lspconfig))
(local schemastore (require :schemastore))

(fn on-attach [_ bufnr]
  (let [bufopts {:noremap true :silent true :buffer bufnr}]
    (vim.keymap.set :n :gD vim.lsp.buf.declaration bufopts)
    (vim.keymap.set :n :gd vim.lsp.buf.definition bufopts)
    (vim.keymap.set :n :gt vim.lsp.buf.type_definition bufopts)
    (vim.keymap.set :n :gi vim.lsp.buf.implementation bufopts)
    (vim.keymap.set :n :gr vim.lsp.buf.references bufopts)
    (vim.keymap.set :n :K vim.lsp.buf.hover bufopts)
    (vim.keymap.set :n :<leader>k vim.lsp.buf.signature_help bufopts)
    (vim.keymap.set :n :<leader>r vim.lsp.buf.rename bufopts)
    (vim.keymap.set :n :<leader>a vim.lsp.buf.code_action bufopts)
    (vim.keymap.set :n :<leader>f vim.lsp.buf.format bufopts)
    (vim.keymap.set :n :<leader>e vim.diagnostic.open_float bufopts)
    (vim.keymap.set :n "[d" vim.diagnostic.goto_prev bufopts)
    (vim.keymap.set :n "]d" vim.diagnostic.goto_next bufopts)
    (vim.keymap.set :n :<leader>q vim.diagnostic.setqflist bufopts)))

(local servers {:bashls {}
                :golangci_lint_ls {}
                :gopls {}
                :jsonls {:settings {:json {:schemas (schemastore.json.schemas)
                                           :validate {:enable true}}}}
                :kotlin_language_server {}
                :taplo {}
                :rust_analyzer {:disabled true}
                :terraformls {}
                :tflint {}
                :codeqlls {}
                :eslint {}
                :ts_ls {:disabled true}
                :yamlls {:settings {:yaml {:schemas {"/Users/jens/Repos/github.com/pleo-io/file-distributor/src/files-schema.json" "/.github/templates.yaml"
                                                     "https://app.opslevel.com/public/opslevel.schema.yml" "/*opslevel.yml"}
                                           :schemaStore {:enable true
                                                         :url "https://www.schemastore.org/api/json/catalog.json"}}}}
                :lua_ls {:settings {:Lua {:workspace {:library {"/Users/jens/.hammerspoon/Spoons/EmmyLua.spoon/annotations" true}}}}}
                :typos_lsp {}
                :ruff_lsp {}
                :marksman {}
                :dockerls {}
                :htmx {}
                :html {}
                :fennel_language_server {:settings {:fennel {:diagnostics {:globals [:vim]}}}}
                :docker_compose_language_service {}})

(fn get-server-config [server-name]
  (local config (. servers server-name))
  (set config.on_attach on-attach)
  config)

(fn get-server-setup-fn [server-name]
  (. (. lspconfig server-name) :setup))

(fn setup-server [server-name] 
  (local config (get-server-config server-name))
  (local setup-fn (get-server-setup-fn server-name))
  (when (not= config.disabled true)
      (setup-fn config)))

(fn get-servers []
  (icollect [server _ (pairs servers)]
    server))

(mason-lspconfig.setup {:ensure_installed (get-servers)
                        :automatic_installation true})
(mason-lspconfig.setup_handlers [setup-server])

{}

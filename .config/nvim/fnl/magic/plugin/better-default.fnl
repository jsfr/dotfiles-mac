(module magic.plugin.better-default
  {autoload {nvim aniseed.nvim}
   require-macros [magic.macros]})

(set vim.g.vim_better_default_key_mapping 0)
(set vim.g.vim_better_default_persistent_undo 1)
(set vim.g.vim_better_default_backup_on 1)

(defn- set-options [...]
  (each [_ v (ipairs [...])]
    (let [[opt val] v]
      (tset vim.o opt val))))

(set-options
  [:breakindent true]
  [:foldmarker "#region,#endregion"]
  [:foldmethod :marker]
  [:inccommand :split]
  [:joinspaces false]
  [:list true]
  [:magic true]
  [:mouse :a]
  [:shell :/bin/bash]
  [:showbreak "↳\\_"]
  [:spell false]
  [:termguicolors true]
  [:textwidth 0]
  [:timeout false]
  [:timeoutlen 350]
  [:updatetime 2000]
  [:showmode false])

(augroup better-default-config
  (nvim.ex.autocmd :InsertEnter "*" "set timeout")
  (nvim.ex.autocmd :InsertLeave "*" "set notimeout"))


(module magic.plugin.projectroot
  {autoload {nvim aniseed.nvim}
   require-macros [magic.macros]})

(defn auto-project-root-cd []
  (let [ft vim.bo.filetype]
    (when (~= ft :help)
      (vim.fn.ProjectRootCD))))

(augroup projectroot-config 
  (nvim.ex.autocmd :BufEnter "*" 
                   (.. "call v:lua.require('" *module-name* "')['auto-project-root-cd']()")))

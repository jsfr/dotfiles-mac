(module magic.plugin.fzf
  {autoload {nvim aniseed.nvim
             nu aniseed.nvim.util
             vimp vimp}})

(defn dotfiles []
  (nvim.command (..
                  "call fzf#run(fzf#wrap({"
                  "'source': 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME ls-files',"
                  "'sink': 'e',"
                  "'dir': '$HOME'"
                  "}))")))

;; TODO why is this needed?
(set vim.g.mapleader " ")

;; Quick access to all dotfiles
(vimp.nnoremap :<leader>. dotfiles)
(module magic.plugin.selector
  {autoload {vimp vimp
             fzy fzy}})

(set vim.g.mapleader " ")
(vimp.nnoremap [:silent] :<leader>ff (fn [] (fzy.execute :fd fzy.sinks.edit_file)))
(vimp.nnoremap [:silent] :<leader>fb (fn [] (fzy.actions.buffers)))
(vimp.nnoremap [:silent] :<leader>ft (fn [] (fzy.try fzy.actions.lsp_tags fzy.actions.buf_tags)))
(vimp.nnoremap [:silent] :<leader>fg (fn [] (fzy.execute "git ls-files" fzy.sinks.edit_file)))
(vimp.nnoremap [:silent] :<leader>fq (fn [] (fzy.actions.quickfix)))
(vimp.nnoremap [:silent] :<leader>f/ (fn [] (fzy.actions.buf_lines)))

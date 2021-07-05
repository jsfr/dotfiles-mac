(module magic.plugin.format
  {autoload {f formatter
             nvim aniseed.nvim}
   require-macros [magic.macros]})

(let [typescript (fn [] {:exe :prettier
                         :args [:--stdin-filepath (vim.api.nvim_buf_get_name 0)
                                :--parser :typescript]
                         :stdin true})
      filetype {:typescript [typescript]}
      config {:filetype filetype}]
  (f.setup config))

(vim.api.nvim_exec
  (.. "augroup FormatAutogroup\n" 
      "autocmd!\n" 
      "autocmd BufWritePost *.ts FormatWrite\n"
      "augroup END")
  true)

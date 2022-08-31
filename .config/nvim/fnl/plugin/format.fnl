(import-macros {: augroup!} :hibiscus.vim)

(local f (require :formatter))

(fn file-path []
  (vim.api.nvim_buf_get_name 0))

(fn typescript-config []
  {:exe :prettier
   :args [:--stdin-filepath (file-path)
          :--parser :typescript]
   :stdin true})

(fn zig-config []
  {:exe :zig
   :args [:fmt (file-path)]
   :stdin false})

(f.setup {:filetype {:typescript [typescript-config]
                     :zig [zig-config]}})

(augroup! :FormatAutoGroup
          [[BufWritePost] [zig typescript] :FormatWrite])

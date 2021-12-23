(module magic.plugin.format
  {autoload {f formatter
             nvim aniseed.nvim}
   require-macros [magic.macros]})

(defn- file-path []
  (nvim.buf_get_name 0))

(defn- typescript-config []
  {:exe :prettier
   :args [:--stdin-filepath (file-path)
          :--parser :typescript]
   :stdin true})

(defn- zig-config []
  {:exe :zig
   :args [:fmt (file-path)]
   :stdin false})

(f.setup {:filetype {:typescript [typescript-config]
                     :zig [zig-config]}})

(let [commands (.. "augroup FormatAutogroup\n" 
                   "autocmd!\n" 
                   "autocmd BufWritePost *.ts,*.zig FormatWrite\n"
                   "augroup END")]
  (nvim.exec commands true))

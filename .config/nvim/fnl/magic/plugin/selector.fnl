(module magic.plugin.selector
  {autoload {vimp vimp
             nvim aniseed.nvim
             string aniseed.string
             fzy fzy}})

(defn- keep-buffer? [buffer]
  (and (= (vim.fn.buflisted buffer) 1)
       (~= (nvim.buf_get_option buffer :buftype) :quickfix)))

(defn- get-buffers []
  (vim.tbl_filter keep-buffer? (nvim.list_bufs)))

(defn- set-buffer [buffer]
  (when buffer
    (nvim.set_current_buf buffer)))

(defn- format-buffer-name [buffer]
  (let [fullname (nvim.buf_get_name buffer)
        name-length (length fullname)
        name (if (= 0 name-length)
               (.. "[No Name] (" (nvim.buf_get_option buffer :buftype) ")")
               (fzy.format_bufname buffer))
        modified (nvim.buf_get_option buffer :modified)]
    (if modified (.. name " [+]") name)))

(vimp.nnoremap [:silent] :<leader>ff (fn [] (fzy.execute :fd fzy.sinks.edit_file)))
(vimp.nnoremap [:silent] :<leader>fb (fn [] (fzy.pick_one (get-buffers) "Buffers> " format-buffer-name set-buffer)))
(vimp.nnoremap [:silent] :<leader>ft (fn [] (fzy.try fzy.actions.lsp_tags fzy.actions.buf_tags)))
(vimp.nnoremap [:silent] :<leader>fg (fn [] (fzy.execute "git ls-files" fzy.sinks.edit_file)))
(vimp.nnoremap [:silent] :<leader>fq (fn [] (fzy.actions.quickfix)))
(vimp.nnoremap [:silent] :<leader>f/ (fn [] (fzy.actions.buf_lines)))
(vimp.map_command :Rg (fn [...] (fzy.execute (.. "rg --no-heading --trim -inH \"" (string.join " " [...]) "\" .") fzy.sinks.edit_live_grep)))

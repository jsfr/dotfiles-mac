;; Copy search highlight group definition so we can clear and re-link to it
;; when in different states of searching.
(vim.api.nvim_create_autocmd
  :ColorScheme
  {:callback #(let [search (vim.api.nvim_get_hl 0 {:name :Search})]
                (vim.api.nvim_set_hl 0 :CurSearch {:link :IncSearch})
                (vim.api.nvim_set_hl 0 :SearchCurrentN search)
                (vim.api.nvim_set_hl 0 :Search {:link :SearchCurrentN}))})

(vim.api.nvim_create_autocmd
  :CmdlineEnter
  {:pattern "/,\\?"
   :callback (fn []
               ;; When searching via :/, enable all search highlights
               (set vim.opt.hlsearch true)
               (set vim.opt.incsearch true)
               (vim.api.nvim_set_hl 0 :Search {:link :SearchCurrentN}))})

(vim.api.nvim_create_autocmd
  :CmdlineLeave
  {:pattern "/,\\?"
   :callback (fn []
               ;; When leaving after :/, clear Search highlights (NOT CurSearch).
               ;; May have side effects if plugins link to Search
               (vim.api.nvim_set_hl 0 :Search {})
               ;; turn on hlsearch after the cursor move runs nohlsearch
               ;; Could also use a shared guard flag variable
               (vim.defer_fn #(set vim.opt.hlsearch true) 5))})

(vim.api.nvim_create_autocmd
  [:InsertEnter :CursorMoved]
  ;; Must run :nohlsearch outside of autocmd, see :h autocmd-searchpat
  {:callback #(vim.schedule #(vim.cmd :nohlsearch))})

(fn handle-n-N [key]
  (let [other #(match $1 :n :N :N :n)
        feed #(vim.api.nvim_feedkeys $1 :n true)]
    (match vim.v.searchforward
      0 (feed (other key))
      1 (feed key)))
  ;; Wait a moment, so the cursor moves, the CursorMoved autocmd triggers, then
  ;; we flip hlsearch back on.
  ;; You may prefer to use a flag var instead of defer_fn.
  (vim.defer_fn #(set vim.opt.hlsearch true) 5))

(vim.keymap.set [:n] :n #(handle-n-N :n))
(vim.keymap.set [:n] :N #(handle-n-N :N))

(module magic.plugin.mru-buffer
  {})

;; Go to mru buffer
(defn- buffer-listed? [buffer]
  (let [buffer-number (vim.fn.bufnr buffer)
        is-listed (vim.fn.buflisted buffer-number)]
    (= is-listed 1)))

(defn mru-buffer []
  (if (buffer-listed? :#)
    (vim.cmd "b #")
    (vim.cmd "bprev")))

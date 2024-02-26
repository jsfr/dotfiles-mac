(import-macros {: augroup!} :hibiscus.vim)

(local mason-nvim-lint (require :mason-nvim-lint))
(local lint (require :lint))

(set lint.linters_by_ft {:dockerfile [:hadolint]
                         :fennel [:fennel]
                         :fish [:fish]})

(mason-nvim-lint.setup {:ensure_installed [:hadolint]
                        :automatic_installation false})

(fn try-lint [] 
    (lint.try_lint))
(augroup! :nvim-lint-group [[BufWritePost] "*" `try-lint])

{}

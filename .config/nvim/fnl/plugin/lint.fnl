(import-macros {: augroup!} :hibiscus.vim)

(local mason-nvim-lint (require :mason-nvim-lint))
(local lint (require :lint))

(set lint.linters_by_ft {:dockerfile [:hadolint]
                         :fennel [:fennel]
                         :fish [:fish]
                         :ghaction [:actionlint]
                         :html [:htmlhint]
                         })

(mason-nvim-lint.setup {:ensure_installed [:hadolint
                                           :actionlint
                                           :htmlhint]
                        :automatic_installation false})

(vim.filetype.add {:pattern {".*/.github/workflows/.*%.yml" :yaml.ghaction
                             ".*/.github/workflows/.*%.yaml" :yaml.ghaction}})

(fn try-lint [] 
    (lint.try_lint))
(augroup! :nvim-lint-group [[BufWritePost] "*" `try-lint])

{}

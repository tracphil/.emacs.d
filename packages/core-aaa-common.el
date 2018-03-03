(use-package f
  :ensure t
  )

(add-hook 'sh-mode-hook
          (lambda ()
            (sh-electric-here-document-mode -1))
          )
